//
//  UINavigationItem+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/2.
//

import XCTest
@testable import ChainableUIKit

final class UINavigationItemChainableTests: XCTestCase {
    
    func testTitle() {
        let result = UINavigationItem().chainable
            .title("Test")
            .wrapped.title == "Test"
        XCTAssert(result)
    }
    
    func testLargeTitleDisplayMode() {
        let result = UINavigationItem().chainable
            .largeTitleDisplayMode(.always)
            .wrapped.largeTitleDisplayMode == .always
        XCTAssert(result)
    }
    
    func testBackBarButtonItem() {
        let item = UIBarButtonItem()
        let result = UINavigationItem().chainable
            .backBarButtonItem(item)
            .wrapped.backBarButtonItem == item
        XCTAssert(result)
    }
    
    func testBackButtonTitle() {
        let result = UINavigationItem().chainable
            .backButtonTitle("Test")
            .wrapped.backButtonTitle == "Test"
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testBackButtonDisplayMode() {
        let result = UINavigationItem().chainable
            .backButtonDisplayMode(.minimal)
            .wrapped.backButtonDisplayMode == .minimal
        XCTAssert(result)
    }
    
    func testIsHidesBackButton() {
        let result = UINavigationItem().chainable
            .isHidesBackButton(true, isAnimated: false)
            .wrapped.hidesBackButton
        XCTAssert(result)
    }
    
    func testPrompt() {
        let result = UINavigationItem().chainable
            .prompt("Test")
            .wrapped.prompt == "Test"
        XCTAssert(result)
    }
    
    func testIsLeftItemsSupplementBackButton() {
        let result = UINavigationItem().chainable
            .isLeftItemsSupplementBackButton(true)
            .wrapped.leftItemsSupplementBackButton
        XCTAssert(result)
    }
    
    func testLeftBarButtonItems() {
        let items = [UIBarButtonItem()]
        let result = UINavigationItem().chainable
            .leftBarButtonItems(items, isAnimated: false)
            .wrapped.leftBarButtonItems == items
        XCTAssert(result)
    }
    
    func testRightBarButtonItems() {
        let items = [UIBarButtonItem()]
        let result = UINavigationItem().chainable
            .rightBarButtonItems(items, isAnimated: false)
            .wrapped.rightBarButtonItems == items
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testStandardAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        let result = UINavigationItem().chainable
            .standardAppearance(appearance)
            .wrapped.standardAppearance == appearance
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testCompactAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        let result = UINavigationItem().chainable
            .compactAppearance(appearance)
            .wrapped.compactAppearance == appearance
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testScrollEdgeAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        let result = UINavigationItem().chainable
            .scrollEdgeAppearance(appearance)
            .wrapped.scrollEdgeAppearance == appearance
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testCompactScrollEdgeAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            let result = UINavigationItem().chainable
                .compactScrollEdgeAppearance(appearance)
                .wrapped.compactScrollEdgeAppearance == appearance
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testSearchController() {
        let controller = UISearchController()
        let result = UINavigationItem().chainable
            .searchController(controller)
            .wrapped.searchController == controller
        XCTAssert(result)
    }
    
    func testIsHidesSearchBarWhenScrolling() {
        let result = UINavigationItem().chainable
            .isHidesSearchBarWhenScrolling(true)
            .wrapped.hidesSearchBarWhenScrolling
        XCTAssert(result)
    }
    
}
