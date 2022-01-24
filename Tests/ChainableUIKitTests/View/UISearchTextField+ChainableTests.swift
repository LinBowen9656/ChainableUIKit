//
//  UISearchTextField+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/3.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 13.0, *)
final class UISearchTextFieldChainableTests: XCTestCase {
    
    func testReplaceTextualPortion() {
        let textField = UISearchTextField()
        let token = UISearchToken(icon: nil, text: "Test")
        let result = textField.chainable
            .text("Test")
            .replaceTextualPortion(textField.textualRange, token: token, index: 0)
            .wrapped.tokens.first == token
        XCTAssert(result)
    }
    
    func testIsAllowsDeletingTokens() {
        let result = UISearchTextField().chainable
            .isAllowsDeletingTokens(true)
            .wrapped.allowsDeletingTokens
        XCTAssert(result)
    }
    
    func testIsAllowsCopyingTokens() {
        let result = UISearchTextField().chainable
            .isAllowsCopyingTokens(true)
            .wrapped.allowsCopyingTokens
        XCTAssert(result)
    }
    
    func testInsertToken() {
        let token = UISearchToken(icon: nil, text: "Test")
        let result = UISearchTextField().chainable
            .insertToken(token, index: 0)
            .wrapped.tokens.first == token
        XCTAssert(result)
    }
    
    func testRemoveToken() {
        let token = UISearchToken(icon: nil, text: "Test")
        let result = UISearchTextField().chainable
            .insertToken(token, index: 0)
            .removeToken(0)
            .wrapped.tokens.isEmpty
        XCTAssert(result)
    }
    
}
