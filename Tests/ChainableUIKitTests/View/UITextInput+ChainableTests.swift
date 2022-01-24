//
//  UITextInput+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/3.
//

import XCTest
@testable import ChainableUIKit

extension UITextFieldChainableTests {
    
    func testReplace() {
        let textField = UITextField()
        let result = textField.chainable
            .text("Test")
            .replace(range: textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)!, with: "")
            .wrapped.text == ""
        XCTAssert(result)
    }
    
    func testSelectedTextRange() {
        let textField = UITextField()
        let result = textField.chainable
            .text("Test")
            .selectedTextRange(textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument))
            .wrapped.selectedTextRange == textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
        XCTAssert(result)
    }
    
    func testMarkedText() {
        let textField = UITextField()
        let markedTextRange = textField.chainable
            .text("Test")
            .markedText("Test", range: (textField.text! as NSString).range(of: "Test"))
            .wrapped.markedTextRange!
        let result = textField.text(in: markedTextRange) == "Test"
        XCTAssert(result)
    }
    
    func testAttributedMarkedText() {
        let textField = UITextField()
        let markedTextRange = textField.chainable
            .text("Test")
            .attributedMarkedText(NSAttributedString(string: "Test"), range: (textField.text! as NSString).range(of: "Test"))
            .wrapped.markedTextRange!
        let result = textField.text(in: markedTextRange) == "Test"
        XCTAssert(result)
    }
    
    func testUnmarkText() {
        let textField = UITextField()
        let result = textField.chainable
            .text("Test")
            .markedText("Test", range: (textField.text! as NSString).range(of: "Test"))
            .unmarkText()
            .wrapped.markedTextRange == nil
        XCTAssert(result)
    }
    
    func testBaseWritingDirection() {
        let textField = UITextField()
        let result = textField.chainable
            .text("Test")
            .baseWritingDirection(.rightToLeft, for: textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)!)
            .wrapped.baseWritingDirection(for: textField.beginningOfDocument, in: .forward) == .rightToLeft
        XCTAssert(result)
    }
    
}

extension UITextViewChainableTests {
    
    func testReplace() {
        let textView = UITextView()
        let result = textView.chainable
            .text("Test")
            .replace(range: textView.textRange(from: textView.beginningOfDocument, to: textView.endOfDocument)!, with: "")
            .wrapped.text == ""
        XCTAssert(result)
    }
    
    func testSelectedTextRange() {
        let textView = UITextView()
        let result = textView.chainable
            .text("Test")
            .selectedTextRange(textView.textRange(from: textView.beginningOfDocument, to: textView.endOfDocument))
            .wrapped.selectedTextRange == textView.textRange(from: textView.beginningOfDocument, to: textView.endOfDocument)
        XCTAssert(result)
    }
    
    func testMarkedText() {
        let textView = UITextView()
        let markedTextRange = textView.chainable
            .text("Test")
            .markedText("Test", range: (textView.text! as NSString).range(of: "Test"))
            .wrapped.markedTextRange!
        let result = textView.text(in: markedTextRange) == "Test"
        XCTAssert(result)
    }
    
    func testAttributedMarkedText() {
        let textView = UITextView()
        let markedTextRange = textView.chainable
            .text("Test")
            .attributedMarkedText(NSAttributedString(string: "Test"), range: (textView.text! as NSString).range(of: "Test"))
            .wrapped.markedTextRange!
        let result = textView.text(in: markedTextRange) == "Test"
        XCTAssert(result)
    }
    
    func testUnmarkText() {
        let textView = UITextView()
        let result = textView.chainable
            .text("Test")
            .markedText("Test", range: (textView.text! as NSString).range(of: "Test"))
            .unmarkText()
            .wrapped.markedTextRange == nil
        XCTAssert(result)
    }
    
    func testBaseWritingDirection() {
        let textView = UITextView()
        let result = textView.chainable
            .text("Test")
            .baseWritingDirection(.rightToLeft, for: textView.textRange(from: textView.beginningOfDocument, to: textView.endOfDocument)!)
            .wrapped.baseWritingDirection(for: textView.beginningOfDocument, in: .forward) == .rightToLeft
        XCTAssert(result)
    }
    
}
