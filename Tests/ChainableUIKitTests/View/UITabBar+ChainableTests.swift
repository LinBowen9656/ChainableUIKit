//
//  UITabBar+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/8.
//

import XCTest
@testable import ChainableUIKit

final class UITabBarChainableTests: XCTestCase {
    
    func testIsTranslucent() {
        let result = UITabBar().chainable
            .isTranslucent(true)
            .wrapped.isTranslucent
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testStandardAppearance() {
        let appearance = UITabBarAppearance()
        let result = UITabBar().chainable
            .standardAppearance(appearance)
            .wrapped.standardAppearance == appearance
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testScrollEdgeAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            let result = UITabBar().chainable
                .scrollEdgeAppearance(appearance)
                .wrapped.scrollEdgeAppearance == appearance
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBarStyle() {
        let result = UITabBar().chainable
            .barStyle(.black)
            .wrapped.barStyle == .black
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBarTintColor() {
        let result = UITabBar().chainable
            .barTintColor(.red)
            .wrapped.barTintColor == .red
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testItemPositioning() {
        let result = UITabBar().chainable
            .itemPositioning(.centered)
            .wrapped.itemPositioning == .centered
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testItemSpacing() {
        let result = UITabBar().chainable
            .itemSpacing(5)
            .wrapped.itemSpacing == 5
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testItemWidth() {
        let result = UITabBar().chainable
            .itemWidth(55)
            .wrapped.itemWidth == 55
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testUnselectedItemTintColor() {
        let result = UITabBar().chainable
            .unselectedItemTintColor(.red)
            .wrapped.unselectedItemTintColor == .red
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testSelectionIndicatorImage() {
        let image = testPNGImage
        let result = UITabBar().chainable
            .selectionIndicatorImage(image)
            .wrapped.selectionIndicatorImage == image
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UITabBar().chainable
            .backgroundImage(image)
            .wrapped.backgroundImage == image
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testShadowImage() {
        let image = testPNGImage
        let result = UITabBar().chainable
            .shadowImage(image)
            .wrapped.shadowImage == image
        XCTAssert(result)
    }
    
}
