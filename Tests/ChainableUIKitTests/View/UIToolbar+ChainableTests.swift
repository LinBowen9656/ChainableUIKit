//
//  UIToolbar+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/15.
//

import XCTest
@testable import ChainableUIKit

final class UIToolbarChainableTests: XCTestCase {
    
    func testItems() {
        let result = UIToolbar().chainable
            .items([UIBarButtonItem()], isAnimated: false)
            .wrapped.items?.count == 1
        XCTAssert(result)
    }
    
    func testIsTranslucent() {
        let result = UIToolbar().chainable
            .isTranslucent(true)
            .wrapped.isTranslucent
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testStandardAppearance() {
        let appearance = UIToolbarAppearance()
        let result = UIToolbar().chainable
            .standardAppearance(appearance)
            .wrapped.standardAppearance == appearance
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testCompactAppearance() {
        let appearance = UIToolbarAppearance()
        let result = UIToolbar().chainable
            .compactAppearance(appearance)
            .wrapped.compactAppearance == appearance
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBarStyle() {
        let result = UIToolbar().chainable
            .barStyle(.black)
            .wrapped.barStyle == .black
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBarTintColor() {
        let result = UIToolbar().chainable
            .barTintColor(.red)
            .wrapped.barTintColor == .red
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UIToolbar().chainable
            .backgroundImage(image, position: .any, barMetrics: .default)
            .wrapped.backgroundImage(forToolbarPosition: .any, barMetrics: .default) == image
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testShadowImage() {
        let image = testPNGImage
        let result = UIToolbar().chainable
            .shadowImage(image, position: .top)
            .wrapped.shadowImage(forToolbarPosition: .top) == image
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testScrollEdgeAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UIToolbarAppearance()
            let result = UIToolbar().chainable
                .scrollEdgeAppearance(appearance)
                .wrapped.scrollEdgeAppearance == appearance
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    @available(iOS 13.0, *)
    func testCompactScrollEdgeAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UIToolbarAppearance()
            let result = UIToolbar().chainable
                .compactScrollEdgeAppearance(appearance)
                .wrapped.compactScrollEdgeAppearance == appearance
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}
