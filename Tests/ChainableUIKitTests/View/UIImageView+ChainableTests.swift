//
//  UIImageView+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/2.
//

import XCTest
@testable import ChainableUIKit

final class UIImageViewChainableTests: XCTestCase {
    
    func testImage() {
        let image = testPNGImage
        let result = UIImageView().chainable
            .image(image)
            .wrapped.image == image
        XCTAssert(result)
    }
    
    func testHighlightedImage() {
        let image = testPNGImage
        let result = UIImageView().chainable
            .highlightedImage(image)
            .wrapped.highlightedImage == image
        XCTAssert(result)
    }
    
    func testAnimationImages() {
        let images = [testPNGImage]
        let result = UIImageView().chainable
            .animationImages(images)
            .wrapped.animationImages == images
        XCTAssert(result)
    }
    
    func testHighlightedAnimationImages() {
        let images = [testPNGImage]
        let result = UIImageView().chainable
            .highlightedAnimationImages(images)
            .wrapped.highlightedAnimationImages == images
        XCTAssert(result)
    }
    
    func testAnimationDuration() {
        let result = UIImageView().chainable
            .animationDuration(5)
            .wrapped.animationDuration == 5
        XCTAssert(result)
    }
    
    func testAnimationRepeatCount() {
        let result = UIImageView().chainable
            .animationRepeatCount(5)
            .wrapped.animationRepeatCount == 5
        XCTAssert(result)
    }
    
    func testIsHighlighted() {
        let result = UIImageView().chainable
            .isHighlighted(true)
            .wrapped.isHighlighted
        XCTAssert(result)
    }
    
}
