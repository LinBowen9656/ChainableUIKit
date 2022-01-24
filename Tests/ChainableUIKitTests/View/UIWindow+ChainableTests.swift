//
//  UIWindow+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/15.
//

import XCTest
@testable import ChainableUIKit

final class UIWindowChainableTests: XCTestCase {
    
    func testRootViewController() {
        let controller = UIViewController()
        let result = UIWindow().chainable
            .rootViewController(controller)
            .wrapped.rootViewController == controller
        XCTAssert(result)
    }
    
    func testWindowLevel() {
        let result = UIWindow().chainable
            .windowLevel(.alert)
            .wrapped.windowLevel == .alert
        XCTAssert(result)
    }
    
    func testIsCanResizeToFitContent() {
        if #available(iOS 13.0, *) {
            let result = UIWindow().chainable
                .isCanResizeToFitContent(true)
                .wrapped.canResizeToFitContent
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testMakeKey() {
        let result = UIWindow().chainable
            .makeKey(isChangeVisibility: true)
            .wrapped.isKeyWindow
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testWindowScene() {
        let result = UIWindow().chainable
            .windowScene(nil)
            .wrapped.windowScene == nil
        XCTAssert(result)
    }
    
}
