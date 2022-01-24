//
//  UIViewController+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

final class UIViewControllerChainableTests: XCTestCase {
    
    func testTitle() {
        let result = UIViewController().chainable
            .title("Test")
            .wrapped.title == "Test"
        XCTAssert(result)
    }
    
    func testPreferredContentSize() {
        let result = UIViewController().chainable
            .preferredContentSize(CGSize(width: 5, height: 5))
            .wrapped.preferredContentSize == CGSize(width: 5, height: 5)
        XCTAssert(result)
    }
    
    func testAdditionalSafeAreaInsets() {
        let result = UIViewController().chainable
            .additionalSafeAreaInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .wrapped.additionalSafeAreaInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        XCTAssert(result)
    }
    
    func testIsViewRespectsSystemMinimumLayoutMargins() {
        let result = UIViewController().chainable
            .isViewRespectsSystemMinimumLayoutMargins(true)
            .wrapped.viewRespectsSystemMinimumLayoutMargins
        XCTAssert(result)
    }
    
    func testEdgesForExtendedLayout() {
        let result = UIViewController().chainable
            .edgesForExtendedLayout(.left)
            .wrapped.edgesForExtendedLayout == .left
        XCTAssert(result)
    }
    
    func testIsExtendedLayoutIncludesOpaqueBars() {
        let result = UIViewController().chainable
            .isExtendedLayoutIncludesOpaqueBars(true)
            .wrapped.extendedLayoutIncludesOpaqueBars
        XCTAssert(result)
    }
    
    func testPushByNavigationController() {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let controller = UIViewController()
        controller.chainable
            .pushByNavigationController(navigationController, isAnimated: false)
        let result = navigationController.viewControllers.last == controller
        XCTAssert(result)
    }
    
    func testShowByViewController() {
        let rootViewController = TestViewController()
        let controller = UIViewController()
        controller.chainable
            .showByViewController(rootViewController)
        let result = rootViewController.isCallShow
        XCTAssert(result)
    }
    
    func testShowDetailByViewController() {
        let rootViewController = TestViewController()
        let controller = UIViewController()
        controller.chainable
            .showDetailByViewController(rootViewController)
        let result = rootViewController.isCallShowDetail
        XCTAssert(result)
    }
    
    func testPresentByViewController() {
        let rootViewController = TestViewController()
        let controller = UIViewController()
        controller.chainable
            .presentByViewController(rootViewController, isAnimated: false)
        let result = rootViewController.isCallPresent
        XCTAssert(result)
    }
    
    func testShow() {
        let rootViewController = TestViewController()
        rootViewController.chainable
            .show(viewController: UIViewController())
        let result = rootViewController.isCallShow
        XCTAssert(result)
    }
    
    func testShowDetail() {
        let rootViewController = TestViewController()
        rootViewController.chainable
            .showDetail(viewController: UIViewController())
        let result = rootViewController.isCallShowDetail
        XCTAssert(result)
    }
    
    func testPresent() {
        let rootViewController = TestViewController()
        let controller = UIViewController()
        rootViewController.chainable
            .present(controller, isAnimated: false)
        let result = rootViewController.isCallPresent
        XCTAssert(result)
    }
    
    func testDismiss() {
        let rootViewController = TestViewController()
        let controller = UIViewController()
        rootViewController.chainable
            .present(controller, isAnimated: false)
            .dismiss(isAnimated: false)
        let result = rootViewController.isCallDismiss
        XCTAssert(result)
    }
    
    func testModalPresentationStyle() {
        let result = UIViewController().chainable
            .modalPresentationStyle(.fullScreen)
            .wrapped.modalPresentationStyle == .fullScreen
        XCTAssert(result)
    }
    
    func testModalTransitionStyle() {
        let result = UIViewController().chainable
            .modalTransitionStyle(.crossDissolve)
            .wrapped.modalTransitionStyle == .crossDissolve
        XCTAssert(result)
    }
    
