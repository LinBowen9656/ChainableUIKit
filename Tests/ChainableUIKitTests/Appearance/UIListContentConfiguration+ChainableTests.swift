//
//  UIListContentConfiguration+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/23.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 14.0, *)
final class UIListContentConfigurationChainableTests: XCTestCase {
    
    func testImage() {
        if #available(iOS 15.0, *) {
            let image = testPNGImage
            let result = UIListContentConfiguration.cell().chainable
                .image(image)
                .wrapped.image == image
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testText() {
        let result = UIListContentConfiguration.cell().chainable
            .text("Test")
            .wrapped.text == "Test"
        XCTAssert(result)
    }
    
    func testAttributedText() {
        let result = UIListContentConfiguration.cell().chainable
            .attributedText(NSAttributedString(string: "Test"))
            .wrapped.attributedText == NSAttributedString(string: "Test")
        XCTAssert(result)
    }
    
    func testSecondaryText() {
        let result = UIListContentConfiguration.cell().chainable
            .secondaryText("Test")
            .wrapped.secondaryText == "Test"
        XCTAssert(result)
    }
    
    func testSecondaryAttributedText() {
        let result = UIListContentConfiguration.cell().chainable
            .secondaryAttributedText(NSAttributedString(string: "Test"))
            .wrapped.secondaryAttributedText == NSAttributedString(string: "Test")
        XCTAssert(result)
    }
    
    func testImageProperties() {
        var properties = UIListContentConfiguration.cell().imageProperties
        properties.cornerRadius = 5
        let result = UIListContentConfiguration.cell().chainable
            .imageProperties(properties)
            .wrapped.imageProperties == properties
        XCTAssert(result)
    }
    
    func testTextProperties() {
        var properties = UIListContentConfiguration.cell().textProperties
        properties.alignment = .center
        let result = UIListContentConfiguration.cell().chainable
            .textProperties(properties)
            .wrapped.textProperties == properties
        XCTAssert(result)
    }
    
    func testSecondaryTextProperties() {
        var properties = UIListContentConfiguration.cell().secondaryTextProperties
        properties.alignment = .center
        let result = UIListContentConfiguration.cell().chainable
            .secondaryTextProperties(properties)
            .wrapped.secondaryTextProperties == properties
        XCTAssert(result)
    }
    
    func testAxesPreservingSuperviewLayoutMargins() {
        let result = UIListContentConfiguration.cell().chainable
            .axesPreservingSuperviewLayoutMargins(.horizontal)
            .wrapped.axesPreservingSuperviewLayoutMargins == .horizontal
        XCTAssert(result)
    }
    
    func testDirectionalLayoutMargins() {
        let result = UIListContentConfiguration.cell().chainable
            .directionalLayoutMargins(NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .wrapped.directionalLayoutMargins == NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        XCTAssert(result)
    }
    
    func testIsPrefersSideBySideTextAndSecondaryText() {
        let result = UIListContentConfiguration.cell().chainable
            .isPrefersSideBySideTextAndSecondaryText(true)
            .wrapped.prefersSideBySideTextAndSecondaryText
        XCTAssert(result)
    }
    
    func testImageToTextPadding() {
        let result = UIListContentConfiguration.cell().chainable
            .imageToTextPadding(5)
            .wrapped.imageToTextPadding == 5
        XCTAssert(result)
    }
    
    func testTextToSecondaryTextHorizontalPadding() {
        let result = UIListContentConfiguration.cell().chainable
            .textToSecondaryTextHorizontalPadding(5)
            .wrapped.textToSecondaryTextHorizontalPadding == 5
        XCTAssert(result)
    }
    
    func testTextToSecondaryTextVerticalPadding() {
        let result = UIListContentConfiguration.cell().chainable
            .textToSecondaryTextVerticalPadding(5)
            .wrapped.textToSecondaryTextVerticalPadding == 5
        XCTAssert(result)
    }
    
}

@available(iOS 14.0, *)
final class UIListContentConfigurationImagePropertiesChainableTests: XCTestCase {
    
    func testPreferredSymbolConfiguration() {
        let configuration = UIImage.SymbolConfiguration(pointSize: 5)
        let result = UIListContentConfiguration.cell().imageProperties.chainable
            .preferredSymbolConfiguration(configuration)
            .wrapped.preferredSymbolConfiguration == configuration
        XCTAssert(result)
    }
    
    func testTintColor() {
        let result = UIListContentConfiguration.cell().imageProperties.chainable
            .tintColor(.red)
            .wrapped.tintColor == .red
        XCTAssert(result)
    }
    
    func testTintColorTransformer() {
        let color = UIConfigurationColorTransformer.grayscale(.red)
        let result = UIListContentConfiguration.cell().imageProperties.chainable
            .tintColorTransformer(.grayscale)
            .wrapped.tintColorTransformer?(.red) == color
        XCTAssert(result)
    }
    
    func testCornerRadius() {
        let result = UIListContentConfiguration.cell().imageProperties.chainable
            .cornerRadius(5)
            .wrapped.cornerRadius == 5
        XCTAssert(result)
    }
    
    func testMaximumSize() {
        let result = UIListContentConfiguration.cell().imageProperties.chainable
            .maximumSize(CGSize(width: 5, height: 5))
            .wrapped.maximumSize == CGSize(width: 5, height: 5)
        XCTAssert(result)
    }
    
    func testReservedLayoutSize() {
        let result = UIListContentConfiguration.cell().imageProperties.chainable
            .reservedLayoutSize(CGSize(width: 5, height: 5))
            .wrapped.reservedLayoutSize == CGSize(width: 5, height: 5)
        XCTAssert(result)
    }
    
    func testIsAccessibilityIgnoresInvertColors() {
        let result = UIListContentConfiguration.cell().imageProperties.chainable
            .isAccessibilityIgnoresInvertColors(true)
            .wrapped.accessibilityIgnoresInvertColors
        XCTAssert(result)
    }
    
}

@available(iOS 14.0, *)
final class UIListContentConfigurationTextPropertiesChainableTests: XCTestCase {
    
    func testFont() {
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .font(.systemFont(ofSize: 55))
            .wrapped.font == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testColor() {
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .color(.red)
            .wrapped.color == .red
        XCTAssert(result)
    }
    
    func testColorTransformer() {
        let color = UIConfigurationColorTransformer.grayscale(.red)
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .colorTransformer(.grayscale)
            .wrapped.colorTransformer?(.red) == color
        XCTAssert(result)
    }
    
    func testAlignment() {
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .alignment(.center)
            .wrapped.alignment == .center
        XCTAssert(result)
    }
    
    func testLineBreakMode() {
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .lineBreakMode(.byTruncatingMiddle)
            .wrapped.lineBreakMode == .byTruncatingMiddle
        XCTAssert(result)
    }
    
    func testNumberOfLines() {
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .numberOfLines(5)
            .wrapped.numberOfLines == 5
        XCTAssert(result)
    }
    
    func testIsAdjustsFontSizeToFitWidth() {
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .isAdjustsFontSizeToFitWidth(true)
            .wrapped.adjustsFontSizeToFitWidth
        XCTAssert(result)
    }
    
    func testMinimumScaleFactor() {
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .minimumScaleFactor(5)
            .wrapped.minimumScaleFactor == 5
        XCTAssert(result)
    }
    
    func testIsAllowsDefaultTighteningForTruncation() {
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .isAllowsDefaultTighteningForTruncation(true)
            .wrapped.allowsDefaultTighteningForTruncation
        XCTAssert(result)
    }
    
    func testIsAdjustsFontForContentSizeCategory() {
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .isAdjustsFontForContentSizeCategory(true)
            .wrapped.adjustsFontForContentSizeCategory
        XCTAssert(result)
    }
    
    func testTransform() {
        let result = UIListContentConfiguration.cell().textProperties.chainable
            .transform(.lowercase)
            .wrapped.transform == .lowercase
        XCTAssert(result)
    }
    
}
