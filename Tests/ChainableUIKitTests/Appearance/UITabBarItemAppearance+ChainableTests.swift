//
//  UITabBarItemAppearance+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/24.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 13.0, *)
final class UITabBarItemAppearanceChainableTests: XCTestCase {
    
    func testDefaultStyle() {
        let appearance = UITabBarItemAppearance()
        let result = appearance.chainable
            .defaultStyle(.stacked)
            .wrapped == UITabBarItemAppearance(style: .stacked)
        XCTAssert(result)
    }
    
}
