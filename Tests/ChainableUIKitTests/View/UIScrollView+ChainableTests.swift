//
//  UIScrollView+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/3.
//

import XCTest
@testable import ChainableUIKit

final class UIScrollViewChainableTests: XCTestCase {
    
    func testIsScrollEnabled() {
        let result = UIScrollView().chainable
            .isScrollEnabled(true)
            .wrapped.isScrollEnabled
        XCTAssert(result)
    }
    
    func testIsDirectionalLockEnabled() {
        let result = UIScrollView().chainable
            .isDirectionalLockEnabled(true)
            .wrapped.isDirectionalLockEnabled
        XCTAssert(result)
    }
    
    func testContentOffset() {
        let result = UIScrollView().chainable
            .contentSize(CGSize(width: 500, height: 500))
            .contentOffset(CGPoint(x: 5, y: 5), isAnimated: false)
            .wrapped.contentOffset == CGPoint(x: 5, y: 5)
        XCTAssert(result)
    }
    
    func testContentSize() {
        let result = UIScrollView().chainable
            .contentSize(CGSize(width: 500, height: 500))
            .wrapped.contentSize == CGSize(width: 500, height: 500)
        XCTAssert(result)
    }
    
    func testContentInset() {
        let result = UIScrollView().chainable
            .contentInset(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .wrapped.contentInset == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        XCTAssert(result)
    }
    
    func testContentInsetAdjustmentBehavior() {
        let result = UIScrollView().chainable
            .contentInsetAdjustmentBehavior(.always)
            .wrapped.contentInsetAdjustmentBehavior == .always
        XCTAssert(result)
    }
    
    func testIsPagingEnabled() {
        let result = UIScrollView().chainable
            .isPagingEnabled(true)
            .wrapped.isPagingEnabled
        XCTAssert(result)
    }
    
    func testIsCanScrollsToTop() {
        let result = UIScrollView().chainable
            .isCanScrollsToTop(true)
            .wrapped.scrollsToTop
        XCTAssert(result)
    }
    
    func testIsBounces() {
        let result = UIScrollView().chainable
            .isBounces(true)
            .wrapped.bounces
        XCTAssert(result)
    }
    
    func testIsAlwaysBounceVertical() {
        let result = UIScrollView().chainable
            .isAlwaysBounceVertical(true)
            .wrapped.alwaysBounceVertical
        XCTAssert(result)
    }
    
    func testIsAlwaysBounceHorizontal() {
        let result = UIScrollView().chainable
            .isAlwaysBounceHorizontal(true)
            .wrapped.alwaysBounceHorizontal
        XCTAssert(result)
    }
    
    func testDecelerationRate() {
        let result = UIScrollView().chainable
            .decelerationRate(.fast)
            .wrapped.decelerationRate == .fast
        XCTAssert(result)
    }
    
    func testIndicatorStyle() {
        let result = UIScrollView().chainable
            .indicatorStyle(.black)
            .wrapped.indicatorStyle == .black
        XCTAssert(result)
    }
    
    func testIsShowsHorizontalScrollIndicator() {
        let result = UIScrollView().chainable
            .isShowsHorizontalScrollIndicator(true)
            .wrapped.showsHorizontalScrollIndicator
        XCTAssert(result)
    }
    
    func testIsShowsVerticalScrollIndicator() {
        let result = UIScrollView().chainable
            .isShowsVerticalScrollIndicator(true)
            .wrapped.showsVerticalScrollIndicator
        XCTAssert(result)
    }
    
    func testRefreshControl() {
        let refreshControl = UIRefreshControl()
        let result = UIScrollView().chainable
            .refreshControl(refreshControl)
            .wrapped.refreshControl == refreshControl
        XCTAssert(result)
    }
    
    func testVisibleRect() {
        let result = TestScrollView().chainable
            .visibleRect(.zero, isAnimated: false)
            .wrapped.isCallScrollRectToVisible
        XCTAssert(result)
    }
    
    func testZoomScale() {
        let result = TestScrollView().chainable
            .zoomScale(0.5, isAnimated: false)
            .wrapped.isCallZoomScale
        XCTAssert(result)
    }
    
    func testIsBouncesZoom() {
        let result = UIScrollView().chainable
            .isBouncesZoom(true)
            .wrapped.bouncesZoom
        XCTAssert(result)
    }
    
    func testMaximumZoomScale() {
        let result = UIScrollView().chainable
            .maximumZoomScale(5)
            .wrapped.maximumZoomScale == 5
        XCTAssert(result)
    }
    
    func testMinimumZoomScale() {
        let result = UIScrollView().chainable
            .minimumZoomScale(5)
            .wrapped.minimumZoomScale == 5
        XCTAssert(result)
    }
    
    func testKeyboardDismissMode() {
        let result = UIScrollView().chainable
            .keyboardDismissMode(.interactive)
            .wrapped.keyboardDismissMode == .interactive
        XCTAssert(result)
    }
    
    func testIndexDisplayMode() {
        let result = UIScrollView().chainable
            .indexDisplayMode(.alwaysHidden)
            .wrapped.indexDisplayMode == .alwaysHidden
        XCTAssert(result)
    }
    
    func testIsAutomaticallyAdjustsScrollIndicatorInsets() {
        if #available(iOS 13.0, *) {
            let result = UIScrollView().chainable
                .isAutomaticallyAdjustsScrollIndicatorInsets(true)
                .wrapped.automaticallyAdjustsScrollIndicatorInsets
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testHorizontalScrollIndicatorInsets() {
        if #available(iOS 11.1, *) {
            let result = UIScrollView().chainable
                .horizontalScrollIndicatorInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                .wrapped.horizontalScrollIndicatorInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            XCTAssert(result)
        } else {
            let result = UIScrollView().chainable
                .horizontalScrollIndicatorInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                .wrapped.scrollIndicatorInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            XCTAssert(result)
        }
    }
    
    func testVerticalScrollIndicatorInsets() {
        if #available(iOS 11.1, *) {
            let result = UIScrollView().chainable
                .verticalScrollIndicatorInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                .wrapped.verticalScrollIndicatorInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            XCTAssert(result)
        } else {
            let result = UIScrollView().chainable
                .verticalScrollIndicatorInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                .wrapped.scrollIndicatorInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            XCTAssert(result)
        }
    }
    
