//
//  UITableView+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/8.
//

import XCTest
@testable import ChainableUIKit

final class UITableViewChainableTests: XCTestCase {
    
    func testRegisterCellFromClass() {
        let result = TestTableView().chainable
            .registerCell(cellClass: UITableViewCell.self, reuseIdentifier: "Test")
            .wrapped.isCallRegisterCellClass
        XCTAssert(result)
    }
    
    func testRegisterCellFromNib() {
        let result = TestTableView().chainable
            .registerCell(nib: UINib(data: Data(), bundle: nil), reuseIdentifier: "Test")
            .wrapped.isCallRegisterCellNib
        XCTAssert(result)
    }
    
    func testRegisterSectionHeaderFooterViewFromClass() {
        let result = TestTableView().chainable
            .registerSectionHeaderFooterView(viewClass: UITableViewHeaderFooterView.self, reuseIdentifier: "Test")
            .wrapped.isCallRegisterViewClass
        XCTAssert(result)
    }
    
    func testRegisterSectionHeaderFooterViewFromNib() {
        let result = TestTableView().chainable
            .registerSectionHeaderFooterView(nib: UINib(data: Data(), bundle: nil), reuseIdentifier: "Test")
            .wrapped.isCallRegisterViewNib
        XCTAssert(result)
    }
    
    func testTableHeaderView() {
        let view = UIView()
        let result = UITableView().chainable
            .tableHeaderView(view)
            .wrapped.tableHeaderView == view
        XCTAssert(result)
    }
    
    func testTableFooterView() {
        let view = UIView()
        let result = UITableView().chainable
            .tableFooterView(view)
            .wrapped.tableFooterView == view
        XCTAssert(result)
    }
    
    func testBackgroundView() {
        let view = UIView()
        let result = UITableView().chainable
            .backgroundView(view)
            .wrapped.backgroundView == view
        XCTAssert(result)
    }
    
    func testRowHeight() {
        let result = UITableView().chainable
            .rowHeight(5)
            .wrapped.rowHeight == 5
        XCTAssert(result)
    }
    
    func testEstimatedRowHeight() {
        let result = UITableView().chainable
            .estimatedRowHeight(5)
            .wrapped.estimatedRowHeight == 5
        XCTAssert(result)
    }
    
    func testCellLayoutMarginsFollowReadableWidth() {
        let result = UITableView().chainable
            .cellLayoutMarginsFollowReadableWidth(true)
            .wrapped.cellLayoutMarginsFollowReadableWidth
        XCTAssert(result)
    }
    
    func testInsetsContentViewsToSafeArea() {
        let result = UITableView().chainable
            .insetsContentViewsToSafeArea(true)
            .wrapped.insetsContentViewsToSafeArea
        XCTAssert(result)
    }
    
    func testSectionHeaderHeight() {
        let result = UITableView().chainable
            .sectionHeaderHeight(5)
            .wrapped.sectionHeaderHeight == 5
        XCTAssert(result)
    }
    
    func testSectionFooterHeight() {
        let result = UITableView().chainable
            .sectionFooterHeight(5)
            .wrapped.sectionFooterHeight == 5
        XCTAssert(result)
    }
    
    func testEstimatedSectionHeaderHeight() {
        let result = UITableView().chainable
            .estimatedSectionHeaderHeight(5)
            .wrapped.estimatedSectionHeaderHeight == 5
        XCTAssert(result)
    }
    
    func testEstimatedSectionFooterHeight() {
        let result = UITableView().chainable
            .estimatedSectionFooterHeight(5)
            .wrapped.estimatedSectionFooterHeight == 5
        XCTAssert(result)
    }
    
    func testSeparatorStyle() {
        let result = UITableView().chainable
            .separatorStyle(.none)
            .wrapped.separatorStyle == .none
        XCTAssert(result)
    }
    
    func testSeparatorColor() {
        let result = UITableView().chainable
            .separatorColor(.red)
            .wrapped.separatorColor == .red
        XCTAssert(result)
    }
    
