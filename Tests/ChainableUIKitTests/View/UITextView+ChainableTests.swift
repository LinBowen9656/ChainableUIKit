//
//  UITextView+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/14.
//

import XCTest
@testable import ChainableUIKit

final class UITextViewChainableTests: XCTestCase {
    
    func testText() {
        let result = UITextView().chainable
            .text("Test")
            .wrapped.text == "Test"
        XCTAssert(result)
    }
    
    func testAttributedText() {
        let result = UITextView().chainable
            .attributedText(NSAttributedString(string: "Test"))
            .wrapped.attributedText.string == "Test"
        XCTAssert(result)
    }
    
    func testFont() {
        let result = UITextView().chainable
            .font(.systemFont(ofSize: 55))
            .wrapped.font == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testTextColor() {
        let result = UITextView().chainable
            .textColor(.red)
            .wrapped.textColor == .red
        XCTAssert(result)
    }
    
    func testTextAlignment() {
        let result = UITextView().chainable
            .textAlignment(.center)
            .wrapped.textAlignment == .center
        XCTAssert(result)
    }
    
    func testIsEditable() {
        let result = UITextView().chainable
            .isEditable(true)
            .wrapped.isEditable
        XCTAssert(result)
    }
    
    func testIsAllowsEditingTextAttributes() {
        let result = UITextView().chainable
            .isAllowsEditingTextAttributes(true)
            .wrapped.allowsEditingTextAttributes
        XCTAssert(result)
    }
    
    func testDataDetectorTypes() {
        let result = UITextView().chainable
            .dataDetectorTypes(.address)
            .wrapped.dataDetectorTypes == .address
        XCTAssert(result)
    }
    
    func testTypingAttributes() {
        let result = UITextView().chainable
            .typingAttributes([.font: UIFont.systemFont(ofSize: 55)])
            .wrapped.typingAttributes[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testLinkTextAttributes() {
        let result = UITextView().chainable
            .linkTextAttributes([.font: UIFont.systemFont(ofSize: 55)])
            .wrapped.linkTextAttributes[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testTextContainerInset() {
        let result = UITextView().chainable
            .textContainerInset(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .wrapped.textContainerInset == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        XCTAssert(result)
    }
    
    func testSelectedNSRange() {
        let result = UITextView().chainable
            .text("Test")
            .selectedRange(NSRange(location: 0, length: 4))
            .wrapped.selectedRange == NSRange(location: 0, length: 4)
        XCTAssert(result)
    }
    
    func testSelectedRange() {
        let result = UITextView().chainable
            .text("Test")
            .selectedRange("Test".startIndex..<"Test".endIndex)
            .wrapped.selectedRange == NSRange("Test".startIndex..<"Test".endIndex, in: "Test")
        XCTAssert(result)
    }
    
    func testIsClearsOnInsertion() {
        let result = UITextView().chainable
            .isClearsOnInsertion(true)
            .wrapped.clearsOnInsertion
        XCTAssert(result)
    }
    
    func testIsSelectable() {
        let result = UITextView().chainable
            .isSelectable(true)
            .wrapped.isSelectable
        XCTAssert(result)
    }
    
    func testInputView() {
        let view = UIView()
        let result = UITextView().chainable
            .inputView(view)
            .wrapped.inputView == view
        XCTAssert(result)
    }
    
    func testInputAccessoryView() {
        let view = UIView()
        let result = UITextView().chainable
            .inputAccessoryView(view)
            .wrapped.inputAccessoryView == view
        XCTAssert(result)
    }
    
    func testIsUsesStandardTextScaling() {
        if #available(iOS 13.0, *) {
            let result = UITextView().chainable
                .isUsesStandardTextScaling(true)
                .wrapped.usesStandardTextScaling
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}
