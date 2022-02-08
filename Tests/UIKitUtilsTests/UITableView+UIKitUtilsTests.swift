//
//  UITableView+UIKitUtilsTests.swift
//  
//
//  Created by 林博文 on 2022/2/7.
//

import XCTest
@testable import UIKitUtils

class UITableView_UIKitUtilsTests: XCTestCase {
    
    func testCacheHeight() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 55, height: 55), style: .plain)
        let noCacheResult = tableView.getTableViewCacheHeight(id: 0) == UITableView.automaticDimension
        let cell = UITableViewCell()
        cell.frame.size.height = 55
        tableView.cacheTableViewCellHeight(cell: cell, id: 0)
        let cacheResult = tableView.getTableViewCacheHeight(id: 0) == 55
        tableView.invalidateHeightCache(ids: [0])
        let invalidateHeightResult = tableView.getTableViewCacheHeight(id: 0) == UITableView.automaticDimension
        tableView.cacheTableViewCellHeight(cell: cell, id: 0)
        tableView.invalidateAllHeightCache()
        let invalidateAllHeightResult = tableView.getTableViewCacheHeight(id: 0) == UITableView.automaticDimension
        XCTAssert(noCacheResult && cacheResult && invalidateHeightResult && invalidateAllHeightResult)
    }
    
}
