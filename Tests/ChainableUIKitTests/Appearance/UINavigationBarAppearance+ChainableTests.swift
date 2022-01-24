//
//  UINavigationBarAppearance+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/24.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 13.0, *)
final class UINavigationBarAppearanceChainableTests: XCTestCase {
    
    func testTitleTextAttributes() {
        let attributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 55)]
        let result = UINavigationBarAppearance().chainable
            .titleTextAttributes(attributes)
            .wrapped.titleTextAttributes[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testLargeTitleTextAttributes() {
        let attributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 55)]
        let result = UINavigationBarAppearance().chainable
            .largeTitleTextAttributes(attributes)
            .wrapped.largeTitleTextAttributes[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testTitlePositionAdjustment() {
        let result = UINavigationBarAppearance().chainable
            .titlePositionAdjustment(UIOffset(horizontal: 5, vertical: 5))
            .wrapped.titlePositionAdjustment == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    func testButtonAppearance() {
        let appearance = UIBarButtonItemAppearance(style: .plain)
        let result = UINavigationBarAppearance().chainable
            .buttonAppearance(appearance)
            .wrapped.buttonAppearance == appearance
        XCTAssert(result)
    }
    
    func testBackButtonAppearance() {
        let appearance = UIBarButtonItemAppearance(style: .plain)
        appearance.normal.titlePositionAdjustment = UIOffset(horizontal: 5, vertical: 5)
        let result = UINavigationBarAppearance().chainable
            .backButtonAppearance(appearance)
            .wrapped.backButtonAppearance.normal.titlePositionAdjustment == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    func testBackIndicator() {
        let image = testPNGImage
        let appearance = UINavigationBarAppearance().chainable
            .backIndicator(image: image, transitionMaskImage: image)
            .wrapped
        let result = appearance.backIndicatorImage == image && appearance.backIndicatorTransitionMaskImage == image
        XCTAssert(result)
    }
    
    func testDoneButtonAppearance() {
        let appearance = UIBarButtonItemAppearance(style: .plain)
        let result = UINavigationBarAppearance().chainable
            .doneButtonAppearance(appearance)
            .wrapped.doneButtonAppearance == appearance
        XCTAssert(result)
    }
    
}
