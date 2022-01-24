//
//  UISegmentedControl+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/8.
//

import XCTest
@testable import ChainableUIKit

final class UISegmentedControlChainableTests: XCTestCase {
    
    func testImage() {
        let image = testPNGImage
        let result = UISegmentedControl().chainable
            .insertSegment(image: nil, index: 0, isAnimated: false)
            .image(image, index: 0)
            .wrapped.imageForSegment(at: 0) == image
        XCTAssert(result)
    }
    
    func testTitle() {
        let result = UISegmentedControl().chainable
            .insertSegment(title: "", index: 0, isAnimated: false)
            .title("Test", index: 0)
            .wrapped.titleForSegment(at: 0) == "Test"
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testInsertSegment() {
        let action = UIAction { _ in }
        let result = UISegmentedControl().chainable
            .insertSegment(action: action, index: 0, isAnimated: false)
            .wrapped.actionForSegment(at: 0) == action
        XCTAssert(result)
    }
    
    func testRemoveAllSegments() {
        let result = UISegmentedControl().chainable
            .insertSegment(title: "Test", index: 0, isAnimated: false)
            .removeAllSegments()
            .wrapped.numberOfSegments == 0
        XCTAssert(result)
    }
    
    func testRemoveSegment() {
        let result = UISegmentedControl().chainable
            .insertSegment(title: "Test", index: 0, isAnimated: false)
            .removeSegment(0, isAnimated: false)
            .wrapped.numberOfSegments == 0
        XCTAssert(result)
    }
    
    func testSelectedSegmentIndex() {
        let result = UISegmentedControl().chainable
            .insertSegment(title: "Test", index: 0, isAnimated: false)
            .selectedSegmentIndex(0)
            .wrapped.selectedSegmentIndex == 0
        XCTAssert(result)
    }
    
    func testIsMomentary() {
        let result = UISegmentedControl().chainable
            .isMomentary(true)
            .wrapped.isMomentary
        XCTAssert(result)
    }
    
    func testIsEnabled() {
        let result = UISegmentedControl().chainable
            .insertSegment(title: "Test", index: 0, isAnimated: false)
            .isEnabled(true, index: 0)
            .wrapped.isEnabledForSegment(at: 0)
        XCTAssert(result)
    }
    
    func testContentOffset() {
        let result = UISegmentedControl().chainable
            .insertSegment(title: "Test", index: 0, isAnimated: false)
            .contentOffset(CGSize(width: 5, height: 5), index: 0)
            .wrapped.contentOffsetForSegment(at: 0) == CGSize(width: 5, height: 5)
        XCTAssert(result)
    }
    
    func testWidth() {
        let result = UISegmentedControl().chainable
            .insertSegment(title: "Test", index: 0, isAnimated: false)
            .width(55, index: 0)
            .wrapped.widthForSegment(at: 0) == 55
        XCTAssert(result)
    }
    
    func testIsApportionsSegmentWidthsByContent() {
        let result = UISegmentedControl().chainable
            .isApportionsSegmentWidthsByContent(true)
            .wrapped.apportionsSegmentWidthsByContent
        XCTAssert(result)
    }
    
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UISegmentedControl().chainable
            .backgroundImage(image, state: .normal, barMetrics: .default)
            .wrapped.backgroundImage(for: .normal, barMetrics: .default) == image
        XCTAssert(result)
    }
    
    func testContentPositionAdjustment() {
        let result = UISegmentedControl().chainable
            .contentPositionAdjustment(UIOffset(horizontal: 5, vertical: 5), segmentType: .center, barMetrics: .default)
            .wrapped.contentPositionAdjustment(forSegmentType: .center, barMetrics: .default) == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    func testDividerImage() {
        let image = testPNGImage
        let result = UISegmentedControl().chainable
            .dividerImage(image, leftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            .wrapped.dividerImage(forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default) == image
        XCTAssert(result)
    }
    
    func testTitleTextAttributes() {
        let result = UISegmentedControl().chainable
            .titleTextAttributes([.font: UIFont.systemFont(ofSize: 55)], state: .normal)
            .wrapped.titleTextAttributes(for: .normal)?[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testAction() {
        let action = UIAction { _ in }
        let result = UISegmentedControl().chainable
            .insertSegment(action: UIAction { _ in }, index: 0, isAnimated: false)
            .action(action, index: 0)
            .wrapped.actionForSegment(at: 0) == action
        XCTAssert(result)
    }
    
}
