//
//  UIContextualAction+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/23.
//

import XCTest
@testable import ChainableUIKit

final class UIContextualActionChainableTests: XCTestCase {
    
    func testExample() {
        let image = testPNGImage
        let action = UIContextualAction(style: .normal, title: "") { _, _, _ in }.chainable
            .title("Test")
            .backgroundColor(.red)
            .image(image)
            .wrapped
        XCTAssert(action.title == "Test" && action.backgroundColor == .red && action.image == image)
    }
    
}
