//
//  CGAffineTransform+UIKitUtilsTests.swift
//  
//
//  Created by 林博文 on 2022/2/7.
//

import XCTest
@testable import UIKitUtils

class CGAffineTransformUIKitUtilsTests: XCTestCase {
    
    func testExample() throws {
        let transform = CGAffineTransform(translationX: 5, y: 5).scaledBy(x: 5, y: 5)
        let result = transform.translationX == 5 && transform.translationY == 5 && transform.scaleX == 5 && transform.scaleY == 5 && transform.rotated(by: 0.5).angle == 0.5
        XCTAssert(result)
    }
    
}
