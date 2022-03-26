//
//  UIView+ChainableTests.swift
//
//
//  Created by 林博文 on 2022/1/12.
//

import XCTest
@testable import ChainableUIKit

final class UIViewChainableTests: XCTestCase {
    
    func testCornerRadius() {
        let result = UIView().chainable
            .cornerRadius(5)
            .wrapped.cornerRadius == 5
        XCTAssert(result)
    }
    
    func testMaskedCorners() {
        let result = UIView().chainable
            .maskedCorners(.layerMaxXMaxYCorner)
            .wrapped.layer.maskedCorners == .layerMaxXMaxYCorner
        XCTAssert(result)
    }
    
    func testBorderStrokeWidth() {
        let result = UIView().chainable
            .borderStrokeWidth(5)
            .wrapped.borderStrokeWidth == 5
        XCTAssert(result)
    }
    
    func testBorderStrokeColor() {
        let result = UIView().chainable
            .borderStrokeColor(.red)
            .wrapped.borderStrokeColor == .red
        XCTAssert(result)
    }
    
    func testShadowRadius() {
        let result = UIView().chainable
            .shadowRadius(5)
            .wrapped.borderShadowRadius == 5
        XCTAssert(result)
    }
    
    func testShadowColor() {
        let result = UIView().chainable
            .shadowColor(.red)
            .wrapped.borderShadowColor == .red
        XCTAssert(result)
    }
    
    func testShadowOpacity() {
        let result = UIView().chainable
            .shadowOpacity(0.5)
            .wrapped.borderShadowOpacity == 0.5
        XCTAssert(result)
    }
    
    func testShadowOffset() {
        let result = UIView().chainable
            .shadowOffset(CGSize(width: 5, height: 5))
            .wrapped.borderShadowOffset == CGSize(width: 5, height: 5)
        XCTAssert(result)
    }
    
    func testTintColor() {
        let result = UIView().chainable
            .tintColor(.red)
            .wrapped.tintColor == .red
        XCTAssert(result)
    }
    
    func testContentMode() {
        let result = UIView().chainable
            .contentMode(.center)
            .wrapped.contentMode == .center
        XCTAssert(result)
    }
    
    func testBackgroundColor() {
        let result = UIView().chainable
            .backgroundColor(.red)
            .wrapped.backgroundColor == .red
        XCTAssert(result)
    }
    
