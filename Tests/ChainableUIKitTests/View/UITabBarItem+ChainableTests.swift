//
//  UITabBarItem+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/8.
//

import XCTest
@testable import ChainableUIKit

final class UITabBarItemChainableTests: XCTestCase {
    
    @available(iOS 13.0, *)
    func testStandardAppearance() {
        let appearance = UITabBarAppearance()
        let result = UITabBarItem().chainable
            .standardAppearance(appearance)
            .wrapped.standardAppearance == appearance
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testScrollEdgeAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            let result = UITabBarItem().chainable
                .scrollEdgeAppearance(appearance)
                .wrapped.scrollEdgeAppearance == appearance
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testBadgeValue() {
        let result = UITabBarItem().chainable
            .badgeValue("5")
            .wrapped.badgeValue == "5"
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testTitlePositionAdjustment() {
        let result = UITabBarItem().chainable
            .titlePositionAdjustment(UIOffset(horizontal: 5, vertical: 5))
            .wrapped.titlePositionAdjustment == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testSelectedImage() {
        let image = testPNGImage
        let result = UITabBarItem().chainable
            .image(image)
            .selectedImage(image)
            .wrapped.selectedImage == image
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBadgeColor() {
        let result = UITabBarItem().chainable
            .badgeColor(.red)
            .wrapped.badgeColor == .red
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBadgeTextAttributes() {
        let result = UITabBarItem().chainable
            .badgeTextAttributes([.font: UIFont.systemFont(ofSize: 55)], state: .normal)
            .wrapped.badgeTextAttributes(for: .normal)?[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
}
