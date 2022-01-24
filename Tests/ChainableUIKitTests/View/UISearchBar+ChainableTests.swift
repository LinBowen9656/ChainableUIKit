//
//  UISearchBar+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/3.
//

import XCTest
@testable import ChainableUIKit

final class UISearchBarChainableTests: XCTestCase {
    
    func testPlaceholder() {
        let result = UISearchBar().chainable
            .placeholder("Test")
            .wrapped.placeholder == "Test"
        XCTAssert(result)
    }
    
    func testPrompt() {
        let result = UISearchBar().chainable
            .prompt("Test")
            .wrapped.prompt == "Test"
        XCTAssert(result)
    }
    
    func testText() {
        let result = UISearchBar().chainable
            .text("Test")
            .wrapped.text == "Test"
        XCTAssert(result)
    }
    
    func testBarTintColor() {
        let result = UISearchBar().chainable
            .barTintColor(.red)
            .wrapped.barTintColor == .red
        XCTAssert(result)
    }
    
    func testSearchBarStyle() {
        let result = UISearchBar().chainable
            .searchBarStyle(.minimal)
            .wrapped.searchBarStyle == .minimal
        XCTAssert(result)
    }
    
    func testIsTranslucent() {
        let result = UISearchBar().chainable
            .isTranslucent(true)
            .wrapped.isTranslucent
        XCTAssert(result)
    }
    
    func testBarStyle() {
        let result = UISearchBar().chainable
            .barStyle(.black)
            .wrapped.barStyle == .black
        XCTAssert(result)
    }
    
    func testIsShowsBookmarkButton() {
        let result = UISearchBar().chainable
            .isShowsBookmarkButton(true)
            .wrapped.showsBookmarkButton
        XCTAssert(result)
    }
    
    func testIsShowsCancelButton() {
        let result = UISearchBar().chainable
            .isShowsCancelButton(true, isAnimated: false)
            .wrapped.showsCancelButton
        XCTAssert(result)
    }
    
    func testIsShowsSearchResultsButton() {
        let result = UISearchBar().chainable
            .isShowsSearchResultsButton(true)
            .wrapped.showsSearchResultsButton
        XCTAssert(result)
    }
    
    func testIsSearchResultsButtonSelected() {
        let result = UISearchBar().chainable
            .isSearchResultsButtonSelected(true)
            .wrapped.isSearchResultsButtonSelected
        XCTAssert(result)
    }
    
    func testScopeButtonTitles() {
        let result = UISearchBar().chainable
            .scopeButtonTitles(["Test"])
            .wrapped.scopeButtonTitles == ["Test"]
        XCTAssert(result)
    }
    
    func testSelectedScopeButtonIndex() {
        let result = UISearchBar().chainable
            .scopeButtonTitles(["Test"])
            .selectedScopeButtonIndex(0)
            .wrapped.selectedScopeButtonIndex == 0
        XCTAssert(result)
    }
    
    func testIsShowsScopeBar() {
        let result = UISearchBar().chainable
            .isShowsScopeBar(true, isAnimated: false)
            .wrapped.showsScopeBar
        XCTAssert(result)
    }
    
    func testBackgroundImage() {
        let image = testPNGImage
        let result = UISearchBar().chainable
            .backgroundImage(image)
            .wrapped.backgroundImage == image
        XCTAssert(result)
    }
    
    func testImage() {
        let image = testPNGImage
        let result = UISearchBar().chainable
            .image(image, icon: .bookmark, state: .normal)
            .wrapped.image(for: .bookmark, state: .normal) == image
        XCTAssert(result)
    }
    
    func testPositionAdjustment() {
        let result = UISearchBar().chainable
            .positionAdjustment(UIOffset(horizontal: 5, vertical: 5), icon: .bookmark)
            .wrapped.positionAdjustment(for: .bookmark) == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    func testInputAccessoryView() {
        let view = UIView()
        let result = UISearchBar().chainable
            .inputAccessoryView(view)
            .wrapped.inputAccessoryView == view
        XCTAssert(result)
    }
    
    func testScopeBarBackgroundImage() {
        let image = testPNGImage
        let result = UISearchBar().chainable
            .scopeBarBackgroundImage(image)
            .wrapped.scopeBarBackgroundImage == image
        XCTAssert(result)
    }
    
    func testScopeBarButtonBackgroundImage() {
        let image = testPNGImage
        let result = UISearchBar().chainable
            .scopeButtonTitles(["Test1", "Test2"])
            .scopeBarButtonBackgroundImage(image, state: .normal)
            .wrapped.scopeBarButtonBackgroundImage(for: .normal) == image
        XCTAssert(result)
    }
    
    func testScopeBarButtonDividerImage() {
        let image = testPNGImage
        let result = UISearchBar().chainable
            .scopeButtonTitles(["Test1", "Test2"])
            .scopeBarButtonDividerImage(image, leftSegmentState: .normal, rightSegmentState: .normal)
            .wrapped.scopeBarButtonDividerImage(forLeftSegmentState: .normal, rightSegmentState: .normal) == image
        XCTAssert(result)
    }
    
    func testScopeBarButtonTitleTextAttributes() {
        let result = UISearchBar().chainable
            .scopeButtonTitles(["Test1", "Test2"])
            .scopeBarButtonTitleTextAttributes([.font: UIFont.systemFont(ofSize: 55)], state: .normal)
            .wrapped.scopeBarButtonTitleTextAttributes(for: .normal)?[.font] as? UIFont == .systemFont(ofSize: 55)
        XCTAssert(result)
    }
    
    func testSearchFieldBackgroundImage() {
        let image = testPNGImage
        let result = UISearchBar().chainable
            .searchFieldBackgroundImage(image, state: .normal)
            .wrapped.searchFieldBackgroundImage(for: .normal) == image
        XCTAssert(result)
    }
    
    func testSearchFieldBackgroundPositionAdjustment() {
        let result = UISearchBar().chainable
            .searchFieldBackgroundPositionAdjustment(UIOffset(horizontal: 5, vertical: 5))
            .wrapped.searchFieldBackgroundPositionAdjustment == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
    func testSearchTextPositionAdjustment() {
        let result = UISearchBar().chainable
            .searchTextPositionAdjustment(UIOffset(horizontal: 5, vertical: 5))
            .wrapped.searchTextPositionAdjustment == UIOffset(horizontal: 5, vertical: 5)
        XCTAssert(result)
    }
    
}
