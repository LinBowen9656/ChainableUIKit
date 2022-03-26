//
//  UITextField+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/14.
//

import XCTest
@testable import ChainableUIKit

final class UITextFieldChainableTests: XCTestCase {
    
    func testText() {
        let result = UITextField().chainable
            .text("Test")
            .wrapped.text == "Test"
        XCTAssert(result)
    }
    
    func testAttributedText() {
        let result = UITextField().chainable
            .attributedText(NSAttributedString(string: "Test"))
            .wrapped.attributedText?.string == "Test"
        XCTAssert(result)
    }
    
    func testPlaceholder() {
        let result = UITextField().chainable
            .placeholder("Test")
            .wrapped.placeholder == "Test"
        XCTAssert(result)
    }
    
    func testAttributedPlaceholder() {
        let result = UITextField().chainable
            .attributedPlaceholder(NSAttributedString(string: "Test"))
            .wrapped.attributedPlaceholder == NSAttributedString(string: "Test")
        XCTAssert(result)
    }
    
    func testDefaultTextAttributes() {
        let result = UITextField().chainable
            .defaultTextAttributes([.font: UIFont.systemFont(ofSize: 55)])
            .wrapped.defaultTextAttributes[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testFont() {
        let result = UITextField().chainable
            .font(.systemFont(ofSize: 55))
            .wrapped.font == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testTextColor() {
        let result = UITextField().chainable
            .textColor(.red)
            .wrapped.textColor == .red
        XCTAssert(result)
    }
    
    func testTextAlignment() {
        let result = UITextField().chainable
            .textAlignment(.center)
            .wrapped.textAlignment == .center
        XCTAssert(result)
    }
    
    func testTypingAttributes() {
        let result = TestTextField().chainable
            .typingAttributes([.font: UIFont.systemFont(ofSize: 55)])
            .wrapped.isCallTypingAttributes
        XCTAssert(result)
    }
    
    func testClearsOnBeginEditing() {
        let result = UITextField().chainable
            .clearsOnBeginEditing(true)
            .wrapped.clearsOnBeginEditing
        XCTAssert(result)
    }
    
    func testClearsOnInsertion() {
        let result = UITextField().chainable
            .clearsOnInsertion(true)
            .wrapped.clearsOnInsertion
        XCTAssert(result)
    }
    
    func testAllowsEditingTextAttributes() {
        let result = UITextField().chainable
            .allowsEditingTextAttributes(true)
            .wrapped.allowsEditingTextAttributes
        XCTAssert(result)
    }
    
    func testBorderStyle() {
        let result = UITextField().chainable
            .borderStyle(.roundedRect)
            .wrapped.borderStyle == .roundedRect
        XCTAssert(result)
    }
    
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UITextField().chainable
            .backgroundImage(image)
            .wrapped.background == image
        XCTAssert(result)
    }
    
    func testDisabledBackgroundImage() {
        let image = testPNGImage
        let result = UITextField().chainable
            .disabledBackgroundImage(image)
            .wrapped.disabledBackground == image
        XCTAssert(result)
    }
    
    func testClearButtonMode() {
        let result = UITextField().chainable
            .clearButtonMode(.always)
            .wrapped.clearButtonMode == .always
        XCTAssert(result)
    }
    
    func testLeftView() {
        let view = UIView()
        let result = UITextField().chainable
            .leftView(view)
            .wrapped.leftView == view
        XCTAssert(result)
    }
    
    func testLeftViewMode() {
        let result = UITextField().chainable
            .leftViewMode(.unlessEditing)
            .wrapped.leftViewMode == .unlessEditing
        XCTAssert(result)
    }
    
    func testRightView() {
        let view = UIView()
        let result = UITextField().chainable
            .rightView(view)
            .wrapped.rightView == view
        XCTAssert(result)
    }
    
    func testRightViewMode() {
        let result = UITextField().chainable
            .rightViewMode(.unlessEditing)
            .wrapped.rightViewMode == .unlessEditing
        XCTAssert(result)
    }
    
    func testInputView() {
        let view = UIView()
        let result = UITextField().chainable
            .inputView(view)
            .wrapped.inputView == view
        XCTAssert(result)
    }
    
    func testInputAccessoryView() {
        let view = UIView()
        let result = UITextField().chainable
            .inputAccessoryView(view)
            .wrapped.inputAccessoryView == view
        XCTAssert(result)
    }
    
}

extension UITextFieldChainableTests {
    
    class TestTextField: UITextField {
        
        var isCallTypingAttributes = false
        override var typingAttributes: [NSAttributedString.Key : Any]? {
            get {
                super.typingAttributes
            }
            set {
                isCallTypingAttributes = true
                super.typingAttributes = newValue
            }
        }
        
    }
    
}
