//
//  UIImage+UIKitUtilsTests.swift
//  
//
//  Created by 林博文 on 2022/2/7.
//

import XCTest
@testable import UIKitUtils

class UIImageUIKitUtilsTests: XCTestCase {
    
    func testAverageColor() {
        let image = UIImage(color: .black, size: CGSize(width: 5, height: 5))
        XCTAssert(image.averageColor.rgbHexString == "#000000" && image.size == CGSize(width: 5, height: 5))
    }
    
    func testResizeImage() {
        let image = UIImage(color: .black, size: CGSize(width: 5, height: 5)).reSizeImage(reSize: CGSize(width: 50, height: 50))
        XCTAssert(image?.size == CGSize(width: 50, height: 50))
    }
    
    func testScaleImage() {
        let image = UIImage(color: .black, size: CGSize(width: 5, height: 5)).scaleImage(scaleSize: 10)
        XCTAssert(image?.size == CGSize(width: 50, height: 50))
    }
    
}
