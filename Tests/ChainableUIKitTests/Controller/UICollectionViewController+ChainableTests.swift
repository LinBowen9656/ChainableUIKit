//
//  UICollectionViewController+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

final class UICollectionViewControllerChainableTests: XCTestCase {
    
    func testClearsSelectionOnViewWillAppear() {
        let result = UICollectionViewController().chainable
            .clearsSelectionOnViewWillAppear(true)
            .wrapped.clearsSelectionOnViewWillAppear
        XCTAssert(result)
    }
    
    func testInstallsStandardGestureForInteractiveMovement() {
        let result = UICollectionViewController().chainable
            .installsStandardGestureForInteractiveMovement(true)
            .wrapped.installsStandardGestureForInteractiveMovement
        XCTAssert(result)
    }
    
    func testUseLayoutToLayoutNavigationTransitions() {
        let result = UICollectionViewController().chainable
            .useLayoutToLayoutNavigationTransitions(true)
            .wrapped.useLayoutToLayoutNavigationTransitions
        XCTAssert(result)
    }
    
}
