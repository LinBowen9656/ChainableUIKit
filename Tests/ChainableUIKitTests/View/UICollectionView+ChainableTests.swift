//
//  UICollectionView+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/27.
//

import XCTest
@testable import ChainableUIKit

final class UICollectionViewChainableTests: XCTestCase {
    
    func testIsPrefetchingEnabled() {
        let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .isPrefetchingEnabled(true)
            .wrapped.isPrefetchingEnabled
        XCTAssert(result)
    }
    
    func testRegisterCellFromClass() {
        let result = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .registerCell(cellClass: UICollectionViewCell.self, reuseIdentifier: "Test")
            .wrapped.isCallRegisterCellClass
        XCTAssert(result)
    }
    
    func testRegisterCellFromNib() {
        let result = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .registerCell(nib: UINib(data: Data(), bundle: nil), reuseIdentifier: "Test")
            .wrapped.isCallRegisterCellNib
        XCTAssert(result)
    }
    
    func testRegisterSupplementaryViewFromClass() {
        let result = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .registerSupplementaryView(viewClass: UICollectionReusableView.self, kind: "Header", reuseIdentifier: "Test")
            .wrapped.isCallRegisterViewClass
        XCTAssert(result)
    }
    
    func testRegisterSupplementaryViewFromNib() {
        let result = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .registerSupplementaryView(nib: UINib(data: Data(), bundle: nil), kind: "Header", reuseIdentifier: "Test")
            .wrapped.isCallRegisterViewNib
        XCTAssert(result)
    }
    
    func testBackgroundView() {
        let view = UIView()
        let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .backgroundView(view)
            .wrapped.backgroundView == view
        XCTAssert(result)
    }
    
    func testCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .collectionViewLayout(layout, isAnimated: false)
            .wrapped.collectionViewLayout == layout
        XCTAssert(result)
    }
    
    func testUpdate() {
        let reloadResult = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .update(operation: .reload)
            .wrapped.isCallReloadData
        let patchResult = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .update(operation: .diff([.insert([IndexPath(item: 0, section: 0)])]), isAnimated: false)
            .wrapped.isCallReloadData
        XCTAssert(reloadResult && patchResult)
    }
    
    func testReloadEmptyView() {
        var isCompleted = false
        let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .reloadEmptyView { emptyView in
                isCompleted = true
            }
            .wrapped.subviews.first?.tag == .max
        XCTAssert(result && isCompleted)
    }
    
    func testDragInteractionEnabled() {
        let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .dragInteractionEnabled(true)
            .wrapped.dragInteractionEnabled
        XCTAssert(result)
    }
    
    func testReorderingCadence() {
        let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .reorderingCadence(.fast)
            .wrapped.reorderingCadence == .fast
        XCTAssert(result)
    }
    
    func testSelectItem() {
        let result = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .selectItem(indexPath: IndexPath(item: 0, section: 0), isAnimated: false, scrollPosition: .top)
            .wrapped.indexPathsForSelectedItems?.contains(IndexPath(item: 0, section: 0)) == true
        XCTAssert(result)
    }
    
    func testDeselectItem() {
        let result = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .selectItem(indexPath: IndexPath(item: 0, section: 0), isAnimated: false, scrollPosition: .top)
            .deselectItem(indexPath: IndexPath(item: 0, section: 0), isAnimated: false)
            .wrapped.indexPathsForSelectedItems == []
        XCTAssert(result)
    }
    
    func testAllowsSelection() {
        let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .allowsSelection(true)
            .wrapped.allowsSelection
        XCTAssert(result)
    }
    
    func testAllowsMultipleSelection() {
        let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .allowsMultipleSelection(true)
            .wrapped.allowsMultipleSelection
        XCTAssert(result)
    }
    
    func testAllowsSelectionDuringEditing() {
        if #available(iOS 14.0, *) {
            let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
                .allowsSelectionDuringEditing(true)
                .wrapped.allowsSelectionDuringEditing
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testAllowsMultipleSelectionDuringEditing() {
        if #available(iOS 14.0, *) {
            let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
                .allowsMultipleSelectionDuringEditing(true)
                .wrapped.allowsMultipleSelectionDuringEditing
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testRemembersLastFocusedIndexPath() {
        let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .remembersLastFocusedIndexPath(true)
            .wrapped.remembersLastFocusedIndexPath
        XCTAssert(result)
    }
    
    func testSelectionFollowsFocus() {
        if #available(iOS 14.0, *) {
            let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
                .selectionFollowsFocus(true)
                .wrapped.selectionFollowsFocus
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testScrollToItem() {
        let result = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .scrollToItem(IndexPath(item: 0, section: 0), scrollPosition: .top, isAnimated: false)
            .wrapped.isCallScroll
        XCTAssert(result)
    }
    
    func testScrollToLastItem() {
        let result = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
            .scrollToLastItem(isAnimated: false)
            .wrapped.isCallScroll
        XCTAssert(result)
    }
    
    func testReconfigureItems() {
        if #available(iOS 15.0, *) {
            let result = TestCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
                .reconfigureItems(at: [IndexPath(item: 0, section: 0)])
                .wrapped.isCallReconfigure
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testAllowsFocus() {
        if #available(iOS 15.0, *) {
            let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
                .allowsFocus(true)
                .wrapped.allowsFocus
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testAllowsFocusDuringEditing() {
        if #available(iOS 15.0, *) {
            let result = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).chainable
                .allowsFocusDuringEditing(true)
                .wrapped.allowsFocusDuringEditing
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}

extension UICollectionViewChainableTests {
    
    class TestCollectionView: UICollectionView, UICollectionViewDataSource {
        
        var isCallRegisterCellClass = false
        var isCallRegisterCellNib = false
        var isCallRegisterViewClass = false
        var isCallRegisterViewNib = false
        var isCallReloadData = false
        var isCallPerformBatchUpdates = false
        var isCallScroll = false
        var isCallReconfigure = false
        var datas = [1]
        
        override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
            super.init(frame: frame, collectionViewLayout: layout)
            dataSource = self
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) {
            isCallRegisterCellClass = true
            super.register(cellClass, forCellWithReuseIdentifier: identifier)
        }
        
        override func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
            isCallRegisterCellNib = true
        }
        
        override func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String) {
            isCallRegisterViewClass = true
            super.register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
        }
        
        override func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String) {
            isCallRegisterViewNib = true
        }
        
        override func reloadData() {
            isCallReloadData = true
            super.reloadData()
        }
        
        override func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
            isCallPerformBatchUpdates = true
        }
        
        override func scrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) {
            isCallScroll = true
        }
        
        override func reconfigureItems(at indexPaths: [IndexPath]) {
            isCallReconfigure = true
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            datas.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            UICollectionViewCell()
        }
        
    }
    
}
