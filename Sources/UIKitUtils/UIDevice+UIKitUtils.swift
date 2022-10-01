//
//  UIDevice+UIKitUtils.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension UIDevice {
    
    static var device: Device { Device(hardwareString: current.hardwareString) }
    /// Get the device model string.
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
    
    enum Device: Equatable {
        
        #if os(iOS)
        case iPhone
        case iPhone3G
        case iPhone3GS
        case iPhone4
        case iPhone4S
        case iPhone5
        case iPhone5c
        case iPhone5s
        case iPhone6
        case iPhone6Plus
        case iPhone6s
        case iPhone6sPlus
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
        case iPhone13mini
        case iPhone13
        case iPhone13Pro
        case iPhone13ProMax
        case iPhoneSE3
        case iPhone14
        case iPhone14Plus
        case iPhone14Pro
        case iPhone14ProMax
        case iPodtouch
        case iPodtouch2
        case iPodtouch3
        case iPodtouch4
        case iPodtouch5
        case iPodtouch6
        case iPodtouch7
        case iPad
        case iPad2
        case iPad3
        case iPad4
        case iPad5
        case iPad6
        case iPad7
        case iPad8
        case iPad9
        case iPadmini
        case iPadmini2
        case iPadmini3
        case iPadmini4
        case iPadmini5
        case iPadmini6
        case iPadAir
        case iPadAir2
        case iPadAir3
        case iPadAir4
        case iPadAir5
        case iPadPro9Inch
        case iPadPro12Inch
        case iPadPro12Inch2
        case iPadPro10Inch
        case iPadPro11Inch
        case iPadPro12Inch3
        case iPadPro11Inch2
        case iPadPro12Inch4
        case iPadPro11Inch3
        case iPadPro12Inch5
        case homePod
        #elseif os(watchOS)
        case appleWatch_38mm
        case appleWatch_42mm
        case appleWatchSeries1_38mm
        case appleWatchSeries1_42mm
        case appleWatchSeries2_38mm
        case appleWatchSeries2_42mm
        case appleWatchSeries3_38mm
        case appleWatchSeries3_42mm
        case appleWatchSeries4_40mm
        case appleWatchSeries4_44mm
        case appleWatchSeries5_40mm
        case appleWatchSeries5_44mm
        case appleWatchSE_40mm
        case appleWatchSE_44mm
        case appleWatchSeries6_40mm
        case appleWatchSeries6_44mm
        case appleWatchSeries7_41mm
        case appleWatchSeries7_45mm
        case appleWatchSeries7_41mm
        case appleWatchSeries7_45mm
        case appleWatchSeries8_41mm
        case appleWatchSeries8_45mm
        case appleWatchSE2_40mm
        case appleWatchSE2_44mm
        case appleWatchUltra
        #elseif os(tvOS)
        case appleTV2
        case appleTV3
        case appleTV4
        case appleTV4K
        case appleTV4K2
        #endif
        indirect case simulator(Device)
        case unknown(String)
        
        public var description: String {
            #if os(iOS)
            switch self {
            case .iPodtouch: return "iPod touch"
            case .iPodtouch2: return "iPod touch (2th generation)"
            case .iPodtouch3: return "iPod touch (3th generation)"
            case .iPodtouch4: return "iPod touch (4th generation)"
            case .iPodtouch5: return "iPod touch (5th generation)"
            case .iPodtouch6: return "iPod touch (6th generation)"
            case .iPodtouch7: return "iPod touch (7th generation)"
            case .iPhone: return "iPhone"
            case .iPhone3G: return "iPhone 3G"
            case .iPhone3GS: return "iPhone 3GS"
            case .iPhone4: return "iPhone 4"
            case .iPhone4S: return "iPhone 4S"
            case .iPhone5: return "iPhone 5"
            case .iPhone5c: return "iPhone 5c"
            case .iPhone5s: return "iPhone 5s"
            case .iPhone6: return "iPhone 6"
            case .iPhone6Plus: return "iPhone 6 Plus"
            case .iPhone6s: return "iPhone 6s"
            case .iPhone6sPlus: return "iPhone 6s Plus"
            case .iPhone7: return "iPhone 7"
            case .iPhone7Plus: return "iPhone 7 Plus"
            case .iPhoneSE: return "iPhone SE"
            case .iPhone8: return "iPhone 8"
            case .iPhone8Plus: return "iPhone 8 Plus"
            case .iPhoneX: return "iPhone X"
            case .iPhoneXS: return "iPhone Xs"
            case .iPhoneXSMax: return "iPhone Xs Max"
            case .iPhoneXR: return "iPhone XR"
            case .iPhone11: return "iPhone 11"
            case .iPhone11Pro: return "iPhone 11 Pro"
            case .iPhone11ProMax: return "iPhone 11 Pro Max"
            case .iPhoneSE2: return "iPhone SE (2nd generation)"
            case .iPhone12: return "iPhone 12"
            case .iPhone12mini: return "iPhone 12 mini"
            case .iPhone12Pro: return "iPhone 12 Pro"
            case .iPhone12ProMax: return "iPhone 12 Pro Max"
            case .iPhone13: return "iPhone 13"
            case .iPhone13mini: return "iPhone 13 mini"
            case .iPhone13Pro: return "iPhone 13 Pro"
            case .iPhone13ProMax: return "iPhone 13 Pro Max"
            case .iPhoneSE3: return "iPhone SE (2rd generation)"
            case .iPhone14: return "iPhone 14"
            case .iPhone14Plus: return "iPhone 14 Plus"
            case .iPhone14Pro: return "iPhone 14 Pro"
            case .iPhone14ProMax: return "iPhone 14 Pro Max"
            case .iPad: return "iPad"
            case .iPad2: return "iPad 2"
            case .iPad3: return "iPad (3rd generation)"
            case .iPad4: return "iPad (4th generation)"
            case .iPadAir: return "iPad Air"
            case .iPadAir2: return "iPad Air 2"
            case .iPad5: return "iPad (5th generation)"
            case .iPad6: return "iPad (6th generation)"
            case .iPadAir3: return "iPad Air (3rd generation)"
            case .iPad7: return "iPad (7th generation)"
            case .iPad8: return "iPad (8th generation)"
            case .iPad9: return "iPad (9th generation)"
            case .iPadAir4: return "iPad Air (4th generation)"
            case .iPadAir5: return "iPad Air (5th generation)"
            case .iPadmini: return "iPad mini"
            case .iPadmini2: return "iPad mini 2"
            case .iPadmini3: return "iPad mini 3"
            case .iPadmini4: return "iPad mini 4"
            case .iPadmini5: return "iPad mini (5th generation)"
            case .iPadmini6: return "iPad mini (6th generation)"
            case .iPadPro9Inch: return "iPad Pro (9.7-inch)"
            case .iPadPro12Inch: return "iPad Pro (12.9-inch)"
            case .iPadPro12Inch2: return "iPad Pro (12.9-inch) (2nd generation)"
            case .iPadPro10Inch: return "iPad Pro (10.5-inch)"
            case .iPadPro11Inch: return "iPad Pro (11-inch)"
            case .iPadPro12Inch3: return "iPad Pro (12.9-inch) (3rd generation)"
            case .iPadPro11Inch2: return "iPad Pro (11-inch) (2nd generation)"
            case .iPadPro12Inch4: return "iPad Pro (12.9-inch) (4th generation)"
            case .iPadPro11Inch3: return "iPad Pro (11-inch) (3rd generation)"
            case .iPadPro12Inch5: return "iPad Pro (12.9-inch) (5th generation)"
            case .homePod: return "HomePod"
            case .simulator(let model): return "Simulator (\(model.description))"
            case .unknown(let identifier): return identifier
            }
            #elseif os(watchOS)
            switch self {
            case .appleWatch_38mm: return "Apple Watch 38mm"
            case .appleWatch_42mm: return "Apple Watch 42mm"
            case .appleWatchSeries1_38mm: return "Apple Watch Series 1 38mm"
            case .appleWatchSeries1_42mm: return "Apple Watch Series 1 42mm"
            case .appleWatchSeries2_38mm: return "Apple Watch Series 2 38mm"
            case .appleWatchSeries2_42mm: return "Apple Watch Series 2 42mm"
            case .appleWatchSeries3_38mm: return "Apple Watch Series 3 38mm"
            case .appleWatchSeries3_42mm: return "Apple Watch Series 3 42mm"
            case .appleWatchSeries4_40mm: return "Apple Watch Series 4 40mm"
            case .appleWatchSeries4_44mm: return "Apple Watch Series 4 44mm"
            case .appleWatchSeries5_40mm: return "Apple Watch Series 5 40mm"
            case .appleWatchSeries5_44mm: return "Apple Watch Series 5 44mm"
            case .appleWatchSeries6_40mm: return "Apple Watch Series 6 40mm"
            case .appleWatchSeries6_44mm: return "Apple Watch Series 6 44mm"
            case .appleWatchSE_40mm: return "Apple Watch SE 40mm"
            case .appleWatchSE_44mm: return "Apple Watch SE 44mm"
            case .appleWatchSeries7_41mm: return "Apple Watch Series 7 41mm"
            case .appleWatchSeries7_45mm: return "Apple Watch Series 7 45mm"
            case .appleWatchSeries8_41mm: return "Apple Watch Series 8 41mm"
            case .appleWatchSeries8_45mm: return "Apple Watch Series 8 45mm"
            case .appleWatchSE2_40mm: return "Apple Watch SE (2nd generation) 40mm"
            case .appleWatchSE2_44mm: return "Apple Watch SE (2nd generation) 44mm"
            case .appleWatchUltra: return "Apple Watch Ultra"
            case .simulator(let model): return "Simulator (\(model.description))"
            case .unknown(let identifier): return identifier
            }
            #elseif os(tvOS)
            switch self {
            case .appleTVHD: return "Apple TV HD"
            case .appleTV4K: return "Apple TV 4K"
            case .appleTV4K2: return "Apple TV 4K (2nd generation)"
            case .simulator(let model): return "Simulator (\(model.description))"
            case .unknown(let identifier): return identifier
            }
            #endif
        }
        
        init(hardwareString: String) {
            #if os(iOS)
            switch hardwareString {
            case "iPod1,1":
                self = .iPodtouch
            case "iPod2,1":
                self = .iPodtouch2
            case "iPod3,1":
                self = .iPodtouch3
            case "iPod4,1":
                self = .iPodtouch4
            case "iPod5,1":
                self = .iPodtouch5
            case "iPod7,1":
                self = .iPodtouch6
            case "iPod9,1":
                self = .iPodtouch7
            case "iPhone1,1":
                self = .iPhone
            case "iPhone1,2":
                self = .iPhone3G
            case "iPhone2,1":
                self = .iPhone3GS
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":
                self = .iPhone4
            case "iPhone4,1":
                self = .iPhone4S
            case "iPhone5,1", "iPhone5,2":
                self = .iPhone5
            case "iPhone5,3", "iPhone5,4":
                self = .iPhone5c
            case "iPhone6,1", "iPhone6,2":
                self = .iPhone5s
            case "iPhone7,2":
                self = .iPhone6
            case "iPhone7,1":
                self = .iPhone6Plus
            case "iPhone8,1":
                self = .iPhone6s
            case "iPhone8,2":
                self = .iPhone6sPlus
            case "iPhone8,4":
                self = .iPhoneSE
            case "iPhone9,1", "iPhone9,3":
                self = .iPhone7
            case "iPhone9,2", "iPhone9,4":
                self = .iPhone7Plus
            case "iPhone10,1", "iPhone10,4":
                self = .iPhone8
            case "iPhone10,2", "iPhone10,5":
                self = .iPhone8Plus
            case "iPhone10,3", "iPhone10,6":
                self = .iPhoneX
            case "iPhone11,2":
                self = .iPhoneXS
            case "iPhone11,6":
                self = .iPhoneXSMax
            case "iPhone11,8":
                self = .iPhoneXR
            case "iPhone12,1":
                self = .iPhone11
            case "iPhone12,3":
                self = .iPhone11Pro
            case "iPhone12,5":
                self = .iPhone11ProMax
            case "iPhone12,8":
                self = .iPhoneSE2
            case "iPhone13,1":
                self = .iPhone12mini
            case "iPhone13,2":
                self = .iPhone12
            case "iPhone13,3":
                self = .iPhone12Pro
            case "iPhone13,4":
                self = .iPhone12ProMax
            case "iPhone14,4":
                self = .iPhone13mini
            case "iPhone14,5":
                self = .iPhone13
            case "iPhone14,2":
                self = .iPhone13Pro
            case "iPhone14,3":
                self = .iPhone13ProMax
            case "iPhone14,6":
                self = .iPhoneSE3
            case "iPhone14,7":
                self = .iPhone14
            case "iPhone14,8":
                self = .iPhone14Plus
            case "iPhone15,2":
                self = .iPhone14Pro
            case "iPhone15,3":
                self = .iPhone14ProMax
            case "iPad1,1":
                self = .iPad
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
                self = .iPad2
            case "iPad2,5", "iPad2,6", "iPad2,7":
                self = .iPadmini
            case "iPad3,1", "iPad3,2", "iPad3,3":
                self = .iPad3
            case "iPad3,4", "iPad3,5", "iPad3,6":
                self = .iPad4
            case "iPad4,1", "iPad4,2", "iPad4,3":
                self = .iPadAir
            case "iPad4,4", "iPad4,5", "iPad4,6":
                self = .iPadmini2
            case "iPad5,3", "iPad5,4":
                self = .iPadAir2
            case "iPad4,7", "iPad4,8", "iPad4,9":
                self = .iPadmini3
            case "iPad5,1", "iPad5,2":
                self = .iPadmini4
            case "iPad6,7", "iPad6,8":
                self = .iPadPro12Inch
            case "iPad6,3", "iPad6,4":
                self = .iPadPro9Inch
            case "iPad6,11", "iPad6,12":
                self = .iPad5
            case "iPad7,1", "iPad7,2":
                self = .iPadPro12Inch2
            case "iPad7,3", "iPad7,4":
                self = .iPadPro10Inch
            case "iPad7,5", "iPad7,6":
                self = .iPad6
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":
                self = .iPadPro12Inch3
            case "iPad8,11", "iPad8,12":
                self = .iPadPro12Inch4
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":
                self = .iPadPro11Inch
            case "iPad8,9", "iPad8,10":
                self = .iPadPro11Inch2
            case "iPad7,11", "iPad 7,12":
                self = .iPad7
            case "iPad11,1", "iPad11,2":
                self = .iPadmini5
            case "iPad11,3", "iPad11,4":
                self = .iPadAir3
            case "iPad11,6", "iPad11,7":
                self = .iPad8
            case "iPad13,1", "iPad13,2":
                self = .iPadAir4
            case "iPad12,1", "iPad12,2":
                self = .iPad9
            case "iPad13,16", "iPad13,17":
                self = .iPadAir5
            case "i386", "x86_64", "arm64":
                self = .simulator(Device(hardwareString: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))
            default:
                self = .unknown(hardwareString)
            }
            #elseif os(watchOS)
            switch rawValue {
            case "Watch1,1":
                self = .appleWatch_38mm
            case "Watch1,2":
                self = .appleWatch_42mm
            case "Watch2.6":
                self = .appleWatchSeries1_38mm
            case "Watch2.7":
                self = .appleWatchSeries1_42mm
            case "Watch2.3":
                self = .appleWatchSeries2_38mm
            case "Watch2.4":
                self = .appleWatchSeries2_42mm
            case "Watch3,1", "Watch3,3":
                self = .appleWatchSeries3_38mm
            case "Watch3,2", "Watch3,4":
                self = .appleWatchSeries3_42mm
            case "Watch4,1", "Watch4,3":
                self = .appleWatchSeries4_40mm
            case "Watch4,2", "Watch4,4":
                self = .appleWatchSeries4_44mm
            case "Watch5,1", "Watch5,3":
                self = .appleWatchSeries5_40mm
            case "Watch5,2", "Watch5,4":
                self = .appleWatchSeries5_44mm
            case "Watch5,9", "Watch5,11":
                self = .appleWatchSE_40mm
            case "Watch5,10", "Watch5,12":
                self = .appleWatchSE_44mm
            case "Watch6,1", "Watch6,3":
                self = .appleWatchSeries6_40mm
            case "Watch6,2", "Watch6,4":
                self = .appleWatchSeries6_44mm
            case "Watch6,6", "Watch6,8":
                self = .appleWatchSeries7_41mm
            case "Watch6,7", "Watch6,9":
                self = .appleWatchSeries7_45mm
            case "Watch6,14", "Watch6,16":
                return .appleWatchSeries8_41mm
            case "Watch6,15", "Watch6,17":
                return .appleWatchSeries8_45mm
            case "Watch6,10", "Watch6,12":
                return .appleWatchSE2_40mm
            case "Watch6,11", "Watch6,13":
                return .appleWatchSE2_44mm
            case "Watch6,18":
                return .appleWatchUltra
            case "i386", "x86_64", "arm64":
                self = .simulator(Device(hardwareString: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "watchOS"))
            default:
                self = .unknown(hardwareString)
            }
            #elseif os(tvOS)
            switch rawValue {
            case "AppleTV2,1":
                self = .appleTV2
            case "AppleTV3,1", "AppleTV3,2":
                self = .appleTV3
            case "AppleTV5,3":
                self = .appleTV4
            case "AppleTV6,2":
                self = .appleTV4K
            case "i386", "x86_64", "arm64":
                self = .simulator(Device(hardwareString: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))
            default:
                self = .unknown(hardwareString)
            }
            #endif
        }
        
    }
    
}
