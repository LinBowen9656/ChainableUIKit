//
//  UIButton+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/26.
//

import XCTest
@testable import ChainableUIKit

final class UIButtonChainableTests: XCTestCase {
    
    func testImage() {
        let image = testPNGImage
        let result = UIButton(type: .custom).chainable
            .image(image, state: .normal)
            .wrapped.image(for: .normal) == image
        XCTAssert(result)
    }
    
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UIButton(type: .custom).chainable
            .backgroundImage(image, state: .normal)
            .wrapped.backgroundImage(for: .normal) == image
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testPreferredSymbolConfiguration() {
        let configuration = UIImage.SymbolConfiguration(pointSize: 5)
        let result = UIButton(type: .custom).chainable
            .preferredSymbolConfiguration(configuration, state: .normal)
            .wrapped.preferredSymbolConfigurationForImage(in: .normal) == configuration
        XCTAssert(result)
    }
    
    func testTitle() {
        let result = UIButton(type: .custom).chainable
            .title("Test", state: .normal)
            .wrapped.title(for: .normal) == "Test"
        XCTAssert(result)
    }
    
    func testAttributedTitle() {
        let result = UIButton(type: .custom).chainable
            .attributedTitle(NSAttributedString(string: "Test"), state: .normal)
            .wrapped.attributedTitle(for: .normal) == NSAttributedString(string: "Test")
        XCTAssert(result)
    }
    
    func testTitleColor() {
        let result = UIButton(type: .custom).chainable
            .titleColor(.red, state: .normal)
            .wrapped.titleColor(for: .normal) == .red
        XCTAssert(result)
    }
    
    func testTitleShadowColor() {
        let result = UIButton(type: .custom).chainable
            .titleShadowColor(.red, state: .normal)
            .wrapped.titleShadowColor(for: .normal) == .red
        XCTAssert(result)
    }
    
    func testIsReversesTitleShadowWhenHighlighted() {
        let result = UIButton(type: .custom).chainable
            .isReversesTitleShadowWhenHighlighted(true)
            .wrapped.reversesTitleShadowWhenHighlighted
        XCTAssert(result)
    }
    
    func testIsAdjustsImageWhenDisabled() {
        let result = UIButton(type: .custom).chainable
            .isAdjustsImageWhenDisabled(true)
            .wrapped.adjustsImageWhenDisabled
        XCTAssert(result)
    }
    
    func testIsShowsTouchWhenHighlighted() {
        let result = UIButton(type: .custom).chainable
            .isShowsTouchWhenHighlighted(true)
            .wrapped.showsTouchWhenHighlighted
        XCTAssert(result)
    }
    
    func testContentEdgeInsets() {
        let result = UIButton(type: .custom).chainable
            .contentEdgeInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .wrapped.contentEdgeInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        XCTAssert(result)
    }
    
    func testTitleEdgeInsets() {
        let result = UIButton(type: .custom).chainable
            .titleEdgeInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .wrapped.titleEdgeInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        XCTAssert(result)
    }
    
    func testImageEdgeInsets() {
        let result = UIButton(type: .custom).chainable
            .imageEdgeInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .wrapped.imageEdgeInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        XCTAssert(result)
    }
    
    func testIsPointerInteractionEnabled() {
        if #available(iOS 13.4, *) {
            let result = UIButton(type: .custom).chainable
                .isPointerInteractionEnabled(true)
                .wrapped.isPointerInteractionEnabled
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    @available(iOS 13.4, *)
    func testPointerStyleProvider() {
        let provider: UIButton.PointerStyleProvider = { button, proposedEffect, proposedShape in
            UIPointerStyle.hidden()
        }
        let result = UIButton(type: .custom).chainable
            .pointerStyleProvider(provider)
            .wrapped.pointerStyleProvider != nil
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testRole() {
        let result = UIButton(type: .custom).chainable
            .role(.normal)
            .wrapped.role == .normal
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testMenu() {
        let menu = UIMenu(title: "Test")
        let result = UIButton(type: .custom).chainable
            .menu(menu)
            .wrapped.menu == menu
        XCTAssert(result)
    }
    
    @available(iOS 15.0, *)
    func testConfiguration() {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .red
        let result = UIButton(type: .custom).chainable
            .configuration(configuration)
            .wrapped.configuration?.baseBackgroundColor == .red
        XCTAssert(result)
    }
    
    func testAutomaticallyUpdatesConfiguration() {
        if #available(iOS 15.0, *) {
            let result = UIButton(type: .custom).chainable
                .automaticallyUpdatesConfiguration(true)
                .wrapped.automaticallyUpdatesConfiguration
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testUpdateConfiguration() {
        if #available(iOS 15.0, *) {
            let result = TestButton(type: .custom).chainable
                .updateConfiguration()
                .wrapped.isCallSetNeedsUpdateConfiguration
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testConfigurationUpdateHandler() {
        if #available(iOS 15.0, *) {
            var result = false
            let handler: (UIButton) -> Void = { _ in result = true }
            UIButton(type: .custom).chainable
                .configurationUpdateHandler(handler)
                .wrapped.configurationUpdateHandler?(UIButton())
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    @available(iOS 15.0, *)
    func testPreferredBehavioralStyle() {
        let result = UIButton(type: .custom).chainable
            .preferredBehavioralStyle(.pad)
            .wrapped.preferredBehavioralStyle == .pad
        XCTAssert(result)
    }
    
    func testIsChangesSelectionAsPrimaryAction() {
        if #available(iOS 15.0, *) {
            let result = UIButton(type: .custom).chainable
                .isChangesSelectionAsPrimaryAction(true)
                .wrapped.changesSelectionAsPrimaryAction
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}

extension UIButtonChainableTests {
    
    class TestButton: UIButton {
        
        var isCallSetNeedsUpdateConfiguration = false
        
        @available(iOS 15.0, *)
        override func setNeedsUpdateConfiguration() {
            isCallSetNeedsUpdateConfiguration = true
            super.setNeedsUpdateConfiguration()
        }
        
    }
    
}
