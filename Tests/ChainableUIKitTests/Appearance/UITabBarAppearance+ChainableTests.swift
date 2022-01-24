//
//  UITabBarAppearance+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/24.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 13.0, *)
final class UITabBarAppearanceChainableTests: XCTestCase {
    
    func testStackedLayoutAppearance() {
        let appearance = UITabBarItemAppearance(style: .inline)
        let result = UITabBarAppearance().chainable
            .stackedLayoutAppearance(appearance)
            .wrapped.stackedLayoutAppearance == appearance
        XCTAssert(result)
    }
    
    func testStackedItemPositioning() {
        let result = UITabBarAppearance().chainable
            .stackedItemPositioning(.centered)
            .wrapped.stackedItemPositioning == .centered
        XCTAssert(result)
    }
    
    func testStackedItemSpacing() {
        let result = UITabBarAppearance().chainable
            .stackedItemSpacing(5)
            .wrapped.stackedItemSpacing == 5
        XCTAssert(result)
    }
    
    func testStackedItemWidth() {
        let result = UITabBarAppearance().chainable
            .stackedItemWidth(5)
            .wrapped.stackedItemWidth == 5
        XCTAssert(result)
    }
    
    func testInlineLayoutAppearance() {
        let appearance = UITabBarItemAppearance(style: .inline)
        let result = UITabBarAppearance().chainable
            .inlineLayoutAppearance(appearance)
            .wrapped.inlineLayoutAppearance == appearance
        XCTAssert(result)
    }
    
    func testCompactInlineLayoutAppearance() {
        let appearance = UITabBarItemAppearance(style: .inline)
        let result = UITabBarAppearance().chainable
            .compactInlineLayoutAppearance(appearance)
            .wrapped.compactInlineLayoutAppearance == appearance
        XCTAssert(result)
    }
    
    func testSelectionIndicatorTintColor() {
        let result = UITabBarAppearance().chainable
            .selectionIndicatorTintColor(.red)
            .wrapped.selectionIndicatorTintColor == .red
        XCTAssert(result)
    }
    
    func testSelectionIndicatorImage() {
        let image = testPNGImage
        let result = UITabBarAppearance().chainable
            .selectionIndicatorImage(image)
            .wrapped.selectionIndicatorImage == image
        XCTAssert(result)
    }
    
}
