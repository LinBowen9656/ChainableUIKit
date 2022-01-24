//
//  UILabel+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/2.
//

import XCTest
@testable import ChainableUIKit

final class UILabelChainableTests: XCTestCase {
    
    func testText() {
        let result = UILabel().chainable
            .text("Test")
            .wrapped.text == "Test"
        XCTAssert(result)
    }
    
    func testAttributedText() {
        let result = UILabel().chainable
            .attributedText(NSAttributedString(string: "Test"))
            .wrapped.attributedText == NSAttributedString(string: "Test")
        XCTAssert(result)
    }
    
    func testFont() {
        let result = UILabel().chainable
            .font(.systemFont(ofSize: 55))
            .wrapped.font == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testTextColor() {
        let result = UILabel().chainable
            .textColor(.red)
            .wrapped.textColor == .red
        XCTAssert(result)
    }
    
    func testTextAlignment() {
        let result = UILabel().chainable
            .textAlignment(.center)
            .wrapped.textAlignment == .center
        XCTAssert(result)
    }
    
    func testLineBreakMode() {
        let result = UILabel().chainable
            .lineBreakMode(.byClipping)
            .wrapped.lineBreakMode == .byClipping
        XCTAssert(result)
    }
    
    func testIsEnabled() {
        let result = UILabel().chainable
            .isEnabled(true)
            .wrapped.isEnabled
        XCTAssert(result)
    }
    
    #if os(tvOS)
    func testIsEnablesMarqueeWhenAncestorFocused() {
        if #available(tvOS 12.0, *) {
            let result = UILabel().chainable
                .isEnablesMarqueeWhenAncestorFocused(true)
                .wrapped.enablesMarqueeWhenAncestorFocused
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    #endif
    
    func testIsAdjustsFontSizeToFitWidth() {
        let result = UILabel().chainable
            .isAdjustsFontSizeToFitWidth(true)
            .wrapped.adjustsFontSizeToFitWidth
        XCTAssert(result)
    }
    
    func testIsAllowsDefaultTighteningForTruncation() {
        let result = UILabel().chainable
            .isAllowsDefaultTighteningForTruncation(true)
            .wrapped.allowsDefaultTighteningForTruncation
        XCTAssert(result)
    }
    
    func testBaselineAdjustment() {
        let result = UILabel().chainable
            .baselineAdjustment(.alignCenters)
            .wrapped.baselineAdjustment == .alignCenters
        XCTAssert(result)
    }
    
    func testMinimumScaleFactor() {
        let result = UILabel().chainable
            .minimumScaleFactor(0.5)
            .wrapped.minimumScaleFactor == 0.5
        XCTAssert(result)
    }
    
    func testNumberOfLines() {
        let result = UILabel().chainable
            .numberOfLines(5)
            .wrapped.numberOfLines == 5
        XCTAssert(result)
    }
    
    func testHighlightedTextColor() {
        let result = UILabel().chainable
            .highlightedTextColor(.red)
            .wrapped.highlightedTextColor == .red
        XCTAssert(result)
    }
    
    func testIsHighlighted() {
        let result = UILabel().chainable
            .isHighlighted(true)
            .wrapped.isHighlighted
        XCTAssert(result)
    }
    
    func testShadowColor() {
        let result = UILabel().chainable
            .shadowColor(textShadowColor: .red)
            .wrapped.shadowColor == .red
        XCTAssert(result)
    }
    
    func testTextShadowOffset() {
        let result = UILabel().chainable
            .textShadowOffset(CGSize(width: 5, height: 5))
            .wrapped.shadowOffset == CGSize(width: 5, height: 5)
        XCTAssert(result)
    }
    
    func testPreferredMaxLayoutWidth() {
        let result = UILabel().chainable
            .preferredMaxLayoutWidth(5)
            .wrapped.preferredMaxLayoutWidth == 5
        XCTAssert(result)
    }
    
    func testIsShowsExpansionTextWhenTruncated() {
        if #available(iOS 15.0, *) {
            let result = UILabel().chainable
                .isShowsExpansionTextWhenTruncated(true)
                .wrapped.showsExpansionTextWhenTruncated
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}