    func testIsContinuousCorners() {
        if #available(iOS 13, *) {
            let result = UIView().chainable
                .isContinuousCorners(true)
                .wrapped.layer.cornerCurve == .continuous
            XCTAssert(result)
        } else {
            let result = UIView().chainable
                .isContinuousCorners(true)
                .wrapped.value(forKey: "continuousCorners") as? Bool == true
            XCTAssert(result)
        }
    }
    
    func testTranslatesAutoresizingMaskIntoConstraints() {
        let result = UIView().chainable
            .translatesAutoresizingMaskIntoConstraints(true)
            .wrapped.translatesAutoresizingMaskIntoConstraints
        XCTAssert(result)
    }
    
    func testAddSubview() {
        let result = UIView().chainable
            .addSubview(UIView())
            .wrapped.subviews.count == 1
        XCTAssert(result)
    }
    
    func testBringSubviewToFront() {
        let view = UIView()
        let result = UIView().chainable
            .addSubview(view)
            .addSubview(UIView())
            .bringSubviewToFront(view)
            .wrapped.subviews.last == view
        XCTAssert(result)
    }
    
    func testSendSubviewToBack() {
        let view = UIView()
        let result = UIView().chainable
            .addSubview(UIView())
            .addSubview(view)
            .sendSubviewToBack(view)
            .wrapped.subviews.first == view
        XCTAssert(result)
    }
    
    func testRemoveFromSuperview() {
        let subview = UIView()
        let view = UIView()
        view.addSubview(subview)
        let result = subview.chainable
            .removeFromSuperview()
            .wrapped.superview == nil
        XCTAssert(result)
    }
    
    func testInsertSubviewAtIndex() {
        let view = UIView()
        let result = UIView().chainable
            .addSubview(UIView())
            .insertSubview(view, atIndex: 0)
            .wrapped.subviews.first == view
        XCTAssert(result)
    }
    
    func testInsertSubviewAbove() {
        let subview1 = UIView()
        let subview2 = UIView()
        let result = UIView().chainable
            .addSubview(subview1)
            .insertSubview(subview2, aboveSubview: subview1)
            .wrapped.subviews.last == subview2
        XCTAssert(result)
    }
    
    func testInsertSubviewBelow() {
        let subview1 = UIView()
        let subview2 = UIView()
        let result = UIView().chainable
            .addSubview(subview1)
            .insertSubview(subview2, belowSubview: subview1)
            .wrapped.subviews.first == subview2
        XCTAssert(result)
    }
    
    func testExchangeSubview() {
        let view = UIView()
        let result = UIView().chainable
            .addSubview(UIView())
            .addSubview(view)
            .exchangeSubview(0, atIndex: 1)
            .wrapped.subviews.first == view
        XCTAssert(result)
    }
    
    func testAddToSuperview() {
        let view = UIView()
        let result = UIView().chainable
            .addToSuperview(view)
            .wrapped.superview == view
        XCTAssert(result)
    }
    
    func testRemoveSubview() {
        let view = UIView()
        let result = UIView().chainable
            .addSubview(view)
            .removeSubview(view)
            .wrapped.subviews.isEmpty
        XCTAssert(result)
    }
    
    func testRemoveAllSubviews() {
        let result = UIView().chainable
            .addSubview(UIView())
            .addSubview(UIView())
            .removeAllSubviews()
            .wrapped.subviews.isEmpty
        XCTAssert(result)
    }
    
    func testDirectionalLayoutMargins() {
        let result = UIView().chainable
            .directionalLayoutMargins(NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .wrapped.directionalLayoutMargins == NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        XCTAssert(result)
    }
    
    func testLayoutMargins() {
        let result = UIView().chainable
            .layoutMargins(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            .wrapped.layoutMargins == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        XCTAssert(result)
    }
    
    func testPreservesSuperviewLayoutMargins() {
        let result = UIView().chainable
            .preservesSuperviewLayoutMargins(true)
            .wrapped.preservesSuperviewLayoutMargins
        XCTAssert(result)
    }
    
    func testInsetsLayoutMarginsFromSafeArea() {
        let result = UIView().chainable
            .insetsLayoutMarginsFromSafeArea(true)
            .wrapped.insetsLayoutMarginsFromSafeArea
        XCTAssert(result)
    }
    
    func testAlpha() {
        let result = UIView().chainable
            .alpha(0.5)
            .wrapped.alpha == 0.5
        XCTAssert(result)
    }
    
    func testAddGestureRecognizer() {
        let result = UIView().chainable
            .addGestureRecognizer(UIPanGestureRecognizer())
            .wrapped.gestureRecognizers?.count == 1
        XCTAssert(result)
    }
    
    func testRemoveGestureRecognizer() {
        let gesture = UIPanGestureRecognizer()
        let result = UIView().chainable
            .addGestureRecognizer(gesture)
            .removeGestureRecognizer(gesture)
            .wrapped.gestureRecognizers?.isEmpty ?? true
        XCTAssert(result)
    }
    
    func testOnTap() {
        let result = UIView().chainable
            .onTap {}
            .wrapped.gestureRecognizers?.count == 1
        XCTAssert(result)
    }
    
    func testIsHidden() {
        let result = UIView().chainable
            .isHidden(true)
            .wrapped.isHidden
        XCTAssert(result)
    }
    
    func testIsUserInteractionEnabled() {
        let result = UIView().chainable
            .isUserInteractionEnabled(true)
            .wrapped.isUserInteractionEnabled
        XCTAssert(result)
    }
    
    func testClipsToBounds() {
        let result = UIView().chainable
            .clipsToBounds(true)
            .wrapped.clipsToBounds
        XCTAssert(result)
    }
    
    func testTag() {
        let result = UIView().chainable
            .tag(5)
            .wrapped.tag == 5
        XCTAssert(result)
    }
    
    func testFrame() {
        let result = UIView().chainable
            .frame(CGRect(x: 5, y: 5, width: 5, height: 5))
            .wrapped.frame == CGRect(x: 5, y: 5, width: 5, height: 5)
        XCTAssert(result)
    }
    
    func testBounds() {
        let result = UIView().chainable
            .bounds(CGRect(x: 5, y: 5, width: 5, height: 5))
            .wrapped.bounds == CGRect(x: 5, y: 5, width: 5, height: 5)
        XCTAssert(result)
    }
    
    func testSize() {
        let result = UIView().chainable
            .size(CGSize(width: 5, height: 5))
            .wrapped.frame.size == CGSize(width: 5, height: 5)
        XCTAssert(result)
    }
    
    func testOrigin() {
        let result = UIView().chainable
            .origin(CGPoint(x: 5, y: 5))
            .wrapped.frame.origin == CGPoint(x: 5, y: 5)
        XCTAssert(result)
    }
    
    func testCenter() {
        let result = UIView().chainable
            .center(CGPoint(x: 5, y: 5))
            .wrapped.center == CGPoint(x: 5, y: 5)
        XCTAssert(result)
    }
    
    func testTransform() {
        let result = UIView().chainable
            .transform(CGAffineTransform(rotationAngle: 0.5))
            .wrapped.transform == CGAffineTransform(rotationAngle: 0.5)
        XCTAssert(result)
    }
    
    func testSetNeedsLayout() {
        let result = TestView().chainable
            .setNeedsLayout()
            .wrapped.isCallSetNeedsLayout
        XCTAssert(result)
    }
    
    func testLayoutIfNeeded() {
        let result = TestView().chainable
            .layoutIfNeeded()
            .wrapped.isCallLayoutIfNeeded
        XCTAssert(result)
    }
    
    func testLayout() {
        let view = UIView()
        let constraint = view.widthAnchor.constraint(equalToConstant: 5)
        let result = view.chainable
            .layout { _ in
                constraint
            }
            .wrapped.constraints.contains(constraint)
        XCTAssert(result)
    }
    
    func testIsOpaque() {
        let result = UIView().chainable
            .isOpaque(true)
            .wrapped.isOpaque
        XCTAssert(result)
    }
    
    func testTintAdjustmentMode() {
        let result = UIView().chainable
            .tintAdjustmentMode(.dimmed)
            .wrapped.tintAdjustmentMode == .dimmed
        XCTAssert(result)
    }
    
    func testMaskView() {
        let view = UIView()
        let result = UIView().chainable
            .maskView(view)
            .wrapped.mask == view
        XCTAssert(result)
    }
    
    func testMaskLayer() {
        let layer = CALayer()
        let result = UIView().chainable
            .maskLayer(layer)
            .wrapped.layer.mask == layer
        XCTAssert(result)
    }
    
    func testIsMultipleTouchEnabled() {
        let result = UIView().chainable
            .isMultipleTouchEnabled(true)
            .wrapped.isMultipleTouchEnabled
        XCTAssert(result)
    }
    
    func testIsExclusiveTouch() {
        let result = UIView().chainable
            .isExclusiveTouch(true)
            .wrapped.isExclusiveTouch
        XCTAssert(result)
    }
    
    func testAddConstraints() {
        let view = UIView()
        let constraint = view.widthAnchor.constraint(equalToConstant: 5)
        let result = view.chainable
            .addConstraints([constraint])
            .wrapped.constraints.contains(constraint)
        XCTAssert(result)
    }
    
    func testRemoveConstraints() {
        let view = UIView()
        let constraint = view.widthAnchor.constraint(equalToConstant: 5)
        let result = !view.chainable
            .addConstraints([constraint])
            .removeConstraints([constraint])
            .wrapped.constraints.contains(constraint)
        XCTAssert(result)
    }
    
    func testAddLayoutGuide() {
        let layoutGuide = UILayoutGuide()
        let result = UIView().chainable
            .addLayoutGuide(layoutGuide)
            .wrapped.layoutGuides.contains(layoutGuide)
        XCTAssert(result)
    }
    
    func testRemoveLayoutGuide() {
        let layoutGuide = UILayoutGuide()
        let result = !UIView().chainable
            .addLayoutGuide(layoutGuide)
            .removeLayoutGuide(layoutGuide)
            .wrapped.layoutGuides.contains(layoutGuide)
        XCTAssert(result)
    }
    
    func testInvalidateIntrinsicContentSize() {
        let result = TestView().chainable
            .invalidateIntrinsicContentSize()
            .wrapped.isCallInvalidateIntrinsicContentSize
        XCTAssert(result)
    }
    
    func testContentCompressionResistancePriority() {
        let result = UIView().chainable
            .contentCompressionResistancePriority(.fittingSizeLevel, axis: .horizontal)
            .wrapped.contentCompressionResistancePriority(for: .horizontal) == .fittingSizeLevel
        XCTAssert(result)
    }
    
    func testContentHuggingPriority() {
        let result = UIView().chainable
            .contentHuggingPriority(.fittingSizeLevel, axis: .horizontal)
            .wrapped.contentHuggingPriority(for: .horizontal) == .fittingSizeLevel
        XCTAssert(result)
    }
    
    func testSetNeedsUpdateConstraints() {
        let result = TestView().chainable
            .setNeedsUpdateConstraints()
            .wrapped.isCallSetNeedsUpdateConstraints
        XCTAssert(result)
    }
    
    func testUpdateConstraintsIfNeeded() {
        let result = TestView().chainable
            .updateConstraintsIfNeeded()
            .wrapped.isCallUpdateConstraintsIfNeeded
        XCTAssert(result)
    }
    
    func testExerciseAmbiguityInLayout() {
        let result = TestView().chainable
            .exerciseAmbiguityInLayout()
            .wrapped.isCallExerciseAmbiguityInLayout
        XCTAssert(result)
    }
    
    func testSizeToFit() {
        let result = TestView().chainable
            .sizeToFit()
            .wrapped.isCallSizeToFit
        XCTAssert(result)
    }
    
    func testAutoresizesSubviews() {
        let result = UIView().chainable
            .autoresizesSubviews(true)
            .wrapped.autoresizesSubviews
        XCTAssert(result)
    }
    
    func testAutoresizingMask() {
        let result = UIView().chainable
            .autoresizingMask(.flexibleHeight)
            .wrapped.autoresizingMask == .flexibleHeight
        XCTAssert(result)
    }
    
    @available(iOS 13.0, *)
    func testOverrideUserInterfaceStyle() {
        let result = UIView().chainable
            .overrideUserInterfaceStyle(.dark)
            .wrapped.overrideUserInterfaceStyle == .dark
        XCTAssert(result)
    }
    
    func testSemanticContentAttribute() {
        let result = UIView().chainable
            .semanticContentAttribute(.forceRightToLeft)
            .wrapped.semanticContentAttribute == .forceRightToLeft
        XCTAssert(result)
    }
    
    func testAddInteraction() {
        let interaction = UIDragInteraction(delegate: TestDragInteractionDelegate())
        let result = UIView().chainable
            .addInteraction(interaction)
            .wrapped.interactions.contains { $0 as? UIDragInteraction == interaction }
        XCTAssert(result)
    }
    
    func testRemoveInteraction() {
        let interaction = UIDragInteraction(delegate: TestDragInteractionDelegate())
        let result = !UIView().chainable
            .addInteraction(interaction)
            .removeInteraction(interaction)
            .wrapped.interactions.contains { $0 as? UIDragInteraction == interaction }
        XCTAssert(result)
    }
    
    func testSetNeedsDisplay() {
        let result = TestView().chainable
            .setNeedsDisplay()
            .wrapped.isCallSetNeedsDisplay
        XCTAssert(result)
    }
    
    func testSetNeedsDisplayRect() {
        let result = TestView().chainable
            .setNeedsDisplay(.zero)
            .wrapped.isCallSetNeedsDisplay
        XCTAssert(result)
    }
    
    func testContentScaleFactor() {
        let result = UIView().chainable
            .contentScaleFactor(0.5)
            .wrapped.contentScaleFactor == 0.5
        XCTAssert(result)
    }
    
    func testAddMotionEffect() {
        let effect = UIMotionEffect()
        let result = UIView().chainable
            .addMotionEffect(effect)
            .wrapped.motionEffects.contains(effect)
        XCTAssert(result)
    }
    
    func testRemoveMotionEffect() {
        let effect = UIMotionEffect()
        let result = !UIView().chainable
            .addMotionEffect(effect)
            .removeMotionEffect(effect)
            .wrapped.motionEffects.contains(effect)
        XCTAssert(result)
    }
    
    func testRestorationIdentifier() {
        let result = UIView().chainable
            .restorationIdentifier("Test")
            .wrapped.restorationIdentifier == "Test"
        XCTAssert(result)
    }
    
    func testEndEditing() {
        let result = TestView().chainable
            .endEditing(true)
            .wrapped.isCallEndEditing
        XCTAssert(result)
    }
    
    func testAccessibilityIgnoresInvertColors() {
        let result = UIView().chainable
            .accessibilityIgnoresInvertColors(true)
            .wrapped.accessibilityIgnoresInvertColors
        XCTAssert(result)
    }
    
    func testFocusGroupIdentifier() {
        if #available(iOS 14.0, *) {
            let result = UIView().chainable
                .focusGroupIdentifier("Test")
                .wrapped.focusGroupIdentifier == "Test"
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testSetNeedsFocusUpdate() {
        let result = TestView().chainable
            .setNeedsFocusUpdate()
            .wrapped.isCallSetNeedsFocusUpdate
        XCTAssert(result)
    }
    
    func testUpdateFocusIfNeeded() {
        let result = TestView().chainable
            .updateFocusIfNeeded()
            .wrapped.isCallUpdateFocusIfNeeded
        XCTAssert(result)
    }
    
    func testLargeContentImage(_ image: UIImage?) {
        if #available(iOS 13.0, *) {
            let image = testPNGImage
            let result = UIView().chainable
                .largeContentImage(image)
                .wrapped.largeContentImage == image
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testLargeContentImageInsets() {
        if #available(iOS 13.0, *) {
            let result = UIView().chainable
                .largeContentImageInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
                .wrapped.largeContentImageInsets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testLargeContentTitle() {
        if #available(iOS 13.0, *) {
            let result = UIView().chainable
                .largeContentTitle("Test")
                .wrapped.largeContentTitle == "Test"
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testScalesLargeContentImage() {
        if #available(iOS 13.0, *) {
            let result = UIView().chainable
                .scalesLargeContentImage(true)
                .wrapped.scalesLargeContentImage
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testShowsLargeContentViewer() {
        if #available(iOS 13.0, *) {
            let result = UIView().chainable
                .showsLargeContentViewer(true)
                .wrapped.showsLargeContentViewer
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testTransform3D() {
        if #available(iOS 13.0, *) {
            var transform = CATransform3D()
            transform.m11 = 5
            let result = UIView().chainable
                .transform3D(transform)
                .wrapped.transform3D.m11 == 5
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    @available(iOS 15.0, *)
    func testFocusEffect() {
        let effect = UIFocusEffect()
        let result = UIView().chainable
            .focusEffect(effect)
            .wrapped.focusEffect == effect
        XCTAssert(result)
    }
    
    @available(iOS 15.0, *)
    func testFocusGroupPriority() {
        let result = UIView().chainable
            .focusGroupPriority(.ignored)
            .wrapped.focusGroupPriority == .ignored
        XCTAssert(result)
    }
    
    func testMaximumContentSizeCategory() {
        if #available(iOS 15.0, *) {
            let result = UIView().chainable
                .maximumContentSizeCategory(.extraLarge)
                .wrapped.maximumContentSizeCategory == .extraLarge
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
    func testMinimumContentSizeCategory() {
        if #available(iOS 15.0, *) {
            let result = UIView().chainable
                .minimumContentSizeCategory(.extraLarge)
                .wrapped.minimumContentSizeCategory == .extraLarge
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}

extension UIViewChainableTests {
    
    class TestView: UIView {
        
        var isCallSetNeedsLayout = false
        var isCallLayoutIfNeeded = false
        var isCallSetNeedsDisplay = false
        var isCallSetNeedsUpdateConstraints = false
        var isCallUpdateConstraintsIfNeeded = false
        var isCallSetNeedsFocusUpdate = false
        var isCallUpdateFocusIfNeeded = false
        var isCallInvalidateIntrinsicContentSize = false
        var isCallExerciseAmbiguityInLayout = false
        var isCallSizeToFit = false
        var isCallEndEditing = false
        
        override func setNeedsLayout() {
            isCallSetNeedsLayout = true
            super.setNeedsLayout()
        }
        
        override func layoutIfNeeded() {
            isCallLayoutIfNeeded = true
            super.layoutIfNeeded()
        }
        
        override func setNeedsDisplay() {
            isCallSetNeedsDisplay = true
            super.setNeedsDisplay()
        }
        
        override func setNeedsDisplay(_ rect: CGRect) {
            isCallSetNeedsDisplay = true
            super.setNeedsDisplay(rect)
        }
        
        override func setNeedsUpdateConstraints() {
            isCallSetNeedsUpdateConstraints = true
            super.setNeedsUpdateConstraints()
        }
        
        override func updateConstraintsIfNeeded() {
            isCallUpdateConstraintsIfNeeded = true
            super.updateConstraintsIfNeeded()
        }
        
        override func setNeedsFocusUpdate() {
            isCallSetNeedsFocusUpdate = true
            super.setNeedsFocusUpdate()
        }
        
        override func updateFocusIfNeeded() {
            isCallUpdateFocusIfNeeded = true
            super.updateFocusIfNeeded()
        }
        
        override func invalidateIntrinsicContentSize() {
            isCallInvalidateIntrinsicContentSize = true
            super.invalidateIntrinsicContentSize()
        }
        
        override func exerciseAmbiguityInLayout() {
            isCallExerciseAmbiguityInLayout = true
            super.exerciseAmbiguityInLayout()
        }
        
        override func sizeToFit() {
            isCallSizeToFit = true
            super.sizeToFit()
        }
        
        override func endEditing(_ force: Bool) -> Bool {
            isCallEndEditing = true
            return super.endEditing(force)
        }
        
    }
    
    class TestDragInteractionDelegate: NSObject, UIDragInteractionDelegate {
        
        func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
            []
        }
        
    }
    
}
