//
//  UIResponder+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/16.
//

import XCTest
@testable import ChainableUIKit

final class UIResponderChainableTests: XCTestCase {
    
    func testBecomeFirstResponder() {
        let result = TestResponder().chainable
            .becomeFirstResponder()
            .wrapped.isCallBecomeFirstResponder
        XCTAssert(result)
    }
    
    func testResignFirstResponder() {
        let result = TestResponder().chainable
            .resignFirstResponder()
            .wrapped.isCallResignFirstResponder
        XCTAssert(result)
    }
    
}

extension UIResponderChainableTests {
    
    class TestResponder: UIResponder {
        
        var isCallBecomeFirstResponder = false
        var isCallResignFirstResponder = false
        override var canBecomeFirstResponder: Bool { true }
        
        override func becomeFirstResponder() -> Bool {
            isCallBecomeFirstResponder = true
            return super.becomeFirstResponder()
        }
        
        override func resignFirstResponder() -> Bool {
            isCallResignFirstResponder = true
            return super.resignFirstResponder()
        }
        
    }
    
}
