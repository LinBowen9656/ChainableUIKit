//
//  UIView+UIKitUtilsTests.swift
//  
//
//  Created by 林博文 on 2022/2/8.
//

import XCTest
@testable import UIKitUtils

class UIViewUIKitUtilsTests: XCTestCase {
    
    func testResponderViewController() {
        let controller = UIViewController()
        let view = UIView()
        controller.view.addSubview(view)
        XCTAssert(view.responderViewController == controller)
    }
    
    func testCornerRadius() {
        let view = UIView()
        view.cornerRadius = 5
        XCTAssert(view.layer.cornerRadius == 5)
    }
    
    func testIsCornerContinuous() {
        let view = UIView()
        view.isCornerContinuous = true
        if #available(iOS 13.0, *) {
            XCTAssert(view.layer.cornerCurve == .continuous)
        } else {
            XCTAssert(view.layer.value(forKey: "continuousCorners") as? Bool == true)
        }
    }
    
    func testBorderStrokeWidth() {
        let view = UIView()
        view.borderStrokeWidth = 5
        XCTAssert(view.layer.borderWidth == 5)
    }
    
    func testBorderStrokeColor() {
        let view = UIView()
        view.borderStrokeColor = UIColor.red
        XCTAssert(view.layer.borderColor == UIColor.red.cgColor)
    }
    
    func testBorderShadowRadius() {
        let view = UIView()
        view.borderShadowRadius = 5
        XCTAssert(view.layer.shadowRadius == 5)
    }
    
    func testBorderShadowColor() {
        let view = UIView()
        view.borderShadowColor = UIColor.red
        XCTAssert(view.layer.shadowColor == UIColor.red.cgColor)
    }
    
    func testBorderShadowOpacity() {
        let view = UIView()
        view.borderShadowOpacity = 0.5
        XCTAssert(view.layer.shadowOpacity == 0.5)
    }
    
    func testBorderShadowOffset() {
        let view = UIView()
        view.borderShadowOffset = CGSize(width: 5, height: 5)
        XCTAssert(view.layer.shadowOffset == CGSize(width: 5, height: 5))
    }
    
    func testConstraints() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let widthConstraint = view.widthAnchor.constraint(equalToConstant: 5)
        widthConstraint.identifier = "widthConstraint"
        NSLayoutConstraint.activate([
            widthConstraint,
            view.heightAnchor.constraint(equalToConstant: 5)
        ])
        let result = view.constraints(with: "widthConstraint").first == widthConstraint
        XCTAssert(result)
    }
    
    func testSuperview() {
        let superview = UIButton()
        let view = UIView()
        let subview = UIView()
        view.addSubview(subview)
        superview.addSubview(view)
        XCTAssert(subview.superview(type: UIButton.self) == superview)
    }
    
}
