//
//  UIActivityIndicatorView+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/26.
//

import XCTest
@testable import ChainableUIKit

final class UIActivityIndicatorViewChainableTests: XCTestCase {
    
    func testHidesWhenStop() {
        let result = UIActivityIndicatorView(style: .white).chainable
            .hidesWhenStop(true)
            .wrapped.hidesWhenStopped
        XCTAssert(result)
    }
    
    func testIsAnimating() {
        let startResult = TestActivityIndicatorView(style: .white).chainable
            .isAnimating(true)
            .wrapped.isCallStartAnimating
        let stopResult = TestActivityIndicatorView(style: .white).chainable
            .isAnimating(false)
            .wrapped.isCallStopAnimating
        XCTAssert(startResult && stopResult)
    }
    
    func testStyle() {
        let result = UIActivityIndicatorView(style: .white).chainable
            .style(.gray)
            .wrapped.style == .gray
        XCTAssert(result)
    }
    
    func testColor() {
        let result = UIActivityIndicatorView(style: .white).chainable
            .color(.red)
            .wrapped.color == .red
        XCTAssert(result)
    }
    
}

extension UIActivityIndicatorViewChainableTests {
    
    class TestActivityIndicatorView: UIActivityIndicatorView {
        
        var isCallStartAnimating = false
        var isCallStopAnimating = false
        
        override func startAnimating() {
            isCallStartAnimating = true
            super.startAnimating()
        }
        
        override func stopAnimating() {
            isCallStopAnimating = true
            super.stopAnimating()
        }
        
    }
    
}
