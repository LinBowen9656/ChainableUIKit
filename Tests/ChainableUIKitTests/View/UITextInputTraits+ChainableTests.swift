//
//  UITextInputTraits+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/14.
//

import XCTest
@testable import ChainableUIKit

extension UITextFieldChainableTests {
    
    func testKeyboardType() {
        let result = UITextField().chainable
            .keyboardType(.URL)
            .wrapped.keyboardType == .URL
        XCTAssert(result)
    }
    
    func testKeyboardAppearance() {
        let result = UITextField().chainable
            .keyboardAppearance(.dark)
            .wrapped.keyboardAppearance == .dark
        XCTAssert(result)
    }
    
    func testReturnKeyType() {
        let result = UITextField().chainable
            .returnKeyType(.continue)
            .wrapped.returnKeyType == .continue
        XCTAssert(result)
    }
    
    func testTextContentType() {
        let result = UITextField().chainable
            .textContentType(.URL)
            .wrapped.textContentType == .URL
        XCTAssert(result)
    }
    
    func testIsSecureTextEntry() {
        let result = UITextField().chainable
            .isSecureTextEntry(true)
            .wrapped.isSecureTextEntry
        XCTAssert(result)
    }
    
    func testEnablesReturnKeyAutomatically() {
        let result = UITextField().chainable
            .enablesReturnKeyAutomatically(true)
            .wrapped.enablesReturnKeyAutomatically
        XCTAssert(result)
    }
    
    func testAutocapitalizationType() {
        let result = UITextField().chainable
            .autocapitalizationType(.allCharacters)
            .wrapped.autocapitalizationType == .allCharacters
        XCTAssert(result)
    }
    
    func testAutocorrectionType() {
        let result = UITextField().chainable
            .autocorrectionType(.no)
            .wrapped.autocorrectionType == .no
        XCTAssert(result)
    }
    
    func testSpellCheckingType() {
        let result = UITextField().chainable
            .spellCheckingType(.no)
            .wrapped.spellCheckingType == .no
        XCTAssert(result)
    }
    
    func testSmartQuotesType() {
        let result = UITextField().chainable
            .smartQuotesType(.no)
            .wrapped.smartQuotesType == .no
        XCTAssert(result)
    }
    
    func testSmartDashesType() {
        let result = UITextField().chainable
            .smartDashesType(.no)
            .wrapped.smartDashesType == .no
        XCTAssert(result)
    }
    
    func testSmartInsertDeleteType() {
        let result = UITextField().chainable
            .smartInsertDeleteType(.no)
            .wrapped.smartInsertDeleteType == .no
        XCTAssert(result)
    }
    
    @available(iOS 12.0, *)
    func testPasswordRules() {
        let rules = UITextInputPasswordRules(descriptor: "minlength: 20; required: lower; required: upper; required: digit; required: [-];")
        let result = UITextField().chainable
            .passwordRules(rules)
            .wrapped.passwordRules == rules
        XCTAssert(result)
    }
    
}

extension UITextViewChainableTests {
    
    func testKeyboardType() {
        let result = UITextView().chainable
            .keyboardType(.URL)
            .wrapped.keyboardType == .URL
        XCTAssert(result)
    }
    
    func testKeyboardAppearance() {
        let result = UITextView().chainable
            .keyboardAppearance(.dark)
            .wrapped.keyboardAppearance == .dark
        XCTAssert(result)
    }
    
    func testReturnKeyType() {
        let result = UITextView().chainable
            .returnKeyType(.continue)
            .wrapped.returnKeyType == .continue
        XCTAssert(result)
    }
    
    func testTextContentType() {
        let result = UITextView().chainable
            .textContentType(.URL)
            .wrapped.textContentType == .URL
        XCTAssert(result)
    }
    
    func testIsSecureTextEntry() {
        let result = UITextView().chainable
            .isSecureTextEntry(true)
            .wrapped.isSecureTextEntry
        XCTAssert(result)
    }
    
    func testEnablesReturnKeyAutomatically() {
        let result = UITextView().chainable
            .enablesReturnKeyAutomatically(true)
            .wrapped.enablesReturnKeyAutomatically
        XCTAssert(result)
    }
    
    func testAutocapitalizationType() {
        let result = UITextView().chainable
            .autocapitalizationType(.allCharacters)
            .wrapped.autocapitalizationType == .allCharacters
        XCTAssert(result)
    }
    
    func testAutocorrectionType() {
        let result = UITextView().chainable
            .autocorrectionType(.no)
            .wrapped.autocorrectionType == .no
        XCTAssert(result)
    }
    
    func testSpellCheckingType() {
        let result = UITextView().chainable
            .spellCheckingType(.no)
            .wrapped.spellCheckingType == .no
        XCTAssert(result)
    }
    
    func testSmartQuotesType() {
        let result = UITextView().chainable
            .smartQuotesType(.no)
            .wrapped.smartQuotesType == .no
        XCTAssert(result)
    }
    
    func testSmartDashesType() {
        let result = UITextView().chainable
            .smartDashesType(.no)
            .wrapped.smartDashesType == .no
        XCTAssert(result)
    }
    
    func testSmartInsertDeleteType() {
        let result = UITextView().chainable
            .smartInsertDeleteType(.no)
            .wrapped.smartInsertDeleteType == .no
        XCTAssert(result)
    }
    
    @available(iOS 12.0, *)
    func testPasswordRules() {
        let rules = UITextInputPasswordRules(descriptor: "minlength: 20; required: lower; required: upper; required: digit; required: [-];")
        let result = UITextView().chainable
            .passwordRules(rules)
            .wrapped.passwordRules == rules
        XCTAssert(result)
    }
    
}
