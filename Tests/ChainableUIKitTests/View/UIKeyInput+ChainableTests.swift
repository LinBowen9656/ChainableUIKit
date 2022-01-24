//
//  UIKeyInput+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/3.
//

import XCTest
@testable import ChainableUIKit

final class UITextFieldUIKeyInputChainableTests: XCTestCase {
    
    func testInsertText() {
        let result = UITextField().chainable
            .insertText("Test")
            .wrapped.text == "Test"
        XCTAssert(result)
    }
    
    func testDeleteBackward() {
        let result = TestTextField().chainable
            .text("Test")
            .deleteBackward()
            .wrapped.isCallDeleteBackward
        XCTAssert(result)
    }
    
}

extension UITextFieldUIKeyInputChainableTests {
    
    class TestTextField: UITextField {
        
        var isCallDeleteBackward = false
        
        override func deleteBackward() {
            isCallDeleteBackward = true
            super.deleteBackward()
        }
        
    }
    
}

final class UITextViewUIKeyInputChainableTests: XCTestCase {
    
    func testInsertText() {
        let result = UITextView().chainable
            .insertText("Test")
            .wrapped.text == "Test"
        XCTAssert(result)
    }
    
    func testDeleteBackward() {
        let result = UITextView().chainable
            .text("Test.")
            .deleteBackward()
            .wrapped.text == "Test"
        XCTAssert(result)
    }
    
}
