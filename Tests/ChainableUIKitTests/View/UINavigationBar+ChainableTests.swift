//
//  UINavigationBar+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/2.
//

import XCTest
@testable import ChainableUIKit

final class UINavigationBarChainableTests: XCTestCase {
    
    func testIsPrefersLargeTitles() {
        let result = UINavigationBar().chainable
            .isPrefersLargeTitles(true)
            .wrapped.prefersLargeTitles
        XCTAssert(result)
    }
    
    func testIsTranslucent() {
        let result = UINavigationBar().chainable
            .isTranslucent(true)
            .wrapped.isTranslucent
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testStandardAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        let result = UINavigationBar().chainable
            .standardAppearance(appearance)
            .wrapped.standardAppearance == appearance
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testCompactAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        let result = UINavigationBar().chainable
            .compactAppearance(appearance)
            .wrapped.compactAppearance == appearance
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testScrollEdgeAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        let result = UINavigationBar().chainable
            .scrollEdgeAppearance(appearance)
            .wrapped.scrollEdgeAppearance == appearance
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testCompactScrollEdgeAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            let result = UINavigationBar().chainable
                .compactScrollEdgeAppearance(appearance)
                .wrapped.compactScrollEdgeAppearance == appearance
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBarStyle() {
        let result = UINavigationBar().chainable
            .barStyle(.black)
            .wrapped.barStyle == .black
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testTitleTextAttributes() {
        let result = UINavigationBar().chainable
            .titleTextAttributes([.font: UIFont.systemFont(ofSize: 55)])
            .wrapped.titleTextAttributes?[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testLargeTitleTextAttributes() {
        let result = UINavigationBar().chainable
            .largeTitleTextAttributes([.font: UIFont.systemFont(ofSize: 55)])
            .wrapped.largeTitleTextAttributes?[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testTitleVerticalPositionAdjustment() {
        let result = UINavigationBar().chainable
            .titleVerticalPositionAdjustment(5, barMetrics: .default)
            .wrapped.titleVerticalPositionAdjustment(for: .default) == 5
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBackIndicatorImage() {
        let result = TestNavigationBar().chainable
            .backIndicatorImage(testPNGImage)
            .wrapped.isCallBackIndicatorImage
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBackIndicatorTransitionMaskImage() {
        let result = TestNavigationBar().chainable
            .backIndicatorTransitionMaskImage(testPNGImage)
            .wrapped.isCallBackIndicatorTransitionMaskImage
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBarTintColor() {
        let result = UINavigationBar().chainable
            .barTintColor(.red)
            .wrapped.barTintColor == .red
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UINavigationBar().chainable
            .backgroundImage(image, position: .any, barMetrics: .default)
            .wrapped.backgroundImage(for: .any, barMetrics: .default) == image
        XCTAssert(result)
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    func testShadowImage() {
        let image = testPNGImage
        let result = UINavigationBar().chainable
            .shadowImage(image)
            .wrapped.shadowImage == image
        XCTAssert(result)
    }
    
}

extension UINavigationBarChainableTests {
    
    class TestNavigationBar: UINavigationBar {
        
        var isCallBackIndicatorImage = false
        var isCallBackIndicatorTransitionMaskImage = false
        override var backIndicatorImage: UIImage? {
            get {
                super.backIndicatorImage
            }
            set {
                isCallBackIndicatorImage = true
                super.backIndicatorImage = newValue
            }
        }
        override var backIndicatorTransitionMaskImage: UIImage? {
            get {
                super.backIndicatorTransitionMaskImage
            }
            set {
                isCallBackIndicatorTransitionMaskImage = true
                super.backIndicatorTransitionMaskImage = newValue
            }
        }
        
    }
    
}