    func testSeparatorEffect() {
        let effect = UIBlurEffect(style: .dark)
        let result = UITableView().chainable
            .separatorEffect(effect)
            .wrapped.separatorEffect == effect
        XCTAssert(result)
    }
    
    func testSeparatorInset() {
        let result = UITableView().chainable
            .separatorInset(UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
            .wrapped.separatorInset == UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        XCTAssert(result)
    }
    
    func testSeparatorInsetReference() {
        let result = UITableView().chainable
            .separatorInsetReference(.fromCellEdges)
            .wrapped.separatorInsetReference == .fromCellEdges
        XCTAssert(result)
    }
    
    func testSelectRow() {
        let result = TestTableView().chainable
            .selectRow(indexPath: IndexPath(item: 0, section: 0), isAnimated: false, scrollPosition: .top)
            .wrapped.indexPathsForSelectedRows?.contains(IndexPath(item: 0, section: 0)) == true
        XCTAssert(result)
    }
    
    func testDeselectRow() {
        let result = TestTableView().chainable
            .selectRow(indexPath: IndexPath(item: 0, section: 0), isAnimated: false, scrollPosition: .top)
            .deselectRow(indexPath: IndexPath(item: 0, section: 0), isAnimated: false)
            .wrapped.indexPathsForSelectedRows == nil
        XCTAssert(result)
    }
    
    func testAllowsSelection() {
        let result = UITableView().chainable
            .allowsSelection(true)
            .wrapped.allowsSelection
        XCTAssert(result)
    }
    
    func testAllowsMultipleSelection() {
        let result = UITableView().chainable
            .allowsMultipleSelection(true)
            .wrapped.allowsMultipleSelection
        XCTAssert(result)
    }
    
    func testAllowsSelectionDuringEditing() {
        let result = UITableView().chainable
            .allowsSelectionDuringEditing(true)
            .wrapped.allowsSelectionDuringEditing
        XCTAssert(result)
    }
    
    func testAllowsMultipleSelectionDuringEditing() {
        let result = UITableView().chainable
            .allowsMultipleSelectionDuringEditing(true)
            .wrapped.allowsMultipleSelectionDuringEditing
        XCTAssert(result)
    }
    
    func testRemembersLastFocusedIndexPath() {
        let result = UITableView().chainable
            .remembersLastFocusedIndexPath(true)
            .wrapped.remembersLastFocusedIndexPath
        XCTAssert(result)
    }
    
    func testSelectionFollowsFocus() {
        if #available(iOS 14.0, *) {
            let result = UITableView().chainable
                .selectionFollowsFocus(true)
                .wrapped.selectionFollowsFocus
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testUpdate() {
        let reloadResult = TestTableView().chainable
            .update(operation: .reload)
            .wrapped.isCallReloadData
        let patchResult = TestTableView().chainable
            .update(operation: .diff([.insert([IndexPath(item: 0, section: 0)])]), isAnimated: false)
            .wrapped.isCallReloadData
        XCTAssert(reloadResult && patchResult)
    }
    
    func testReloadEmptyView() {
        var isCompleted = false
        let result = UITableView().chainable
            .reloadEmptyView { emptyView in
                isCompleted = true
            }
            .wrapped.subviews.first?.tag == .max
        XCTAssert(result && isCompleted)
    }
    
    func testSectionIndexMinimumDisplayRowCount() {
        let result = UITableView().chainable
            .sectionIndexMinimumDisplayRowCount(5)
            .wrapped.sectionIndexMinimumDisplayRowCount == 5
        XCTAssert(result)
    }
    
    func testSectionIndexColor() {
        let result = UITableView().chainable
            .sectionIndexColor(.red)
            .wrapped.sectionIndexColor == .red
        XCTAssert(result)
    }
    
    func testSectionIndexBackgroundColor() {
        let result = UITableView().chainable
            .sectionIndexBackgroundColor(.red)
            .wrapped.sectionIndexBackgroundColor == .red
        XCTAssert(result)
    }
    
    func testSectionIndexTrackingBackgroundColor() {
        let result = UITableView().chainable
            .sectionIndexTrackingBackgroundColor(.red)
            .wrapped.sectionIndexTrackingBackgroundColor == .red
        XCTAssert(result)
    }
    
    func testDragInteractionEnabled() {
        let result = UITableView().chainable
            .dragInteractionEnabled(true)
            .wrapped.dragInteractionEnabled
        XCTAssert(result)
    }
    
    func testScrollToRow() {
        let result = TestTableView().chainable
            .scrollToRow(IndexPath(item: 0, section: 0), scrollPosition: .top, isAnimated: false)
            .wrapped.isCallScroll
        XCTAssert(result)
    }
    
    func testScrollToNearestSelectedRow() {
        let result = TestTableView().chainable
            .scrollToNearestSelectedRow(scrollPosition: .top, isAnimated: false)
            .wrapped.isCallScroll
        XCTAssert(result)
    }
    
    func testScrollToLastRow() {
        let result = TestTableView().chainable
            .scrollToLastRow(isAnimated: false)
            .wrapped.isCallScroll
        XCTAssert(result)
    }
    
    func testIsEditing() {
        let result = UITableView().chainable
            .isEditing(true, isAnimated: false)
            .wrapped.isEditing
        XCTAssert(result)
    }
    
    func testSectionHeaderTopPadding() {
        if #available(iOS 15.0, *) {
            let result = UITableView().chainable
                .sectionHeaderTopPadding(5)
                .wrapped.sectionHeaderTopPadding == 5
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testReconfigureRows() {
        if #available(iOS 15.0, *) {
            let result = TestTableView().chainable
                .reconfigureRows(at: [IndexPath(row: 0, section: 0)])
                .wrapped.isCallReconfigure
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testAllowsFocus() {
        if #available(iOS 15.0, *) {
            let result = UITableView().chainable
                .allowsFocus(true)
                .wrapped.allowsFocus
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testAllowsFocusDuringEditing() {
        if #available(iOS 15.0, *) {
            let result = UITableView().chainable
                .allowsFocusDuringEditing(true)
                .wrapped.allowsFocusDuringEditing
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testFillerRowHeight() {
        if #available(iOS 15.0, *) {
            let result = UITableView().chainable
                .fillerRowHeight(5)
                .wrapped.fillerRowHeight == 5
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testIsPrefetchingEnabled(_ value: Bool) {
        if #available(iOS 15.0, *) {
            let result = UITableView().chainable
                .isPrefetchingEnabled(true)
                .wrapped.isPrefetchingEnabled
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}


extension UITableViewChainableTests {
    
    class TestTableView: UITableView, UITableViewDataSource {
        
        var isCallRegisterCellClass = false
        var isCallRegisterCellNib = false
        var isCallRegisterViewClass = false
        var isCallRegisterViewNib = false
        var isCallReloadData = false
        var isCallPerformBatchUpdates = false
        var isCallScroll = false
        var isCallReconfigure = false
        var datas = [1]
        
        override init(frame: CGRect, style: UITableView.Style) {
            super.init(frame: frame, style: style)
            dataSource = self
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
            isCallRegisterCellClass = true
            super.register(cellClass, forCellReuseIdentifier: identifier)
        }
        
        override func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
            isCallRegisterCellNib = true
        }
        
        override func register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) {
            isCallRegisterViewClass = true
            super.register(aClass, forHeaderFooterViewReuseIdentifier: identifier)
        }
        
        override func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) {
            isCallRegisterViewNib = true
        }
        
        override func reloadData() {
            isCallReloadData = true
            super.reloadData()
        }
        
        override func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
            isCallPerformBatchUpdates = true
        }
        
        override func scrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
            isCallScroll = true
        }
        
        override func scrollToNearestSelectedRow(at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
            isCallScroll = true
        }
        
        override func reconfigureRows(at indexPaths: [IndexPath]) {
            isCallReconfigure = true
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            datas.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            UITableViewCell()
        }
        
    }
    
}
