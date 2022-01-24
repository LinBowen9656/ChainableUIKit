//
//  UIToolbarAppearance+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 13.0, *)
final class UIToolbarAppearanceChainableTests: XCTestCase {
    
    func testButtonAppearance() {
        let appearance = UIBarButtonItemAppearance(style: .plain)
        let result = UIToolbarAppearance().chainable
            .buttonAppearance(appearance)
            .wrapped.buttonAppearance == appearance
        XCTAssert(result)
    }
    
    func testDoneButtonAppearance() {
        let appearance = UIBarButtonItemAppearance(style: .plain)
        let result = UIToolbarAppearance().chainable
            .doneButtonAppearance(appearance)
            .wrapped.doneButtonAppearance == appearance
        XCTAssert(result)
    }
    
}
