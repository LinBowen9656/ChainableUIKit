//
//  UIBarButtonItemStateAppearance+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/23.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 13.0, *)
final class UIBarButtonItemStateAppearanceChainableTests: XCTestCase {
    
    func testTitleTextAttributes() {
        let attributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 55)]
        let result = UIBarButtonItemAppearance().normal.chainable
            .titleTextAttributes(attributes)
            .wrapped.titleTextAttributes[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testTitlePositionAdjustment() {
        let result = UIBarButtonItemAppearance().normal.chainable
            .titlePositionAdjustment(UIOffset(horizontal: 5, vertical: 5))
            .wrapped.titlePositionAdjustment == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UIBarButtonItemAppearance().normal.chainable
            .backgroundImage(image)
            .wrapped.backgroundImage == image
        XCTAssert(result)
    }
    
    func testBackgroundImagePositionAdjustment() {
        let result = UIBarButtonItemAppearance().normal.chainable
            .backgroundImagePositionAdjustment(UIOffset(horizontal: 5, vertical: 5))
            .wrapped.backgroundImagePositionAdjustment == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
}
