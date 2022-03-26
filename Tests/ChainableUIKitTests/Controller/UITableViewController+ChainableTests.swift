//
//  UITableViewController+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

final class UITableViewControllerChainableTests: XCTestCase {
    
    func testClearsSelectionOnViewWillAppear() {
        let result = UITableViewController().chainable
            .clearsSelectionOnViewWillAppear(true)
            .wrapped.clearsSelectionOnViewWillAppear
        XCTAssert(result)
    }
    
    func testRefreshControl() {
        let refreshControl = UIRefreshControl()
        let result = UITableViewController().chainable
            .refreshControl(refreshControl)
            .wrapped.refreshControl == refreshControl
        XCTAssert(result)
    }
    
}
