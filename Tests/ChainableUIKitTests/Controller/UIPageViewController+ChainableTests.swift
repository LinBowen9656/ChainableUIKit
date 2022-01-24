//
//  UIPageViewController+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

final class UIPageViewControllerChainableTests: XCTestCase {
    
    func testViewControllers() {
        let controller = UIViewController()
        let result = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal).chainable
            .viewControllers([controller], direction: .forward, isAnimated: false, completionHandler: nil)
            .wrapped.viewControllers == [controller]
        XCTAssert(result)
    }
    
    func testIsDoubleSided() {
        let result = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal).chainable
            .isDoubleSided(true)
            .wrapped.isDoubleSided
        XCTAssert(result)
    }
    
}
