//
//  Tool.swift
//
//  Created by Stuart on 2018/10/10.
//

import Foundation
import CommonCrypto

public extension String {
    
    /// MD5值
    var md5String: String {
        let cStr = self.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!, (CC_LONG)(strlen(cStr!)), buffer)
        var md5String = ""
        for i in 0..<16 {
            md5String += String(format: "%02x", buffer[i])
        }
        free(buffer)
        return md5String
    }
    
    /// 字符串是否符合正则表达式
    ///
    /// - Parameter regex: 正则表达式
    /// - Returns: 是否符合正则表达式
    func isValid(regex: Regex) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex.rawValue)
        return predicate.evaluate(with: self)
    }
    
    /// 获取正则表达式匹配结果
    ///
    /// - Parameters:
    ///   - regex: 正则表达式
    ///   - options: 正则表达式选项
    /// - Returns: 匹配结果
    func match(regex: Regex, options: NSRegularExpression.Options = []) -> [String] {
        let regularExpression = try? NSRegularExpression(pattern: regex.rawValue, options: options)
        return regularExpression?.matches(in: self, options: [], range: NSRange(location: 0, length: count)).compactMap { result -> String? in
            guard let range = Range(result.range, in: self) else { return nil }
            return String(self[range])
        } ?? []
    }
    
    /// 正则表达式替换字符串
    ///
    /// - Parameters:
    ///   - regex: 正则表达式
    ///   - options: 正则表达式选项
    ///   - template: 替换匹配实例时使用的替换模板
    /// - Returns: 替换完成后的字符串
    func replaceMatch(regex: Regex, options: NSRegularExpression.Options = [], template: String) -> String {
        let regularExpression = try? NSRegularExpression(pattern: regex.rawValue, options: options)
        return regularExpression?.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length: self.count), withTemplate: template) ?? ""
    }
    
}

public struct Regex: RawRepresentable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
}

public extension Regex {
    
    /// 邮箱
    static let email = Regex(rawValue: #"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}"#)
    /// 网址
    static let url = Regex(rawValue: #"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"#)
    /// 手机
    static let phone = Regex(rawValue: #"^[1]\d{10}$"#)
    /// 固定电话
    static let landline = Regex(rawValue: #"^\d{3,6}$|^\d{7,8}$|^\d{3}-\d{8}$|^\d{4}-\d{7}$"#)
    /// 香港手机
    static let hkPhone = Regex(rawValue: #"^[6|5|9|8]\d{7}$"#)
    /// 六位数字验证码
    static let sixdigitOneTimeCode = Regex(rawValue: #"^\d{6}$"#)
    /// 四位数字验证码
    static let fourdigitOneTimeCode = Regex(rawValue: #"^\d{4}$"#)
    /// 身份证
    static let idCard = Regex(rawValue: #"^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$"#)
    /// 香港护照
    static let hkPassport = Regex(rawValue: #"^[0-9a-zA-Z()]+$"#)
    /// 不含Emoji和符号
    static let notEmoji = Regex(rawValue: #"^([\u4E00-\u9FA5]|\w)$"#)
    /// ASCII码（即只包含字母、数字及基本符号）
    static let ascii = Regex(rawValue: #"^[\x00-\xff]+$"#)
    /// 纯数字
    static let number = Regex(rawValue: #"^\d+$"#)
    /// 纯字母和下划线
    static let word = Regex(rawValue: #"^\w+$"#)
    /// 纯字母
    static let letter = Regex(rawValue: #"^[a-zA-Z]+$"#)
    /// 正保留两位小数
    static let positiveTwoDecimals = Regex(rawValue: #"(^[1-9](\d+)?(\.\d{1,2})?$)|(^0$)|(^\d\.\d{1,2}$)"#)
    /// 负保留两位小数
    static let negativeTwoDecimals = Regex(rawValue: #"(^-?[1-9](\d+)?(\.\d{1,2})?$)|(^-?0$)|(^-?\d\.\d{1,2}$)"#)
    /// 不含除空白字符外的其他字符
    static let allEmpty = Regex(rawValue: #"^\s*$"#)
    /// 空白字符字符
    static let empty = Regex(rawValue: #"\s*"#)
    /// 非数字
    static let nonnumeric = Regex(rawValue: #"\D"#)
    /// 匹配一个及以上的换行符
    static let newline = Regex(rawValue: #"\n+"#)
    
}

public extension Array {
    
    subscript(safe index: Int) -> Element? {
        guard !isEmpty else { return nil }
        return (0 <= index && index < count) ? self[index] : nil
    }
    
    func allIndex(isInclude: (Element) -> Bool) -> [Index] {
        var indexs = [Index]()
        enumerated().forEach { (index, element) in
            if isInclude(element) {
                indexs.append(index)
            }
        }
        return indexs
    }
    
}

public extension Optional where Wrapped: Collection {
    
    var count: Int {
        switch self {
        case .some(let wrap):
            return wrap.count
        case .none:
            return 0
        }
    }
    
    var isEmpty: Bool {
        switch self {
        case .some(let wrap):
            return wrap.isEmpty
        case .none:
            return true
        }
    }
    
}

public extension NSObject {
    
    var propertyNameList: [String] {
        var outCount: UInt32 = 0
        guard let propertyList = class_copyPropertyList(type(of: self), &outCount) else { return [] }
        defer {
            free(propertyList)
        }
        var propertyArray = [String]()
        for i in 0..<Int(outCount) {
            let cName = property_getName(propertyList[i])
            if let propertyName = String(utf8String: cName), !propertyName.isEmpty {
                propertyArray.append(propertyName)
            }
        }
        propertyArray = Array(NSOrderedSet(array: propertyArray)) as! [String]
        return propertyArray
    }
    var methodNameList: [String] {
        var outCount: UInt32 = 0
        guard let methodList = class_copyMethodList(type(of: self), &outCount) else { return [] }
        defer {
            free(methodList)
        }
        var methodArray = [String]()
        for i in 0..<Int(outCount) {
            let cName = sel_getName(method_getName(methodList[i]))
            if let methodName = String(utf8String: cName), !methodName.isEmpty {
                methodArray.append(methodName)
            }
        }
        methodArray = Array(NSOrderedSet(array: methodArray)) as! [String]
        return methodArray
    }
    
}
