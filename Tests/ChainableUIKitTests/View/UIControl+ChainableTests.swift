//
//  UIControl+ChainableTests.swift
//
//
//  Created by 林博文 on 2022/1/2.
//

import XCTest
@testable import ChainableUIKit

final class UIControlChainableTests: XCTestCase {
    
    func testAddTarget() {
        let target = TestTarget()
        let result = UIControl().chainable
            .addTarget(target: target, action: #selector(target.action), event: .touchUpInside)
            .wrapped.actions(forTarget: target, forControlEvent: .touchUpInside)?.first == "action"
        XCTAssert(result)
    }
    
    func testRemoveTarget() {
        let target = TestTarget()
        let result = UIControl().chainable
            .addTarget(target: target, action: #selector(target.action), event: .touchUpInside)
            .removeTarget(target: target, action: #selector(target.action), event: .touchUpInside)
            .wrapped.actions(forTarget: target, forControlEvent: .touchUpInside)?.count ?? 0 == 0
        XCTAssert(result)
    }
    
    func testIsEnabled() {
        let result = UIControl().chainable
            .isEnabled(true)
            .wrapped.isEnabled
        XCTAssert(result)
    }
    
    func testIsSelected() {
        let result = UIControl().chainable
            .isSelected(true)
            .wrapped.isSelected
        XCTAssert(result)
    }
    
    func testIsHighlighted() {
        let result = UIControl().chainable
            .isHighlighted(true)
            .wrapped.isHighlighted
        XCTAssert(result)
    }
    
    func testContentVerticalAlignment() {
        let result = UIControl().chainable
            .contentVerticalAlignment(.top)
            .wrapped.contentVerticalAlignment == .top
        XCTAssert(result)
    }
    
    func testContentHorizontalAlignment() {
        let result = UIControl().chainable
            .contentHorizontalAlignment(.leading)
            .wrapped.contentHorizontalAlignment == .leading
        XCTAssert(result)
    }
    
    func testAddActionHandler() {
        let result = UIControl().chainable
            .addActionHandler(event: .touchUpInside) { _ in }
            .wrapped.allTargets.count == 1
        XCTAssert(result)
    }
    
    func testRemoveActionHandler() {
        let result = UIControl().chainable
            .addActionHandler(event: .touchUpInside) { _ in }
            .removeActionHandler(event: .touchUpInside)
            .wrapped.allTargets.isEmpty
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testAddAction() {
        let result = TestButton().chainable
            .addAction(UIAction { _ in }, event: .touchUpInside)
            .wrapped.isCallAddAction
        XCTAssert(result)
    }
    
    @available(iOS 14.0, *)
    func testRemoveAction() {
        let action = UIAction { _ in }
        let result = TestButton().chainable
            .addAction(action, event: .touchUpInside)
            .removeAction(action, event: .touchUpInside)
            .wrapped.isCallRemoveAction
        XCTAssert(result)
    }
    
    func testIsShowsMenuAsPrimaryAction() {
        if #available(iOS 14.0, *) {
            let result = TestButton().chainable
                .isShowsMenuAsPrimaryAction(true)
                .wrapped.showsMenuAsPrimaryAction
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testIsContextMenuInteractionEnabled() {
        if #available(iOS 14.0, *) {
            let result = TestButton().chainable
                .isContextMenuInteractionEnabled(true)
                .wrapped.isContextMenuInteractionEnabled
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testToolTip() {
        if #available(iOS 15.0, macCatalyst 15.0, *), UIDevice.current.isiOSAppOnMac {
            let result = TestButton().chainable
                .toolTip("Test")
                .wrapped.toolTip == "Test"
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}

extension UIControlChainableTests {
    
    class TestTarget: NSObject {
        
        @objc
        func action() {}
        
    }
    
    class TestButton: UIButton {
        
        var isCallAddAction = false
        var isCallRemoveAction = false
        
        @available(iOS 14.0, *)
        override func addAction(_ action: UIAction, for controlEvents: UIControl.Event) {
            isCallAddAction = true
            super.addAction(action, for: controlEvents)
        }
        
        @available(iOS 14.0, *)
        override func removeAction(_ action: UIAction, for controlEvents: UIControl.Event) {
            isCallRemoveAction = true
            super.removeAction(action, for: controlEvents)
        }
        
    }
    
    @available(iOS 13.0, *)
    class TestContextMenuInteractionDelegate: NSObject, UIContextMenuInteractionDelegate {
        
        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
            UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
                UIMenu(children: [UIAction(title: "Test") { _ in }])
            }
        }
        
    }
    
}
