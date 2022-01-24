//
//  UITabBarItemStateAppearance+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 13.0, *)
final class UITabBarItemStateAppearanceChainableTests: XCTestCase {
    
    func testTitleTextAttributes() {
        let attributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 55)]
        let result = UITabBarItemAppearance(style: .stacked).normal.chainable
                        .titleTextAttributes(attributes)
                        .wrapped.titleTextAttributes[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testTitlePositionAdjustment() {
        let result = UITabBarItemAppearance(style: .stacked).normal.chainable
            .titlePositionAdjustment(UIOffset(horizontal: 5, vertical: 5))
            .wrapped.titlePositionAdjustment == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    func testIconColor() {
        let result = UITabBarItemAppearance(style: .stacked).normal.chainable
            .iconColor(.red)
            .wrapped.iconColor == .red
        XCTAssert(result)
    }
    
    func testBadgeTextAttributes() {
        let attributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 55)]
        let result = UITabBarItemAppearance(style: .stacked).normal.chainable
                        .badgeTextAttributes(attributes)
                        .wrapped.badgeTextAttributes[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testBadgeBackgroundColor() {
        let result = UITabBarItemAppearance(style: .stacked).normal.chainable
            .badgeBackgroundColor(.red)
            .wrapped.badgeBackgroundColor == .red
        XCTAssert(result)
    }
    
    func testBadgeTitlePositionAdjustment() {
        let result = UITabBarItemAppearance(style: .stacked).normal.chainable
            .badgeTitlePositionAdjustment(UIOffset(horizontal: 5, vertical: 5))
            .wrapped.badgeTitlePositionAdjustment == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    func testBadgePositionAdjustment() {
        let result = UITabBarItemAppearance(style: .stacked).normal.chainable
            .badgePositionAdjustment(UIOffset(horizontal: 5, vertical: 5))
            .wrapped.badgePositionAdjustment == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
}
