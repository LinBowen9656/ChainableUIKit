//
//  UIBackgroundConfiguration+ChainableTests.swift
//  
//
//  Created by 林博文 on 2021/12/22.
//

import XCTest
@testable import ChainableUIKit

@available(iOS 14.0, *)
final class UIBackgroundConfigurationChainableTests: XCTestCase {
    
    func testCustomView() {
        let view = UIView()
        let result = UIBackgroundConfiguration.listPlainCell().chainable
            .customView(view)
            .wrapped.customView == view
        XCTAssert(result)
    }
    
    func testCornerRadius() {
        let result = UIBackgroundConfiguration.listPlainCell().chainable
            .cornerRadius(5)
            .wrapped.cornerRadius == 5
        XCTAssert(result)
    }
    
    func testBackgroundInsets() {
        let result = UIBackgroundConfiguration.listPlainCell().chainable
            .backgroundInsets(NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .wrapped.backgroundInsets == NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        XCTAssert(result)
    }
    
    func testEdgesAddingLayoutMarginsToBackgroundInsets() {
        let result = UIBackgroundConfiguration.listPlainCell().chainable
            .edgesAddingLayoutMarginsToBackgroundInsets(.leading)
            .wrapped.edgesAddingLayoutMarginsToBackgroundInsets == .leading
        XCTAssert(result)
    }
    
    func testBackgroundColor() {
        let result = UIBackgroundConfiguration.listPlainCell().chainable
            .backgroundColor(.red)
            .wrapped.backgroundColor == .red
        XCTAssert(result)
    }
    
    func testBackgroundColorTransformer() {
        let color = UIConfigurationColorTransformer.grayscale(.red)
        let result = UIBackgroundConfiguration.listPlainCell().chainable
            .backgroundColorTransformer(.grayscale)
            .wrapped.backgroundColorTransformer?(.red) == color
        XCTAssert(result)
    }
    
    func testStrokeColor() {
        let result = UIBackgroundConfiguration.listPlainCell().chainable
            .strokeColor(.red)
            .wrapped.strokeColor == .red
        XCTAssert(result)
    }
    
    func testStrokeColorTransformer() {
        let color = UIConfigurationColorTransformer.grayscale(.red)
        let result = UIBackgroundConfiguration.listPlainCell().chainable
            .strokeColorTransformer(.grayscale)
            .wrapped.strokeColorTransformer?(.red) == color
        XCTAssert(result)
    }
    
    func testStrokeWidth() {
        let result = UIBackgroundConfiguration.listPlainCell().chainable
            .strokeWidth(5)
            .wrapped.strokeWidth == 5
        XCTAssert(result)
    }
    
    func testStrokeOutset() {
        let result = UIBackgroundConfiguration.listPlainCell().chainable
            .strokeOutset(5)
            .wrapped.strokeOutset == 5
        XCTAssert(result)
    }
    
    func testImage() {
        let image = testPNGImage
        if #available(iOS 15.0, *) {
            let result = UIBackgroundConfiguration.listPlainCell().chainable
                .image(image)
                .wrapped.image == image
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testImageContentMode() {
        if #available(iOS 15.0, *) {
            let result = UIBackgroundConfiguration.listPlainCell().chainable
                .imageContentMode(.center)
                .wrapped.imageContentMode == .center
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}
