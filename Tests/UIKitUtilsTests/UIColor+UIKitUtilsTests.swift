//
//  UIColor+UIKitUtilsTests.swift
//  
//
//  Created by 林博文 on 2022/2/7.
//

import XCTest
@testable import UIKitUtils

class UIColorUIKitUtilsTests: XCTestCase {
    
    func testColorComponent() throws {
        let color = UIColor(red: 65 / 255, green: 127 / 255, blue: 249 / 255, alpha: 0.5)
        let result = color.redValue == 65 / 255 && color.greenValue == 127 / 255 && color.blueValue == 249 / 255 && color.alphaValue == 0.5 && color.rgbHexString == "#417FF9" && color.rgbaHexString == "#417FF980"
        XCTAssert(result)
    }
    
    func testIsDark() {
        XCTAssert(UIColor.gray.isDark && !UIColor.yellow.isDark)
    }
    
    func testComplementaryColor() {
        XCTAssert(UIColor.black.complementaryColor.rgbHexString == "#FFFFFF")
    }
    
    func testOverlay() {
        let result = UIColor.blue.overlay(color: .red.withAlphaComponent(0.5)).rgbaHexString == "#800080FF"
        XCTAssert(result)
    }
    
    func testBecome() {
        let result = UIColor.black.become(color: .black.withAlphaComponent(0), progress: 0.5).alphaValue == 0.5
        XCTAssert(result)
    }
    
}
