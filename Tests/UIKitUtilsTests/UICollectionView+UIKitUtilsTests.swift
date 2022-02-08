//
//  UICollectionView+UIKitUtilsTests.swift
//  
//
//  Created by 林博文 on 2022/2/8.
//

import XCTest
@testable import UIKitUtils

class UICollectionViewUIKitUtilsTests: XCTestCase {
    
    func testCacheSize() {
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 55, height: 55), collectionViewLayout: UICollectionViewFlowLayout())
        let noCacheResult = collectionView.getCollectionViewCacheSize(id: 0) == nil
        collectionView.cacheCollectionViewCellSize(size: CGSize(width: 55, height: 55), id: 0)
        let cacheResult = collectionView.getCollectionViewCacheSize(id: 0) == CGSize(width: 55, height: 55)
        collectionView.invalidateSizeCache(ids: [0])
        let invalidateSizeResult = collectionView.getCollectionViewCacheSize(id: 0) == nil
        collectionView.cacheCollectionViewCellSize(size: CGSize(width: 55, height: 55), id: 0)
        collectionView.invalidateAllSizeCache()
        let invalidateAllSizeResult = collectionView.getCollectionViewCacheSize(id: 0) == nil
        XCTAssert(noCacheResult && cacheResult && invalidateSizeResult && invalidateAllSizeResult)
    }
    
    func testFlexWidth() {
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 500, height: 500), collectionViewLayout: UICollectionViewFlowLayout())
        let result = collectionView.flexibleItemFillWidth(minWidth: 200, inset: 32, minSpacing: 10) == 229
        XCTAssert(result)
    }
    
}
