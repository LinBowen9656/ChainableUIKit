//
//  UISwipeActionsConfiguration+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/24.
//

import XCTest
@testable import ChainableUIKit

final class UISwipeActionsConfigurationChainableTests: XCTestCase {
    
    func testPerformsFirstActionWithFullSwipe() {
        let result = UISwipeActionsConfiguration(actions: []).chainable
            .performsFirstActionWithFullSwipe(true)
            .wrapped.performsFirstActionWithFullSwipe
        XCTAssert(result)
    }
    
}
