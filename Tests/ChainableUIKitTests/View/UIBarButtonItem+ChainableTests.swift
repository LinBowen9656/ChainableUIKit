//
//  UIBarButtonItem+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/26.
//

import XCTest
@testable import ChainableUIKit

final class UIBarButtonItemChainableTests: XCTestCase {
    
    func testAddTarget() {
        let item = UIBarButtonItem()
        let action = Action()
        item.chainable
            .addTarget(target: action, action: #selector(action.test))
        let result = item.target === action && item.action == #selector(action.test)
        XCTAssert(result)
    }
    
    func testStyle() {
        let result = UIBarButtonItem().chainable
            .style(.plain)
            .wrapped.style == .plain
        XCTAssert(result)
    }
    
    func testPossibleTitles() {
        let result = UIBarButtonItem().chainable
            .possibleTitles(["Test"])
            .wrapped.possibleTitles == ["Test"]
        XCTAssert(result)
    }
    
    func testWidth() {
        let result = UIBarButtonItem().chainable
            .width(55)
            .wrapped.width == 55
        XCTAssert(result)
    }
    
    func testCustomView() {
        let view = UIView()
        let result = UIBarButtonItem().chainable
            .customView(view)
            .wrapped.customView == view
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testMenu() {
        let menu = UIMenu(title: "Test")
        let result = UIBarButtonItem().chainable
            .menu(menu)
            .wrapped.menu == menu
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testPrimaryAction() {
        let action = UIAction { _ in }
        let result = UIBarButtonItem().chainable
            .primaryAction(action)
            .wrapped.primaryAction == action
        XCTAssert(result)
    }
    
    func testTintColor() {
        let result = UIBarButtonItem().chainable
            .tintColor(.red)
            .wrapped.tintColor == .red
        XCTAssert(result)
    }
    
    func testBackButtonBackgroundImage() {
        let image = testPNGImage
        let result = UIBarButtonItem().chainable
            .backButtonBackgroundImage(image, state: .normal, barMetrics: .default)
            .wrapped.backButtonBackgroundImage(for: .normal, barMetrics: .default) == image
        XCTAssert(result)
    }
    
    func testBackButtonTitlePositionAdjustment() {
        let result = UIBarButtonItem().chainable
            .backButtonTitlePositionAdjustment(UIOffset(horizontal: 5, vertical: 5), barMetrics: .default)
            .wrapped.backButtonTitlePositionAdjustment(for: .default) == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    func testBackButtonBackgroundVerticalPositionAdjustment() {
        let result = UIBarButtonItem().chainable
            .backButtonBackgroundVerticalPositionAdjustment(5, barMetrics: .default)
            .wrapped.backButtonBackgroundVerticalPositionAdjustment(for: .default) == 5
        XCTAssert(result)
    }
    
    func testBackgroundVerticalPositionAdjustment() {
        let result = UIBarButtonItem().chainable
            .backgroundVerticalPositionAdjustment(5, barMetrics: .default)
            .wrapped.backgroundVerticalPositionAdjustment(for: .default) == 5
        XCTAssert(result)
    }
    
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UIBarButtonItem().chainable
            .backgroundImage(image, state: .normal, barMetrics: .default)
            .wrapped.backgroundImage(for: .normal, barMetrics: .default) == image
        XCTAssert(result)
    }
    
    func testTitlePositionAdjustment() {
        let result = UIBarButtonItem().chainable
            .titlePositionAdjustment(UIOffset(horizontal: 5, vertical: 5), barMetrics: .default)
            .wrapped.titlePositionAdjustment(for: .default) == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    func testAddActionHandler() {
        let result = UIBarButtonItem().chainable
            .addActionHandler { _ in }
            .wrapped.target != nil
        XCTAssert(result)
    }
    
    func testRemoveActionHandler() {
        let action = Action()
        let result = UIBarButtonItem().chainable
            .addTarget(target: action, action: #selector(action.test))
            .removeActionHandler()
            .wrapped.action == nil
        XCTAssert(result)
    }
    
    func testIsChangesSelectionAsPrimaryAction() {
        if #available(iOS 15.0, *) {
            let result = UIBarButtonItem().chainable
                .isChangesSelectionAsPrimaryAction(true)
                .wrapped.changesSelectionAsPrimaryAction
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testIsSelected() {
        if #available(iOS 15.0, *) {
            let result = UIBarButtonItem().chainable
                .isSelected(true)
                .wrapped.isSelected
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}

extension UIBarButtonItemChainableTests {
    
    class Action {
        
        @objc func test() {}
        
    }
    
}
