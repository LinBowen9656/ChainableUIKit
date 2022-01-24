//
//  UIStackView+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/8.
//

import XCTest
@testable import ChainableUIKit

final class UIStackViewChainableTests: XCTestCase {
    
    func testAddArrangedSubview() {
        let view = UIView()
        let result = UIStackView().chainable
            .addArrangedSubview(view)
            .wrapped.arrangedSubviews.first == view
        XCTAssert(result)
    }
    
    func testInsertArrangedSubview() {
        let view = UIView()
        let result = UIStackView().chainable
            .insertArrangedSubview(view, atIndex: 0)
            .wrapped.arrangedSubviews.first == view
        XCTAssert(result)
    }
    
    func testRemoveArrangedSubview() {
        let view = UIView()
        let result = UIStackView(arrangedSubviews: [view]).chainable
            .removeArrangedSubview(view)
            .wrapped.arrangedSubviews.isEmpty
        XCTAssert(result)
    }
    
    func testExchangeArrangedSubview() {
        let view1 = UIView()
        let view2 = UIView()
        let result = UIStackView(arrangedSubviews: [view2, view1]).chainable
            .exchangeArrangedSubview(0, atIndex: 1)
            .wrapped.arrangedSubviews.first == view1
        XCTAssert(result)
    }
    
    func testAlignment() {
        let result = UIStackView().chainable
            .alignment(.center)
            .wrapped.alignment == .center
        XCTAssert(result)
    }
    
    func testAxis() {
        let result = UIStackView().chainable
            .axis(.horizontal)
            .wrapped.axis == .horizontal
        XCTAssert(result)
    }
    
    func testIsBaselineRelativeArrangement() {
        let result = UIStackView().chainable
            .isBaselineRelativeArrangement(true)
            .wrapped.isBaselineRelativeArrangement
        XCTAssert(result)
    }
    
    func testIsLayoutMarginsRelativeArrangement() {
        let result = UIStackView().chainable
            .isLayoutMarginsRelativeArrangement(true)
            .wrapped.isLayoutMarginsRelativeArrangement
        XCTAssert(result)
    }
    
    func testDistribution() {
        let result = UIStackView().chainable
            .distribution(.equalCentering)
            .wrapped.distribution == .equalCentering
        XCTAssert(result)
    }
    
    func testSpacing() {
        let result = UIStackView().chainable
            .spacing(5)
            .wrapped.spacing == 5
        XCTAssert(result)
    }
    
    func testCustomSpacing() {
        let view = UIView()
        let result = UIStackView(arrangedSubviews: [view]).chainable
            .customSpacing(5, afterView: view)
            .wrapped.customSpacing(after: view) == 5
        XCTAssert(result)
    }
    
}
