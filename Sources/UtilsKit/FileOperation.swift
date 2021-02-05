//
//  FileOperation.swift
//
//  Created by Stuart on 2018/12/3.
//

import UIKit
import Photos
import MobileCoreServices

public struct FilePath {
    
    private init() {}
    
    /// Documents目录
    public static let documents = NSHomeDirectory() + "/Documents/"
    /// Library目录
    public static let library = NSHomeDirectory() + "/Library/"
    /// Cache目录
    public static let caches = NSHomeDirectory() + "/Library/Caches/"
    /// Preferences目录
    public static let preferences = NSHomeDirectory() + "/Library/Preferences/"
    /// Tmp目录
    public static let temp = NSTemporaryDirectory()
    
}

public protocol FileOperation {}

public extension FileOperation {
    
    /// 根据扩展名获取文件MIMEType
    ///
    /// - Parameter fileExtension: 扩展名
    /// - Returns: MIMEType
    func fileMIMEType(fileExtension: String) -> String {
        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtension as CFString, nil)?.takeRetainedValue(), let mimeType = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
            return mimeType as String
        }
        return "application/octet-stream"
    }
    
    /// 计算文件夹大小
    ///
    /// - Parameters:
    ///   - path: 文件夹路径
    ///   - completionHandler: 计算完成后回调方法，参数为计算得到的文件夹大小（单位为B）
    func getFolderSize(path: String, completionHandler: @escaping (Int) -> Void) {
        // 判断是否是文件夹
        var isDirector: ObjCBool = false
        let fileExist: Bool = FileManager.default.fileExists(atPath: path, isDirectory: &isDirector)
        if !fileExist || !isDirector.boolValue {
            return
        }
        DispatchQueue.global().async {
            let subPaths = FileManager.default.subpaths(atPath: path)
            var totoalSize: Int = 0
            for subPath in subPaths ?? [] {
                let filePath = path + "/\(subPath)"
                // 判断是否是隐藏文件
                if filePath.contains(".DS") {
                    continue
                }
                // 判断是否是文件夹
                var isDirector: ObjCBool = false
                let fileExist: Bool = FileManager.default.fileExists(atPath: filePath, isDirectory: &isDirector)
                if !fileExist || isDirector.boolValue {
                    continue
                }
                do {
                    let attributes = try FileManager.default.attributesOfItem(atPath: filePath)
                    // 最后获取size
                    totoalSize += attributes[.size] as! Int
                } catch {}
            }
            DispatchQueue.main.async {
                completionHandler(totoalSize)
            }
        }
    }
    
    /// 清空文件夹
    ///
    /// - Parameters:
    ///   - path: 文件夹路径
    ///   - completionHandler: 完成后回调方法
    func emptyDirectory(path: String, completionHandler: @escaping () -> Void) {
        // 判断是否是文件夹
        var isDirector: ObjCBool = false
        let fileExist: Bool = FileManager.default.fileExists(atPath: path, isDirectory: &isDirector)
        if !fileExist || !isDirector.boolValue {
            return
        }
        DispatchQueue.global().async {
            let subPaths = FileManager.default.subpaths(atPath: path)
            for subPath in subPaths ?? [] {
                let filePath = path + "/\(subPath)"
                if FileManager.default.fileExists(atPath: filePath) {
                    do {
                        try FileManager.default.removeItem(atPath: filePath)
                    } catch {}
                }
            }
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
    
    /// 将数据base64加密后保存到Cache目录
    ///
    /// - Parameters:
    ///   - data: 要保存的数据
    ///   - fileName: 文件名
    /// - Throws: 保存文件时的错误
    func saveDataToBase64EncodedCache(data: Data?, fileName: String) throws {
        if let encodeData = data?.base64EncodedData() {
            try encodeData.write(to: URL(fileURLWithPath: FilePath.caches + "/\(fileName)"))
        }
    }
    
    /// 获取base64加密文件的数据
    ///
    /// - Parameter fileName: 文件名
    /// - Returns: 文件中的数据
    func getDataFromBase64EncodedCache(fileName: String) -> Data? {
        if let fileData = FileManager.default.contents(atPath: FilePath.caches + "/\(fileName)"), let decodedData = Data(base64Encoded: fileData) {
            return decodedData
        } else {
            return nil
        }
    }
    
    /// 保存文件到相册
    /// - Parameters:
    ///   - type: 文件类型
    ///   - data: 文件数据
    ///   - completeHandler: 完成回调
    func saveAsset(type: PHAssetResourceType, data: Data, completeHandler: ((Result<Void, Error>) -> Void)? = nil) {
        PHPhotoLibrary.shared().performChanges {
            PHAssetCreationRequest.forAsset().addResource(with: type, data: data, options: nil)
        } completionHandler: { success, error in
            if let error = error {
                completeHandler?(.failure(error))
            } else {
                completeHandler?(.success(()))
            }
        }
    }
    
    /// 保存文件到相册
    /// - Parameters:
    ///   - type: 文件类型
    ///   - fileURL: 文件路径
    ///   - completeHandler: 完成回调
    func saveAsset(type: PHAssetResourceType, fileURL: URL, completeHandler: ((Result<Void, Error>) -> Void)? = nil) {
        PHPhotoLibrary.shared().performChanges {
            PHAssetCreationRequest.forAsset().addResource(with: type, fileURL: fileURL, options: nil)
        } completionHandler: { success, error in
            DispatchQueue.main.async {
                if let error = error {
                    completeHandler?(.failure(error))
                } else {
                    completeHandler?(.success(()))
                }
            }
        }
    }
    
}

public extension String {
    
    /// 根据路径获取文件名
    var fileName: String { URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent }
    /// 根据路径获取扩展名
    var fileExtension: String { URL(fileURLWithPath: self).pathExtension }
    
}

public struct FileDataModel {
    
    /// 文件数据
    var fileData: Data
    /// 文件名
    var fileName: String
    /// 文件扩展名
    var fileExtension: String
    /// 模块名
    var moduleName: String
    
}
