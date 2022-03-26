//
//  UIStepper+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/8.
//

import XCTest
@testable import ChainableUIKit

final class UIStepperChainableTests: XCTestCase {
    
    func testValue() {
        let result = UIStepper().chainable
            .value(5)
            .wrapped.value == 5
        XCTAssert(result)
    }
    
    func testAutorepeat() {
        let result = UIStepper().chainable
            .autorepeat(true)
            .wrapped.autorepeat
        XCTAssert(result)
    }
    
    func testMinimumValue() {
        let result = UIStepper().chainable
            .minimumValue(5)
            .wrapped.minimumValue == 5
        XCTAssert(result)
    }
    
    func testMaximumValue() {
        let result = UIStepper().chainable
            .maximumValue(5)
            .wrapped.maximumValue == 5
        XCTAssert(result)
    }
    
    func testIsContinuous() {
        let result = UIStepper().chainable
            .isContinuous(true)
            .wrapped.isContinuous
        XCTAssert(result)
    }
    
    func testWraps() {
        let result = UIStepper().chainable
            .wraps(true)
            .wrapped.wraps
        XCTAssert(result)
    }
    
    func testStepValue() {
        let result = UIStepper().chainable
            .stepValue(5)
            .wrapped.stepValue == 5
        XCTAssert(result)
    }
    
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UIStepper().chainable
            .backgroundImage(image, state: .normal)
            .wrapped.backgroundImage(for: .normal) != nil
        XCTAssert(result)
    }
    
    func testIncrementImage() {
        let image = testPNGImage
        let result = UIStepper().chainable
            .incrementImage(image, state: .normal)
            .wrapped.incrementImage(for: .normal) == image
        XCTAssert(result)
    }
    
    func testDecrementImage() {
        let image = testPNGImage
        let result = UIStepper().chainable
            .decrementImage(image, state: .normal)
            .wrapped.decrementImage(for: .normal) == image
        XCTAssert(result)
    }
    
    func testDividerImage() {
        let image = testPNGImage
        let result = UIStepper().chainable
            .dividerImage(image, leftSegmentState: .normal, rightSegmentState: .normal)
            .wrapped.dividerImage(forLeftSegmentState: .normal, rightSegmentState: .normal) == image
        XCTAssert(result)
    }
    
}
