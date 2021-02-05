//
//  UIDevice+UIKitUtils.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

public extension UIDevice {
    
    /// UUID
    var uuid: String {
        let searchQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword, kSecAttrService: "UniqueDeviceService", kSecAttrAccount: "UUID", kSecMatchLimit: kSecMatchLimitOne, kSecReturnAttributes: true, kSecReturnData: true]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(searchQuery as CFDictionary, &item)
        if status == errSecSuccess, let existingItem = item as? [String: AnyObject], let passwordData = existingItem[kSecValueData as String] as? Data {
            if let password = String(data: passwordData, encoding: String.Encoding.utf8), !password.isEmpty {
                return password
            } else {
                let uniqueString = UUID().uuidString
                let updateQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword, kSecAttrService: "UniqueDeviceService", kSecAttrAccount: "UUID"]
                let attributes: [CFString: Any] = [kSecValueData: uniqueString.data(using: .utf8)!]
                SecItemUpdate(updateQuery as CFDictionary, attributes as CFDictionary)
                return uniqueString
            }
        } else if status == errSecItemNotFound {
            let uniqueString = UUID().uuidString
            let addQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword, kSecAttrService: "UniqueDeviceService", kSecAttrAccount: "UUID", kSecValueData: uniqueString.data(using: .utf8)!]
            SecItemAdd(addQuery as CFDictionary, nil)
            return uniqueString
        } else {
            return UUID().uuidString
        }
    }
    /// 是否是iOS版本App运行在Mac上
    var isiOSAppOnMac: Bool {
        if #available(iOS 14.0, *) {
            return ProcessInfo.processInfo.isiOSAppOnMac
        } else {
            return false
        }
    }
    var hardwareString: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce(into: "") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return }
            identifier += String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    var modelName: Generation {
        switch hardwareString {
        #if os(iOS)
        case "iPod1,1": return .iPodtouch
        case "iPod2,1": return .iPodtouch2
        case "iPod3,1": return .iPodtouch3
        case "iPod4,1": return .iPodtouch4
        case "iPod5,1": return .iPodtouch5
        case "iPod7,1": return .iPodtouch6
        case "iPod9,1": return .iPodtouch7
        case "iPhone1,1": return .iPhone
        case "iPhone1,2": return .iPhone3G
        case "iPhone2,1": return .iPhone3GS
        case "iPhone3,1", "iPhone3,2", "iPhone3,3": return .iPhone4
        case "iPhone4,1": return .iPhone4S
        case "iPhone5,1", "iPhone5,2": return .iPhone5
        case "iPhone5,3", "iPhone5,4": return .iPhone5C
        case "iPhone6,1", "iPhone6,2": return .iPhone5S
        case "iPhone7,2": return .iPhone6
        case "iPhone7,1": return .iPhone6Plus
        case "iPhone8,1": return .iPhone6S
        case "iPhone8,2": return .iPhone6SPlus
        case "iPhone8,4": return .iPhoneSE
        case "iPhone9,1", "iPhone9,3": return .iPhone7
        case "iPhone9,2", "iPhone9,4": return .iPhone7Plus
        case "iPhone10,1", "iPhone10,4": return .iPhone8
        case "iPhone10,2", "iPhone10,5": return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6": return .iPhoneX
        case "iPhone11,2": return .iPhoneXS
        case "iPhone11,6": return .iPhoneXSMax
        case "iPhone11,8": return .iPhoneXR
        case "iPhone12,1": return .iPhone11
        case "iPhone12,3": return .iPhone11Pro
        case "iPhone12,5": return .iPhone11ProMax
        case "iPhone12,8": return .iPhoneSE2
        case "iPhone13,1": return .iPhone12mini
        case "iPhone13,2": return .iPhone12
        case "iPhone13,3": return .iPhone12Pro
        case "iPhone13,4": return .iPhone12ProMax
        case "iPad1,1": return .iPad
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return .iPad2
        case "iPad2,5", "iPad2,6", "iPad2,7": return .iPadmini
        case "iPad3,1", "iPad3,2", "iPad3,3": return .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6": return .iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3": return .iPadAir
        case "iPad4,4", "iPad4,5", "iPad4,6": return .iPadmini2
        case "iPad5,3", "iPad5,4": return .iPadAir2
        case "iPad4,7", "iPad4,8", "iPad4,9": return .iPadmini3
        case "iPad5,1", "iPad5,2": return .iPadmini4
        case "iPad6,7", "iPad6,8": return .iPadPro_12_9
        case "iPad6,3", "iPad6,4": return .iPadPro_9_7
        case "iPad6,11", "iPad6,12": return .iPad5
        case "iPad7,1", "iPad7,2": return .iPadPro2_12_9
        case "iPad7,3", "iPad7,4": return .iPadPro_10_5
        case "iPad7,5", "iPad7,6": return .iPad6
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return .iPadPro3_12_9
        case "iPad8,11", "iPad8,12": return .iPadPro4_12_9
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return .iPadPro_11
        case "iPad8,9", "iPad8,10": return .iPadPro2_11
        case "iPad7,11", "iPad 7,12": return .iPad7
        case "iPad11,1", "iPad11,2": return .iPadmini5
        case "iPad11,3", "iPad11,4": return .iPadAir3
        case "iPad11,6", "iPad11,7": return .iPad8
        case "iPad13,1", "iPad13,2": return .iPadAir4
        #elseif os(watchOS)
        case "Watch1,1": return .appleWatch_38
        case "Watch1,2": return .appleWatch_42
        case "Watch2.6": return .appleWatchSeries1_38
        case "Watch2.7": return .appleWatchSeries1_42
        case "Watch2.3": return .appleWatchSeries2_38
        case "Watch2.4": return .appleWatchSeries2_42
        case "Watch3,1", "Watch3,3": return .appleWatchSeries3_38
        case "Watch3,2", "Watch3,4": return .appleWatchSeries3_42
        case "Watch4,1", "Watch4,3": return .appleWatchSeries4_40
        case "Watch4,2", "Watch4,4": return .appleWatchSeries4_44
        case "Watch5,1", "Watch5,3": return .appleWatchSeries5_40
        case "Watch5,2", "Watch5,4": return .appleWatchSeries5_44
        case "Watch5,9", "Watch5,11": return .appleWatchSE_40
        case "Watch5,10", "Watch5,12": return .appleWatchSE_44
        case "Watch6,1", "Watch6,3": return .appleWatchSeries6_40
        case "Watch6,2", "Watch6,4": return .appleWatchSeries6_44
        #elseif os(tvOS)
        case "AppleTV2,1": return .appleTV2
        case "AppleTV3,1", "AppleTV3,2": return .appleTV3
        case "AppleTV5,3": return .appleTV4
        case "AppleTV6,2": return .appleTV4K
        #endif
        case "i386", "x86_64": return .simulator
        default: return .unknown
        }
    }
    
    enum Generation: String {
        #if os(iOS)
        case iPhone
        case iPhone3G
        case iPhone3GS
        case iPhone4
        case iPhone4S
        case iPhone5
        case iPhone5C
        case iPhone5S
        case iPhone6
        case iPhone6Plus
        case iPhone6S
        case iPhone6SPlus
        case iPhone7
        case iPhone7Plus
        case iPhoneSE
        case iPhone8
        case iPhone8Plus
        case iPhoneX
        case iPhoneXS
        case iPhoneXSMax
        case iPhoneXR
        case iPhone11
        case iPhone11Pro
        case iPhone11ProMax
        case iPhoneSE2
        case iPhone12mini
        case iPhone12
        case iPhone12Pro
        case iPhone12ProMax
        case iPodtouch
        case iPodtouch2
        case iPodtouch3
        case iPodtouch4
        case iPodtouch5
        case iPodtouch6
        case iPodtouch7
        case iPad
        case iPad2
        case iPadmini
        case iPad3
        case iPad4
        case iPadAir
        case iPadmini2
        case iPadAir2
        case iPadmini3
        case iPadmini4
        case iPadPro_12_9
        case iPadPro_9_7
        case iPad5
        case iPadPro2_12_9
        case iPadPro_10_5
        case iPad6
        case iPadPro_11
        case iPadPro2_11
        case iPadPro3_12_9
        case iPadPro4_12_9
        case iPadAir3
        case iPadmini5
        case iPad7
        case iPad8
        case iPadAir4
        #elseif os(watchOS)
        case appleWatch_38
        case appleWatch_42
        case appleWatchSeries1_38
        case appleWatchSeries1_42
        case appleWatchSeries2_38
        case appleWatchSeries2_42
        case appleWatchSeries3_38
        case appleWatchSeries3_42
        case appleWatchSeries4_40
        case appleWatchSeries4_44
        case appleWatchSeries5_40
        case appleWatchSeries5_44
        case appleWatchSE_40
        case appleWatchSE_44
        case appleWatchSeries6_40
        case appleWatchSeries6_44
        #elseif os(tvOS)
        case appleTV2
        case appleTV3
        case appleTV4
        case appleTV4K
        #endif
        case simulator
        case unknown
    }
    
}
