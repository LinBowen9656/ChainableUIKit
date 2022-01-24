//
//  UICollectionViewController+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

final class UICollectionViewControllerChainableTests: XCTestCase {
    
    func testIsClearsSelectionOnViewWillAppear() {
        let result = UICollectionViewController().chainable
            .isClearsSelectionOnViewWillAppear(true)
            .wrapped.clearsSelectionOnViewWillAppear
        XCTAssert(result)
    }
    
    func testIsInstallsStandardGestureForInteractiveMovement() {
        let result = UICollectionViewController().chainable
            .isInstallsStandardGestureForInteractiveMovement(true)
            .wrapped.installsStandardGestureForInteractiveMovement
        XCTAssert(result)
    }
    
    func testIsUseLayoutToLayoutNavigationTransitions() {
        let result = UICollectionViewController().chainable
            .isUseLayoutToLayoutNavigationTransitions(true)
            .wrapped.useLayoutToLayoutNavigationTransitions
        XCTAssert(result)
    }
    
}
