//
//  UIAlertController+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

final class UIAlertControllerChainableTests: XCTestCase {
    
    func testAddAction() {
        let action = UIAlertAction(title: "Test", style: .default)
        let result = UIAlertController(title: "Test", message: "Test", preferredStyle: .alert).chainable
            .addAction {
                action
            }
            .wrapped.actions == [action]
        XCTAssert(result)
    }
    
    func testPreferredAction() {
        let action = UIAlertAction(title: "Test", style: .default)
        let result = UIAlertController(title: "Test", message: "Test", preferredStyle: .alert).chainable
            .addAction {
                action
            }
            .preferredAction(action)
            .wrapped.preferredAction == action
        XCTAssert(result)
    }
    
    func testAddTextField() {
        var textField: UITextField?
        let result = UIAlertController(title: "Test", message: "Test", preferredStyle: .alert).chainable
            .addTextField {
                textField = $0
            }
            .wrapped.textFields?.last == textField
        XCTAssert(result)
    }
    
    func testTitle() {
        let result = UIAlertController(title: "", message: "Test", preferredStyle: .alert).chainable
            .title("Test")
            .wrapped.title == "Test"
        XCTAssert(result)
    }
    
    func testMessage() {
        let result = UIAlertController(title: "Test", message: "", preferredStyle: .alert).chainable
            .message("Test")
            .wrapped.message == "Test"
        XCTAssert(result)
    }
    
}
