//
//  UINavigationController+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

final class UINavigationControllerChainableTests: XCTestCase {
    
    func testPushViewController() {
        let controller = UIViewController()
        let result = UINavigationController(rootViewController: UIViewController()).chainable
            .pushViewController(controller, isAnimated: false)
            .wrapped.viewControllers.last == controller
        XCTAssert(result)
    }
    
    func testPopViewController() {
        let controller = UIViewController()
        let navigationController = UINavigationController()
        navigationController.setViewControllers([controller, UIViewController()])
        let result = navigationController.chainable
            .popViewController(isAnimated: false)
            .wrapped.viewControllers == [controller]
        XCTAssert(result)
    }
    
    func testPopToViewController() {
        let controller = UIViewController()
        let navigationController = UINavigationController()
        navigationController.setViewControllers([controller, UIViewController(), UIViewController()])
        let result = navigationController.chainable
            .popToViewController(controller, isAnimated: false)
            .wrapped.viewControllers == [controller]
        XCTAssert(result)
    }
    
    func testPopToRootViewController() {
        let controller = UIViewController()
        let navigationController = UINavigationController()
        navigationController.setViewControllers([controller, UIViewController(), UIViewController()])
        let result = navigationController.chainable
            .popToRootViewController(isAnimated: false)
            .wrapped.viewControllers == [controller]
        XCTAssert(result)
    }
    
    func testViewControllers() {
        let controllers = [UIViewController(), UIViewController()]
        let result = UINavigationController().chainable
            .viewControllers(controllers, isAnimated: false)
            .wrapped.viewControllers == controllers
        XCTAssert(result)
    }
    
    func testIsNavigationBarHidden() {
        let result = UINavigationController().chainable
            .isNavigationBarHidden(true, isAnimated: false)
            .wrapped.navigationBar.isHidden
        XCTAssert(result)
    }
    
    func testIsToolbarHidden() {
        let result = UINavigationController().chainable
            .isToolbarHidden(true, isAnimated: false)
            .wrapped.toolbar.isHidden
        XCTAssert(result)
    }
    
    func testHidesBarsOnTap() {
        let result = UINavigationController().chainable
            .hidesBarsOnTap(true)
            .wrapped.hidesBarsOnTap
        XCTAssert(result)
    }
    
    func testHidesBarsOnSwipe() {
        let result = UINavigationController().chainable
            .hidesBarsOnSwipe(true)
            .wrapped.hidesBarsOnSwipe
        XCTAssert(result)
    }
    
    func testHidesBarsWhenVerticallyCompact() {
        let result = UINavigationController().chainable
            .hidesBarsWhenVerticallyCompact(true)
            .wrapped.hidesBarsWhenVerticallyCompact
        XCTAssert(result)
    }
    
    func testHidesBarsWhenKeyboardAppears() {
        let result = UINavigationController().chainable
            .hidesBarsWhenKeyboardAppears(true)
            .wrapped.hidesBarsWhenKeyboardAppears
        XCTAssert(result)
    }
    
}
