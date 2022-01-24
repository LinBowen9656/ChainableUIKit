//
//  UIPageControl+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/3.
//

import XCTest
@testable import ChainableUIKit

final class UIPageControlChainableTests: XCTestCase {
    
    func testCurrentPage() {
        let result = UIPageControl().chainable
            .numberOfPages(5)
            .currentPage(1)
            .wrapped.currentPage == 1
        XCTAssert(result)
    }
    
    func testNumberOfPages() {
        let result = UIPageControl().chainable
            .numberOfPages(5)
            .wrapped.numberOfPages == 5
        XCTAssert(result)
    }
    
    func testIsHidesForSinglePage() {
        let result = UIPageControl().chainable
            .isHidesForSinglePage(true)
            .wrapped.hidesForSinglePage
        XCTAssert(result)
    }
    
    func testPageIndicatorTintColor() {
        let result = UIPageControl().chainable
            .pageIndicatorTintColor(.red)
            .wrapped.pageIndicatorTintColor == .red
        XCTAssert(result)
    }
    
    func testCurrentPageIndicatorTintColor() {
        let result = UIPageControl().chainable
            .currentPageIndicatorTintColor(.red)
            .wrapped.currentPageIndicatorTintColor == .red
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testBackgroundStyle() {
        let result = UIPageControl().chainable
            .backgroundStyle(.minimal)
            .wrapped.backgroundStyle == .minimal
        XCTAssert(result)
    }
    
    func testIsAllowsContinuousInteraction() {
        if #available(iOS 14.0, *) {
            let result = UIPageControl().chainable
                .isAllowsContinuousInteraction(true)
                .wrapped.allowsContinuousInteraction
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testPreferredIndicatorImage() {
        if #available(iOS 14.0, *) {
            let image = testPNGImage
            let result = UIPageControl().chainable
                .preferredIndicatorImage(image)
                .wrapped.preferredIndicatorImage == image
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testIndicatorImage() {
        if #available(iOS 14.0, *) {
            let image = testPNGImage
            let result = UIPageControl().chainable
                .numberOfPages(5)
                .indicatorImage(image, page: 1)
                .wrapped.indicatorImage(forPage: 1) == image
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}
