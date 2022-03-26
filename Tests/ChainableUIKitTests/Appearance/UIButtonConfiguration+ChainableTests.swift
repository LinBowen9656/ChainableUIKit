//
//  UIButtonConfiguration+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/23.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 15.0, *)
final class UIButtonConfigurationChainableTests: XCTestCase {
    
    func testTitle() {
        let result = UIButton.Configuration.plain().chainable
            .title("Test")
            .wrapped.title == "Test"
        XCTAssert(result)
    }
    
    func testSubtitle() {
        let result = UIButton.Configuration.plain().chainable
            .subtitle("Test")
            .wrapped.subtitle == "Test"
        XCTAssert(result)
    }
    
    func testAttributedTitle() {
        let result = UIButton.Configuration.plain().chainable
            .attributedTitle(AttributedString("Test"))
            .wrapped.attributedTitle == AttributedString("Test")
        XCTAssert(result)
    }
    
    func testAttributedSubtitle() {
        let result = UIButton.Configuration.plain().chainable
            .attributedSubtitle(AttributedString("Test"))
            .wrapped.attributedSubtitle == AttributedString("Test")
        XCTAssert(result)
    }
    
    func testTitleTextAttributesTransformer() {
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .systemFont(ofSize: 55)
            return outgoing
        }
        let result = UIButton.Configuration.plain().chainable
            .titleTextAttributesTransformer(transformer)
            .wrapped.titleTextAttributesTransformer?(AttributeContainer()).font == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testSubtitleTextAttributesTransformer() {
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .systemFont(ofSize: 55)
            return outgoing
        }
        let result = UIButton.Configuration.plain().chainable
            .subtitleTextAttributesTransformer(transformer)
            .wrapped.subtitleTextAttributesTransformer?(AttributeContainer()).font == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testTitlePadding() {
        let result = UIButton.Configuration.plain().chainable
            .titlePadding(5)
            .wrapped.titlePadding == 5
        XCTAssert(result)
    }
    
    func testTitleAlignment() {
        let result = UIButton.Configuration.plain().chainable
            .titleAlignment(.center)
            .wrapped.titleAlignment == .center
        XCTAssert(result)
    }
    
    func testImage() {
        let image = testPNGImage
        let result = UIButton.Configuration.plain().chainable
            .image(image)
            .wrapped.image == image
        XCTAssert(result)
    }
    
    func testImagePadding() {
        let result = UIButton.Configuration.plain().chainable
            .imagePadding(5)
            .wrapped.imagePadding == 5
        XCTAssert(result)
    }
    
    func testShowsActivityIndicator() {
        let result = UIButton.Configuration.plain().chainable
            .showsActivityIndicator(true)
            .wrapped.showsActivityIndicator
        XCTAssert(result)
    }
    
    func testImagePlacement() {
        let result = UIButton.Configuration.plain().chainable
            .imagePlacement(.leading)
            .wrapped.imagePlacement == .leading
        XCTAssert(result)
    }
    
    func testImageColorTransformer() {
        let color = UIConfigurationColorTransformer.grayscale(.red)
        let result = UIButton.Configuration.plain().chainable
            .imageColorTransformer(.grayscale)
            .wrapped.imageColorTransformer?(.red) == color
        XCTAssert(result)
    }
    
    func testPreferredSymbolConfigurationForImage() {
        let configuration = UIImage.SymbolConfiguration(pointSize: 5)
        let result = UIButton.Configuration.plain().chainable
            .preferredSymbolConfigurationForImage(configuration)
            .wrapped.preferredSymbolConfigurationForImage == configuration
        XCTAssert(result)
    }
    
    func testBaseBackgroundColor() {
        let result = UIButton.Configuration.plain().chainable
            .baseBackgroundColor(.red)
            .wrapped.baseBackgroundColor == .red
        XCTAssert(result)
    }
    
    func testBaseForegroundColor() {
        let result = UIButton.Configuration.plain().chainable
            .baseForegroundColor(.red)
            .wrapped.baseForegroundColor == .red
        XCTAssert(result)
    }
    
    func testBackground() {
        var configuration = UIBackgroundConfiguration.clear()
        configuration.backgroundColor = .red
        let result = UIButton.Configuration.plain().chainable
            .background(configuration)
            .wrapped.background == configuration
        XCTAssert(result)
    }
    
    func testCornerStyle() {
        let result = UIButton.Configuration.plain().chainable
            .cornerStyle(.small)
            .wrapped.cornerStyle == .small
        XCTAssert(result)
    }
    
    func testMacIdiomStyle() {
        let result = UIButton.Configuration.plain().chainable
            .macIdiomStyle(.borderlessTinted)
            .wrapped.macIdiomStyle == .borderlessTinted
        XCTAssert(result)
    }
    
    func testActivityIndicatorColorTransformer() {
        let color = UIConfigurationColorTransformer.grayscale(.red)
        let result = UIButton.Configuration.plain().chainable
            .activityIndicatorColorTransformer(.grayscale)
            .wrapped.activityIndicatorColorTransformer?(.red) == color
        XCTAssert(result)
    }
    
    func testAutomaticallyUpdateForSelection() {
        let result = UIButton.Configuration.plain().chainable
            .automaticallyUpdateForSelection(true)
            .wrapped.automaticallyUpdateForSelection
        XCTAssert(result)
    }
    
    func testSetDefaultContentInsets() {
        var configuration = UIButton.Configuration.plain()
        configuration.setDefaultContentInsets()
        let result = UIButton.Configuration.plain().chainable
            .setDefaultContentInsets()
            .wrapped.contentInsets == configuration.contentInsets
        XCTAssert(result)
    }
    
}
