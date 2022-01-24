//
//  UISlider+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/8.
//

import XCTest
@testable import ChainableUIKit

final class UISliderChainableTests: XCTestCase {
    
    func testValue() {
        let result = UISlider().chainable
            .value(0.5, isAnimated: false)
            .wrapped.value == 0.5
        XCTAssert(result)
    }
    
    func testMinimumValue() {
        let result = UISlider().chainable
            .minimumValue(5)
            .wrapped.minimumValue == 5
        XCTAssert(result)
    }
    
    func testMaximumValue() {
        let result = UISlider().chainable
            .maximumValue(5)
            .wrapped.maximumValue == 5
        XCTAssert(result)
    }
    
    func testIsContinuous() {
        let result = UISlider().chainable
            .isContinuous(true)
            .wrapped.isContinuous
        XCTAssert(result)
    }
    
    func testMinimumTrackImage() {
        let image = testPNGImage
        let result = UISlider().chainable
            .minimumTrackImage(image, state: .normal)
            .wrapped.minimumTrackImage(for: .normal) == image
        XCTAssert(result)
    }
    
    func testMaximumTrackImage() {
        let image = testPNGImage
        let result = UISlider().chainable
            .maximumTrackImage(image, state: .normal)
            .wrapped.maximumTrackImage(for: .normal) == image
        XCTAssert(result)
    }
    
    func testThumbImage() {
        let image = testPNGImage
        let result = UISlider().chainable
            .thumbImage(image, state: .normal)
            .wrapped.thumbImage(for: .normal) == image
        XCTAssert(result)
    }
    
    func testMinimumTrackTintColor() {
        let result = UISlider().chainable
            .minimumTrackTintColor(.red)
            .wrapped.minimumTrackTintColor == .red
        XCTAssert(result)
    }
    
    func testMaximumTrackTintColor() {
        let result = UISlider().chainable
            .maximumTrackTintColor(.red)
            .wrapped.maximumTrackTintColor == .red
        XCTAssert(result)
    }
    
    func testThumbTintColor() {
        let result = UISlider().chainable
            .thumbTintColor(.red)
            .wrapped.thumbTintColor == .red
        XCTAssert(result)
    }
    
    @available(iOS 15.0, *)
    func testPreferredBehavioralStyle() {
        let result = UISlider().chainable
            .preferredBehavioralStyle(.pad)
            .wrapped.preferredBehavioralStyle == .pad
        XCTAssert(result)
    }
    
}
