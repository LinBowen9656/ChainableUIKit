//
//  UIBarButtonItemAppearance+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/23.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 13.0, *)
final class UIBarButtonItemAppearanceChainableTests: XCTestCase {
    
    func testDefaultStyle() {
        let appearance = UIBarButtonItemAppearance()
        let result = appearance.chainable
            .defaultStyle(.plain)
            .wrapped == UIBarButtonItemAppearance(style: .plain)
        XCTAssert(result)
    }
    
}
