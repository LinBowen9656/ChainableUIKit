//
//  UISearchController+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/25.
//

import XCTest
@testable import ChainableUIKit

final class UISearchControllerChainableTests: XCTestCase {
    
    func testIsActive() {
        let result = TestSearchController().chainable
            .isActive(true)
            .wrapped.isCallIsActive
        XCTAssert(result)
    }
    
    func testObscuresBackgroundDuringPresentation() {
        let result = UISearchController().chainable
            .obscuresBackgroundDuringPresentation(true)
            .wrapped.obscuresBackgroundDuringPresentation
        XCTAssert(result)
    }
    
    func testHidesNavigationBarDuringPresentation() {
        let result = UISearchController().chainable
            .hidesNavigationBarDuringPresentation(true)
            .wrapped.hidesNavigationBarDuringPresentation
        XCTAssert(result)
    }
    
    func testAutomaticallyShowsCancelButton() {
        if #available(iOS 13.0, *) {
            let result = UISearchController().chainable
                .automaticallyShowsCancelButton(true)
                .wrapped.automaticallyShowsCancelButton
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testAutomaticallyShowsScopeBar() {
        if #available(iOS 13.0, *) {
            let result = UISearchController().chainable
                .automaticallyShowsScopeBar(true)
                .wrapped.automaticallyShowsScopeBar
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testAutomaticallyShowsSearchResultsController() {
        if #available(iOS 13.0, *) {
            let result = UISearchController().chainable
                .automaticallyShowsSearchResultsController(true)
                .wrapped.automaticallyShowsSearchResultsController
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testShowsSearchResultsController() {
        if #available(iOS 13.0, *) {
            let result = UISearchController().chainable
                .showsSearchResultsController(true)
                .wrapped.showsSearchResultsController
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testIgnoresSearchSuggestionsForSearchBarPlacementStacked() {
        if #available(iOS 16.0, *) {
            let result = UISearchController().chainable
                .ignoresSearchSuggestionsForSearchBarPlacementStacked(true)
                .wrapped.ignoresSearchSuggestionsForSearchBarPlacementStacked
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testScopeBarActivation() {
        if #available(iOS 16.0, *) {
            let result = UISearchController().chainable
                .scopeBarActivation(.manual)
                .wrapped.scopeBarActivation == .manual
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testSearchSuggestions() {
        if #available(iOS 16.0, *) {
            let result = TestSearchController().chainable
                .ignoresSearchSuggestionsForSearchBarPlacementStacked(true)
                .searchSuggestions([UISearchSuggestionItem()])
                .wrapped.isCallSearchSuggestions
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
}

extension UISearchControllerChainableTests {
    
    class TestSearchController: UISearchController {
        var isCallIsActive = false
        override var isActive: Bool {
            get {
                super.isActive
            }
            set {
                isCallIsActive = true
                super.isActive = newValue
            }
        }
        var isCallSearchSuggestions = false
        @available(iOS 16.0, *)
        override var searchSuggestions: [UISearchSuggestion]? {
            get { super.searchSuggestions }
            set {
                isCallSearchSuggestions = true
                super.searchSuggestions = newValue
            }
        }
    }
    
}
