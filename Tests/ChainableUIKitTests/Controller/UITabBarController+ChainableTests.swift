//
//  UITabBarController+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

final class UITabBarControllerChainableTests: XCTestCase {
    
    func testViewControllers() {
        let controller = UIViewController()
        let result = UITabBarController().chainable
            .viewControllers([controller], isAnimated: false)
            .wrapped.viewControllers == [controller]
        XCTAssert(result)
    }
    
    func testCustomizableViewControllers() {
        let controller = UIViewController()
        let result = UITabBarController().chainable
            .customizableViewControllers([controller])
            .wrapped.customizableViewControllers == [controller]
        XCTAssert(result)
    }
    
    func testSelectedViewController() {
        let controller = UIViewController()
        let result = UITabBarController().chainable
            .viewControllers([UIViewController(), controller], isAnimated: false)
            .selectedViewController(controller)
            .wrapped.selectedViewController == controller
        XCTAssert(result)
    }
    
    func testSelectedIndex() {
        let controller = UIViewController()
        let result = UITabBarController().chainable
            .viewControllers([UIViewController(), controller], isAnimated: false)
            .selectedIndex(1)
            .wrapped.selectedViewController == controller
        XCTAssert(result)
    }
    
}
