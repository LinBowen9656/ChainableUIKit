//
//  File.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import Foundation

public extension Bundle {
    
    var version: String? { infoDictionary?["CFBundleVersion"] as? String }
    var shortVersion: String? { infoDictionary?["CFBundleShortVersionString"] as? String }
    
}
