//
//  UIBarItem+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/26.
//

import XCTest
@testable import ChainableUIKit

final class UIBarItemChainableTests: XCTestCase {
    
    func testTitle() {
        let result = UIBarButtonItem().chainable
            .title("Test")
            .wrapped.title == "Test"
        XCTAssert(result)
    }
    
    func testImage() {
        let image = testPNGImage
        let result = UIBarButtonItem().chainable
            .image(image)
            .wrapped.image == image
        XCTAssert(result)
    }
    
    func testImageInsets() {
        let result = UIBarButtonItem().chainable
            .imageInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .wrapped.imageInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        XCTAssert(result)
    }
    
    func testLandscapePhoneImage() {
        let image = testPNGImage
        let result = UIBarButtonItem().chainable
            .landscapePhoneImage(image)
            .wrapped.landscapeImagePhone == image
        XCTAssert(result)
    }
    
    func testLandscapePhoneImageInsets() {
        let result = UIBarButtonItem().chainable
            .landscapePhoneImageInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .wrapped.landscapeImagePhoneInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        XCTAssert(result)
    }
    
    func testLargeContentSizeImage() {
        let image = testPNGImage
        let result = UIBarItem().chainable
            .largeContentSizeImage(image)
            .wrapped.largeContentSizeImage == image
        XCTAssert(result)
    }
    
    func testLargeContentSizeImageInsets() {
        let result = UIBarItem().chainable
            .largeContentSizeImageInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .wrapped.largeContentSizeImageInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        XCTAssert(result)
    }
    
    func testTitleTextAttributes() {
        let result = UIBarButtonItem().chainable
            .titleTextAttributes([.font: UIFont.systemFont(ofSize: 55)], state: .normal)
            .wrapped.titleTextAttributes(for: .normal)?[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
}
