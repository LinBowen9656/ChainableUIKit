//
//  UITableViewCell+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/8.
//

import XCTest
@testable import ChainableUIKit

final class UITableViewCellChainableTests: XCTestCase {
    
    @available(iOS 14.0, *)
    func testBackgroundConfiguration() {
        let configuration = UIBackgroundConfiguration.listPlainCell()
        let result = UITableViewCell().chainable
            .backgroundConfiguration(configuration)
            .wrapped.backgroundConfiguration == configuration
        XCTAssert(result)
    }
    
    func testIsAutomaticallyUpdatesBackgroundConfiguration() {
        if #available(iOS 14.0, *) {
            let result = UITableViewCell().chainable
                .isAutomaticallyUpdatesBackgroundConfiguration(true)
                .wrapped.automaticallyUpdatesBackgroundConfiguration
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testBackgroundView() {
        let view = UIView()
        let result = UITableViewCell().chainable
            .backgroundView(view)
            .wrapped.backgroundView == view
        XCTAssert(result)
    }
    
    func testSelectedBackgroundView() {
        let view = UIView()
        let result = UITableViewCell().chainable
            .selectedBackgroundView(view)
            .wrapped.selectedBackgroundView == view
        XCTAssert(result)
    }
    
    func testMultipleSelectionBackgroundView() {
        let view = UIView()
        let result = UITableViewCell().chainable
            .multipleSelectionBackgroundView(view)
            .wrapped.multipleSelectionBackgroundView == view
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testContentConfiguration() {
        let configuration = UIListContentConfiguration.cell()
        let result = UITableViewCell().chainable
            .contentConfiguration(configuration)
            .wrapped.contentConfiguration as? UIListContentConfiguration == configuration
        XCTAssert(result)
    }
    
    func testIsAutomaticallyUpdatesContentConfiguration() {
        if #available(iOS 14.0, *) {
            let result = UITableViewCell().chainable
                .isAutomaticallyUpdatesContentConfiguration(true)
                .wrapped.automaticallyUpdatesContentConfiguration
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testAccessoryType() {
        let result = UITableViewCell().chainable
            .accessoryType(.checkmark)
            .wrapped.accessoryType == .checkmark
        XCTAssert(result)
    }
    
    func testAccessoryView() {
        let view = UIView()
        let result = UITableViewCell().chainable
            .accessoryView(view)
            .wrapped.accessoryView == view
        XCTAssert(result)
    }
    
    func testEditingAccessoryType() {
        let result = UITableViewCell().chainable
            .editingAccessoryType(.checkmark)
            .wrapped.editingAccessoryType == .checkmark
        XCTAssert(result)
    }
    
    func testEditingAccessoryView() {
        let view = UIView()
        let result = UITableViewCell().chainable
            .editingAccessoryView(view)
            .wrapped.editingAccessoryView == view
        XCTAssert(result)
    }
    
    func testSelectionStyle() {
        let result = UITableViewCell().chainable
            .selectionStyle(.gray)
            .wrapped.selectionStyle == .gray
        XCTAssert(result)
    }
    
    func testIsSelected() {
        let result = UITableViewCell().chainable
            .isSelected(true)
            .wrapped.isSelected
        XCTAssert(result)
    }
    
    func testIsHighlighted() {
        let result = UITableViewCell().chainable
            .isHighlighted(true)
            .wrapped.isHighlighted
        XCTAssert(result)
    }
    
    func testIsShowsReorderControl() {
        let result = UITableViewCell().chainable
            .isShowsReorderControl(true)
            .wrapped.showsReorderControl
        XCTAssert(result)
    }
    
    func testIsUserInteractionEnabledWhileDragging() {
        let result = UITableViewCell().chainable
            .isUserInteractionEnabledWhileDragging(true)
            .wrapped.userInteractionEnabledWhileDragging
        XCTAssert(result)
    }
    
    func testIndentationLevel() {
        let result = UITableViewCell().chainable
            .indentationLevel(5)
            .wrapped.indentationLevel == 5
        XCTAssert(result)
    }
    
    func testIndentationWidth() {
        let result = UITableViewCell().chainable
            .indentationWidth(5)
            .wrapped.indentationWidth == 5
        XCTAssert(result)
    }
    
    func testSeparatorInset() {
        let cell = UITableViewCell()
        cell.separatorInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let result = UITableViewCell(style: .default, reuseIdentifier: nil).chainable
            .separatorInset(UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
            .wrapped.separatorInset == cell.separatorInset
        XCTAssert(result)
    }
    
    func testIsShouldIndentWhileEditing() {
        let result = UITableViewCell().chainable
            .isShouldIndentWhileEditing(true)
            .wrapped.shouldIndentWhileEditing
        XCTAssert(result)
    }
    
    func testFocusStyle() {
        let result = UITableViewCell().chainable
            .focusStyle(.custom)
            .wrapped.focusStyle == .custom
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testConfigurationUpdateHandler() {
        if #available(iOS 15.0, *) {
            let result = UITableViewCell().chainable
                .configurationUpdateHandler { cell, state in }
                .wrapped.configurationUpdateHandler != nil
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}
