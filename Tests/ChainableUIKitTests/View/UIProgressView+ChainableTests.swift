//
//  UIProgressView+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/3.
//

import XCTest
@testable import ChainableUIKit

final class UIProgressViewChainableTests: XCTestCase {
    
    func testProgress() {
        let result = UIProgressView().chainable
            .progress(0.5, isAnimated: false)
            .wrapped.progress == 0.5
        XCTAssert(result)
    }
    
    func testObservedProgress() {
        let progress = Progress(totalUnitCount: 5)
        let result = UIProgressView().chainable
            .observedProgress(progress)
            .wrapped.observedProgress == progress
        XCTAssert(result)
    }
    
    func testProgressViewStyle() {
        let result = UIProgressView().chainable
            .progressViewStyle(.bar)
            .wrapped.progressViewStyle == .bar
        XCTAssert(result)
    }
    
    func testProgressImage() {
        let image = testPNGImage
        let result = UIProgressView().chainable
            .progressImage(image)
            .wrapped.progressImage == image
        XCTAssert(result)
    }
    
    func testTrackImage() {
        let image = testPNGImage
        let result = UIProgressView().chainable
            .trackImage(image)
            .wrapped.trackImage == image
        XCTAssert(result)
    }
    
    func testProgressTintColor() {
        let result = UIProgressView().chainable
            .progressTintColor(.red)
            .wrapped.progressTintColor == .red
        XCTAssert(result)
    }
    
    func testTrackTintColor() {
        let result = UIProgressView().chainable
            .trackTintColor(.red)
            .wrapped.trackTintColor == .red
        XCTAssert(result)
    }
    
}
