//
//  UICollectionViewCell+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/2.
//

import XCTest
@testable import ChainableUIKit

final class UICollectionViewCellChainableTests: XCTestCase {
    
    @available(iOS 14.0, *)
    func testBackgroundConfiguration() {
        let configuration = UIBackgroundConfiguration.listPlainCell()
        let result = UICollectionViewCell().chainable
            .backgroundConfiguration(configuration)
            .wrapped.backgroundConfiguration == configuration
        XCTAssert(result)
    }
    
    func testAutomaticallyUpdatesBackgroundConfiguration() {
        if #available(iOS 14.0, *) {
            let result = UICollectionViewCell().chainable
                .automaticallyUpdatesBackgroundConfiguration(true)
                .wrapped.automaticallyUpdatesBackgroundConfiguration
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testBackgroundView() {
        let view = UIView()
        let result = UICollectionViewCell().chainable
            .backgroundView(view)
            .wrapped.backgroundView == view
        XCTAssert(result)
    }
    
    func testSelectedBackgroundView() {
        let view = UIView()
        let result = UICollectionViewCell().chainable
            .selectedBackgroundView(view)
            .wrapped.selectedBackgroundView == view
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testContentConfiguration() {
        let configuration = UIListContentConfiguration.cell()
        let result = UICollectionViewCell().chainable
            .contentConfiguration(configuration)
            .wrapped.contentConfiguration as? UIListContentConfiguration == configuration
        XCTAssert(result)
    }
    
    func testAutomaticallyUpdatesContentConfiguration() {
        if #available(iOS 14.0, *) {
            let result = UICollectionViewCell().chainable
                .automaticallyUpdatesContentConfiguration(true)
                .wrapped.automaticallyUpdatesContentConfiguration
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testIsSelected() {
        let result = UICollectionViewCell().chainable
            .isSelected(true)
            .wrapped.isSelected
        XCTAssert(result)
    }
    
    func testIsHighlighted() {
        let result = UICollectionViewCell().chainable
            .isHighlighted(true)
            .wrapped.isHighlighted
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testConfigurationUpdateHandler() {
        if #available(iOS 15.0, *) {
            let result = UICollectionViewCell().chainable
                .configurationUpdateHandler { cell, state in }
                .wrapped.configurationUpdateHandler != nil
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}
