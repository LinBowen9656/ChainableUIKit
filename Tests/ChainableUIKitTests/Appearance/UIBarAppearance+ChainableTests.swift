//
//  UIBarAppearance+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/22.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 13.0, *)
final class UIBarAppearanceChainableTests: XCTestCase {
    
    func testConfigureWithDefaultBackground() {
        let appearance = UIBarAppearance()
        appearance.configureWithDefaultBackground()
        let result = UIBarAppearance().chainable
            .configureWithDefaultBackground().wrapped == appearance
        XCTAssert(result)
    }
    
    func testConfigureWithOpaqueBackground() {
        let appearance = UIBarAppearance()
        appearance.configureWithOpaqueBackground()
        let result = UIBarAppearance().chainable
            .configureWithOpaqueBackground().wrapped == appearance
        XCTAssert(result)
    }
    
    func testConfigureWithTransparentBackground() {
        let appearance = UIBarAppearance()
        appearance.configureWithTransparentBackground()
        let result = UIBarAppearance().chainable
            .configureWithTransparentBackground().wrapped == appearance
        XCTAssert(result)
    }
    
    func testBackgroundEffect() {
        let result = UIBarAppearance().chainable
            .backgroundEffect(UIBlurEffect(style: .regular))
            .wrapped.backgroundEffect == UIBlurEffect(style: .regular)
        XCTAssert(result)
    }
    
    func testBackgroundColor() {
        let result = UIBarAppearance().chainable
            .backgroundColor(.red)
            .wrapped.backgroundColor == .red
        XCTAssert(result)
    }
    
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UIBarAppearance().chainable
            .backgroundImage(image)
            .wrapped.backgroundImage == image
        XCTAssert(result)
    }
    
    func testBackgroundImageContentMode() {
        let result = UIBarAppearance().chainable
            .backgroundImageContentMode(.center)
            .wrapped.backgroundImageContentMode == .center
        XCTAssert(result)
    }
    
    func testShadowColor() {
        let result = UIBarAppearance().chainable
            .shadowColor(.red)
            .wrapped.shadowColor == .red
        XCTAssert(result)
    }
    
    func testShadowImage() {
        let image = testPNGImage
        let result = UIBarAppearance().chainable
            .shadowImage(image)
            .wrapped.shadowImage == image
        XCTAssert(result)
    }
    
}
