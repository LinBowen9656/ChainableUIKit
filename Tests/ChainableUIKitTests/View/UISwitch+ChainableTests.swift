//
//  UISwitch+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/8.
//

import XCTest
@testable import ChainableUIKit

final class UISwitchChainableTests: XCTestCase {
    
    func testIsOn() {
        let result = UISwitch().chainable
            .isOn(true, isAnimated: false)
            .wrapped.isOn
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testPreferredStyle() {
        let result = UISwitch().chainable
            .preferredStyle(.sliding)
            .wrapped.preferredStyle == .sliding
        XCTAssert(result)
    }
    
    func testTitle() {
        if #available(iOS 14.0, *) {
            let result = UISwitch().chainable
                .title("Test")
                .wrapped.title == "Test"
            XCTAssert(UIDevice.current.userInterfaceIdiom != .mac || result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testOnTintColor() {
        let result = UISwitch().chainable
            .onTintColor(.red)
            .wrapped.onTintColor == .red
        XCTAssert(result)
    }
    
    func testThumbTintColor() {
        let result = UISwitch().chainable
            .thumbTintColor(.red)
            .wrapped.thumbTintColor == .red
        XCTAssert(result)
    }
    
}
