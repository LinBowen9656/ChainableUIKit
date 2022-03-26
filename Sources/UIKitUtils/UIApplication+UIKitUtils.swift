//
//  UIApplication+UIKitUtils.swift
//  
//
//  Created by 林博文 on 2022/3/26.
//

import UIKit

extension UIApplication {
    
    /// A Boolean value that indicates whether the process is an iPhone or iPad app running on a Mac.
    var isiOSAppOnMac: Bool {
        if #available(iOS 14.0, *) {
            return ProcessInfo.processInfo.isiOSAppOnMac
        } else {
            return false
        }
    }
    
}
