//
//  Coder.swift
//
//  Created by Stuart on 2018/10/12.
//

import Foundation

public protocol CodableEncoder: FileOperation {}

public extension CodableEncoder {
    
    /// 字典转Form HTTPBody Data
    ///
    /// - Parameter params: 存有httpBody表单的字典
    /// - Returns: 转化后的数据
    func dictionaryToData(params: [String: String]) -> Data {
        let paramArray = params.map { (key, value) in "\(key)=\(value)" }
        let body = paramArray.joined(separator: "&")
        let data = body.data(using: String.Encoding.utf8)!
        return data
    }
    
    /// 带文本文件转HTTPBody Data
    ///
    /// - Parameters:
    ///   - params: 存有httpBody表单的字典
    ///   - fileArray: 文件数组
    ///   - boundary: 分割符
    /// - Returns: 转化后的数据
    func dictionaryAndFileToData(params: [String: String]?, fileKey: String, fileArray: [FileDataModel], boundary: String) -> Data {
        var body = ""
        var httpBody = Data()
        if let noNilParams = params {
            noNilParams.forEach { (key, value) in
                body += "--\(boundary)\r\nContent-Disposition: form-data; name=\"\(key)\"\r\n\r\n\(value)\r\n"
            }
            httpBody.append(body.data(using: String.Encoding.utf8)!)
        }
        fileArray.forEach { (file) in
            httpBody.append("--\(boundary)\r\nContent-Disposition: form-data; name=\"\(fileKey)\"; filename=\"\(file.fileName)-\(UUID().uuidString).\(file.fileExtension)\"\r\nContent-Type: \(fileMIMEType(fileExtension: file.fileExtension))\r\n\r\n".data(using: String.Encoding.utf8)!)
            httpBody.append(file.fileData)
            httpBody.append("\r\n".data(using: String.Encoding.utf8)!)
        }
        httpBody.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        return httpBody
    }
    
    /// 模型转JSON Data
    ///
    /// - Parameter model: 模型
    /// - Returns: 转化后的数据
    func modelToData<T: Encodable>(model: T?) -> Data? {
        guard let model = model else { return nil }
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.dateEncodingStrategy = .millisecondsSince1970
            let encodeData = try jsonEncoder.encode(model)
            return encodeData
        } catch {
            return nil
        }
    }
    
    /// 字典转JSON Data
    ///
    /// - Parameter dictionary: 字典
    /// - Returns: 转化后的数据
    func dictionaryToData(dictionary: [String: Any?]) -> Data? {
        if JSONSerialization.isValidJSONObject(dictionary) {
            do {
                let encodeData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
                return encodeData
            } catch {
                return nil
            }
        }
        return nil
    }
    
}

public protocol CodableDecoder {}

public extension CodableDecoder {
    
    /// Data转模型
    ///
    /// - Parameters:
    ///   - data: 数据
    ///   - model: 模型类型
    /// - Returns: 转化后的模型
    func dataToModel<T: Codable>(data: Data?, model: T.Type) -> T? {
        if let jsonData = data {
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .millisecondsSince1970
                let decodeData = try jsonDecoder.decode(model, from: jsonData)
                return decodeData
            } catch {
                #if DEBUG
                print(error)
                #endif
                return nil
            }
        }
        return nil
    }
    
    /// JSONData转字典
    ///
    /// - Parameter data: 数据
    /// - Returns: 转化后的字典
    func dataToDictionary(data: Data?) -> [String: Any]? {
        if let jsonData = data {
            let dictionary = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any]
            return dictionary
        }
        return nil
    }
    
    /// JSONData转数组
    ///
    /// - Parameter data: 数据
    /// - Returns: 转化后的数组
    func dataToArray(data: Data?) -> [Any]? {
        if let jsonData = data {
            let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [Any]
            return array
        }
        return nil
    }
    
}
