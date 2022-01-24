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
    
    func testIsObscuresBackgroundDuringPresentation() {
        let result = UISearchController().chainable
            .isObscuresBackgroundDuringPresentation(true)
            .wrapped.obscuresBackgroundDuringPresentation
        XCTAssert(result)
    }
    
    func testIsHidesNavigationBarDuringPresentation() {
        let result = UISearchController().chainable
            .isHidesNavigationBarDuringPresentation(true)
            .wrapped.hidesNavigationBarDuringPresentation
        XCTAssert(result)
    }
    
    func testIsAutomaticallyShowsCancelButton() {
        if #available(iOS 13.0, *) {
            let result = UISearchController().chainable
                .isAutomaticallyShowsCancelButton(true)
                .wrapped.automaticallyShowsCancelButton
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testIsAutomaticallyShowsScopeBar() {
        if #available(iOS 13.0, *) {
            let result = UISearchController().chainable
                .isAutomaticallyShowsScopeBar(true)
                .wrapped.automaticallyShowsScopeBar
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testIsAutomaticallyShowsSearchResultsController() {
        if #available(iOS 13.0, *) {
            let result = UISearchController().chainable
                .isAutomaticallyShowsSearchResultsController(true)
                .wrapped.automaticallyShowsSearchResultsController
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testIsShowsSearchResultsController() {
        if #available(iOS 13.0, *) {
            let result = UISearchController().chainable
                .isShowsSearchResultsController(true)
                .wrapped.showsSearchResultsController
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
        
    }
    
}
