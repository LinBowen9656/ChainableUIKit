//
//  UISplitViewController+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

final class UISplitViewControllerChainableTests: XCTestCase {
    
    @available(iOS 14.0, *)
    func testViewController() {
        let controller = UIViewController()
        let result = UISplitViewController(style: .doubleColumn).chainable
            .viewController(controller, column: .primary)
            .wrapped.viewController(for: .primary) == controller
        XCTAssert(result)
    }
    
    func testViewControllers(_ controllers: [UIViewController]) {
        let result = UISplitViewController().chainable
            .viewControllers([UINavigationController(), UINavigationController()])
            .wrapped.viewControllers.count == 2
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testIsShowColumn() {
        let showResult = !UISplitViewController(style: .doubleColumn).chainable
            .isShowColumn(true, column: .primary)
            .wrapped.isCollapsed
        let hideResult = !UISplitViewController(style: .doubleColumn).chainable
            .isShowColumn(false, column: .primary)
            .wrapped.isCollapsed
        XCTAssert(showResult && hideResult)
    }
    
    func testShowViewController() {
        let controller = UIViewController()
        let result = UISplitViewController().chainable
            .viewControllers([UINavigationController(), UINavigationController()])
            .showViewController(controller, sender: nil)
            .wrapped.viewControllers.last == controller
        XCTAssert(result)
    }
    
    func testShowDetailViewController() {
        let controller = UIViewController()
        let result = UISplitViewController().chainable
            .viewControllers([UINavigationController(), UINavigationController()])
            .showDetailViewController(controller, sender: nil)
            .wrapped.viewControllers.last == controller
        XCTAssert(result)
    }
    
    func testPreferredDisplayMode() {
        let result = UISplitViewController().chainable
            .preferredDisplayMode(.oneOverSecondary)
            .wrapped.preferredDisplayMode == .oneOverSecondary
        XCTAssert(result)
    }
    
    func testPresentsWithGesture() {
        let result = UISplitViewController().chainable
            .presentsWithGesture(true)
            .wrapped.presentsWithGesture
        XCTAssert(result)
    }
    
    func testShowsSecondaryOnlyButton() {
        if #available(iOS 14.0, *) {
            let result = UISplitViewController(style: .tripleColumn).chainable
                .showsSecondaryOnlyButton(true)
                .wrapped.showsSecondaryOnlyButton
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    @available(iOS 14.0, *)
    func testPreferredSplitBehavior() {
        let result = UISplitViewController(style: .tripleColumn).chainable
            .preferredSplitBehavior(.displace)
            .wrapped.preferredSplitBehavior == .displace
        XCTAssert(result)
    }
    
    func testPreferredPrimaryColumnWidthFraction() {
        let result = UISplitViewController().chainable
            .preferredPrimaryColumnWidthFraction(0.5)
            .wrapped.preferredPrimaryColumnWidthFraction == 0.5
        XCTAssert(result)
    }
    
    func testPreferredPrimaryColumnWidth() {
        if #available(iOS 14.0, *) {
            let result = UISplitViewController().chainable
                .preferredPrimaryColumnWidth(50)
                .wrapped.preferredPrimaryColumnWidth == 50
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testMinimumPrimaryColumnWidth() {
        let result = UISplitViewController().chainable
            .minimumPrimaryColumnWidth(50)
            .wrapped.minimumPrimaryColumnWidth == 50
        XCTAssert(result)
    }
    
    func testMaximumPrimaryColumnWidth() {
        let result = UISplitViewController().chainable
            .maximumPrimaryColumnWidth(50)
            .wrapped.maximumPrimaryColumnWidth == 50
        XCTAssert(result)
    }
    
    func testPreferredSupplementaryColumnWidthFraction() {
        if #available(iOS 14.0, *) {
            let result = UISplitViewController(style: .tripleColumn).chainable
                .preferredSupplementaryColumnWidthFraction(0.5)
                .wrapped.preferredSupplementaryColumnWidthFraction == 0.5
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testPreferredSupplementaryColumnWidth() {
        if #available(iOS 14.0, *) {
            let result = UISplitViewController(style: .tripleColumn).chainable
                .preferredSupplementaryColumnWidth(50)
                .wrapped.preferredSupplementaryColumnWidth == 50
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testMinimumSupplementaryColumnWidth() {
        if #available(iOS 14.0, *) {
            let result = UISplitViewController(style: .tripleColumn).chainable
                .minimumSupplementaryColumnWidth(50)
                .wrapped.minimumSupplementaryColumnWidth == 50
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testMaximumSupplementaryColumnWidth() {
        if #available(iOS 14.0, *) {
            let result = UISplitViewController(style: .tripleColumn).chainable
                .maximumSupplementaryColumnWidth(50)
                .wrapped.maximumSupplementaryColumnWidth == 50
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testPrimaryEdge() {
        let result = UISplitViewController().chainable
            .primaryEdge(.leading)
            .wrapped.primaryEdge == .leading
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testPrimaryBackgroundStyle() {
        let result = UISplitViewController().chainable
            .primaryBackgroundStyle(.sidebar)
            .wrapped.primaryBackgroundStyle == .sidebar
        XCTAssert(result)
    }
    
}