    func testIsModalInPresentation() {
        if #available(iOS 13.0, *) {
            let result = UIViewController().chainable
                .isModalInPresentation(true)
                .wrapped.isModalInPresentation
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testIsDefinesPresentationContext() {
        let result = UIViewController().chainable
            .isDefinesPresentationContext(true)
            .wrapped.definesPresentationContext
        XCTAssert(result)
    }
    
    func testIsProvidesPresentationContextTransitionStyle() {
        let result = UIViewController().chainable
            .isProvidesPresentationContextTransitionStyle(true)
            .wrapped.providesPresentationContextTransitionStyle
        XCTAssert(result)
    }
    
    func testIsRestoresFocusAfterTransition() {
        let result = UIViewController().chainable
            .isRestoresFocusAfterTransition(true)
            .wrapped.restoresFocusAfterTransition
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testOverrideUserInterfaceStyle() {
        let result = UIViewController().chainable
            .overrideUserInterfaceStyle(.light)
            .wrapped.overrideUserInterfaceStyle == .light
        XCTAssert(result)
    }
    
    func testAddChildViewController() {
        let controller = UIViewController()
        let result = UIViewController().chainable
            .addChildViewController(controller)
            .wrapped.children.last == controller
        XCTAssert(result)
    }
    
    func testRemoveFromParentViewController() {
        let controller = UIViewController()
        let parentController = UIViewController()
        parentController.addChild(controller)
        let result = controller.chainable
            .removeFromParentViewController()
            .wrapped.parent == nil
        XCTAssert(result)
    }
    
    func testOverrideTraitCollection() {
        let controller = UIViewController()
        let result = UIViewController().chainable
            .addChildViewController(controller)
            .overrideTraitCollection(UITraitCollection(horizontalSizeClass: .regular), childViewController: controller)
            .wrapped.children.last?.traitCollection.horizontalSizeClass == .regular
        XCTAssert(result)
    }
    
    func testIsHidesBottomBarWhenPushed() {
        let result = UIViewController().chainable
            .isHidesBottomBarWhenPushed(true)
            .wrapped.hidesBottomBarWhenPushed
        XCTAssert(result)
    }
    
    func testToolbarItems() {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        let result = UIViewController().chainable
            .toolbarItems([item], isAnimated: false)
            .wrapped.toolbarItems?.last == item
        XCTAssert(result)
    }
    
    func testUpdateScreenEdgesDeferringSystemGestures() {
        let result = TestViewController().chainable
            .updateScreenEdgesDeferringSystemGestures()
            .wrapped.isCallSetNeedsUpdateOfScreenEdgesDeferringSystemGestures
        XCTAssert(result)
    }
    
    func testUpdateHomeIndicatorAutoHidden() {
        let result = TestViewController().chainable
            .updateHomeIndicatorAutoHidden()
            .wrapped.isCallSetNeedsUpdateOfHomeIndicatorAutoHidden
        XCTAssert(result)
    }
    
    func testIsModalPresentationCapturesStatusBarAppearance() {
        let result = UIViewController().chainable
            .isModalPresentationCapturesStatusBarAppearance(true)
            .wrapped.modalPresentationCapturesStatusBarAppearance
        XCTAssert(result)
    }
    
    func updateStatusBarAppearance() {
        let result = TestViewController().chainable
            .updateStatusBarAppearance()
            .wrapped.isCallSetNeedsStatusBarAppearanceUpdate
        XCTAssert(result)
    }
    
    func testIsEditing() {
        let result = UIViewController().chainable
            .isEditing(true, isAnimated: false)
            .wrapped.isEditing
        XCTAssert(result)
    }
    
    func testRestorationIdentifier() {
        let result = UIViewController().chainable
            .restorationIdentifier("Test")
            .wrapped.restorationIdentifier == "Test"
        XCTAssert(result)
    }
    
    func testRestorationClass() {
        let result = UIViewController().chainable
            .restorationClass(TestRestoration.self)
            .wrapped.restorationClass == TestRestoration.self
        XCTAssert(result)
    }
    
}

extension UIViewControllerChainableTests {
    
    class TestViewController: UIViewController {
        
        var isCallSetNeedsUpdateOfScreenEdgesDeferringSystemGestures = false
        var isCallSetNeedsUpdateOfHomeIndicatorAutoHidden = false
        var isCallSetNeedsStatusBarAppearanceUpdate = false
        var isCallShow = false
        var isCallShowDetail = false
        var isCallPresent = false
        var isCallDismiss = false
        
        override func setNeedsUpdateOfScreenEdgesDeferringSystemGestures() {
            isCallSetNeedsUpdateOfScreenEdgesDeferringSystemGestures = true
            super.setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
        }
        
        override func setNeedsUpdateOfHomeIndicatorAutoHidden() {
            isCallSetNeedsUpdateOfHomeIndicatorAutoHidden = true
            super.setNeedsUpdateOfHomeIndicatorAutoHidden()
        }
        
        override func setNeedsStatusBarAppearanceUpdate() {
            isCallSetNeedsStatusBarAppearanceUpdate = true
            super.setNeedsStatusBarAppearanceUpdate()
        }
        
        override func show(_ vc: UIViewController, sender: Any?) {
            isCallShow = true
        }
        
        override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
            isCallShowDetail = true
        }
        
        override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
            isCallPresent = true
        }
        
        override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
            isCallDismiss = true
        }
        
    }
    
    class TestRestoration: UIViewControllerRestoration {
        
        static func viewController(withRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? { nil }
        
    }
    
}
