//
//  UIGestureRecognizer+ChainableTests.swift
//
//
//  Created by 林博文 on 2022/1/2.
//

import XCTest
@testable import ChainableUIKit

final class UIGestureRecognizerChainableTests: XCTestCase {
    
    func testState() {
        let result = UIGestureRecognizer().chainable
            .state(.failed)
            .wrapped.state == .failed
        XCTAssert(result)
    }
    
    func testRequireToFail() {
        let result = TestGestureRecognizer().chainable
            .requireToFail(UIGestureRecognizer())
            .wrapped.isCallRequireToFail
        XCTAssert(result)
    }
    
    func testIsEnabled() {
        let result = UIGestureRecognizer().chainable
            .isEnabled(true)
            .wrapped.isEnabled
        XCTAssert(result)
    }
    
    func testIsCancelsTouchesInView() {
        let result = UIGestureRecognizer().chainable
            .isCancelsTouchesInView(true)
            .wrapped.cancelsTouchesInView
        XCTAssert(result)
    }
    
    func testIsDelaysTouchesBegan() {
        let result = UIGestureRecognizer().chainable
            .isDelaysTouchesBegan(true)
            .wrapped.delaysTouchesBegan
        XCTAssert(result)
    }
    
    func testIsDelaysTouchesEnded() {
        let result = UIGestureRecognizer().chainable
            .isDelaysTouchesEnded(true)
            .wrapped.delaysTouchesEnded
        XCTAssert(result)
    }
    
    func testAllowedPressTypes() {
        let result = UIGestureRecognizer().chainable
            .allowedPressTypes([.select])
            .wrapped.allowedPressTypes == [NSNumber(value: UIPress.PressType.select.rawValue)]
        XCTAssert(result)
    }
    
    func testAllowedTouchTypes() {
        let result = UIGestureRecognizer().chainable
            .allowedTouchTypes([.pencil])
            .wrapped.allowedTouchTypes == [NSNumber(value: UITouch.TouchType.pencil.rawValue)]
        XCTAssert(result)
    }
    
    func testIsRequiresExclusiveTouchType() {
        let result = UIGestureRecognizer().chainable
            .isRequiresExclusiveTouchType(true)
            .wrapped.requiresExclusiveTouchType
        XCTAssert(result)
    }
    
    func testAddTarget() {
        let target = TestTarget()
        let result = TestGestureRecognizer().chainable
            .addTarget(target: target, action: #selector(target.action))
            .wrapped.isCallAddTarget
        XCTAssert(result)
    }
    
    func testRemoveTarget() {
        let target = TestTarget()
        let result = TestGestureRecognizer().chainable
            .addTarget(target: target, action: #selector(target.action))
            .removeTarget(target: target, action: #selector(target.action))
            .wrapped.isCallRemoveTarget
        XCTAssert(result)
    }
    
    func testAddActionHandler() {
        let result = TestGestureRecognizer().chainable
            .addActionHandler { _ in }
            .wrapped.isCallAddTarget
        XCTAssert(result)
    }
    
    func testRemoveActionHandler() {
        let result = TestGestureRecognizer().chainable
            .addActionHandler { _ in }
            .removeActionHandler()
            .wrapped.isCallRemoveTarget
        XCTAssert(result)
    }
    
}

extension UIGestureRecognizerChainableTests {
    
    class TestGestureRecognizer: UIGestureRecognizer {
        
        var isCallRequireToFail = false
        var isCallAddTarget = false
        var isCallRemoveTarget = false
        
        override func require(toFail otherGestureRecognizer: UIGestureRecognizer) {
            isCallRequireToFail = true
            super.require(toFail: otherGestureRecognizer)
        }
        
        override func addTarget(_ target: Any, action: Selector) {
            isCallAddTarget = true
            super.addTarget(target, action: action)
        }
        
        override func removeTarget(_ target: Any?, action: Selector?) {
            isCallRemoveTarget = true
            super.removeTarget(target, action: action)
        }
        
    }
    
    class TestTarget {
        
        @objc
        func action() {}
        
    }
    
}