    func testScrollToTop() {
        let result = UIScrollView(frame: CGRect(x: 0, y: 0, width: 5, height: 5)).chainable
            .contentSize(CGSize(width: 50, height: 50))
            .contentInset(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .contentOffset(CGPoint(x: 25, y: 25), isAnimated: false)
            .scrollToTop(isAnimated: false)
            .wrapped.contentOffset == CGPoint(x: -5, y: -5)
        XCTAssert(result)
    }
    
    func testScrollToBottom() {
        let result = UIScrollView(frame: CGRect(x: 0, y: 0, width: 5, height: 5)).chainable
            .contentSize(CGSize(width: 50, height: 50))
            .contentInset(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .contentOffset(CGPoint(x: 25, y: 25), isAnimated: false)
            .scrollToBottom(isAnimated: false)
            .stopDecelerating()
            .wrapped.contentOffset == CGPoint(x: 25, y: 50)
        XCTAssert(result)
    }
    
}

extension UIScrollViewChainableTests {
    
    class TestScrollView: UIScrollView {
        
        var isCallScrollRectToVisible = false
        var isCallZoomScale = false
        
        override func scrollRectToVisible(_ rect: CGRect, animated: Bool) {
            isCallScrollRectToVisible = true
            super.scrollRectToVisible(rect, animated: animated)
        }
        
        override func setZoomScale(_ scale: CGFloat, animated: Bool) {
            isCallZoomScale = true
            super.setZoomScale(scale, animated: animated)
        }
        
    }
    
}
