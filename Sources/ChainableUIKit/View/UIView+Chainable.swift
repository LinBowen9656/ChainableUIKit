//
//  UIView+Chainable.swift
//
//
//  Created by 林博文 on 2020/8/3.
//

import UIKit
import UIKitUtils

extension UIView: ChainableType {}

public extension ChainableWrapper where Wrapped: UIView {
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        wrapped.cornerRadius = radius
        return self
    }
    
    @discardableResult
    func maskedCorners(_ corner: CACornerMask) -> Self {
        wrapped.layer.maskedCorners = corner
        return self
    }
    
    @discardableResult
    func borderStrokeWidth(_ width: CGFloat) -> Self {
        wrapped.borderStrokeWidth = width
        return self
    }
    
    @discardableResult
    func borderStrokeColor(_ color: UIColor?) -> Self {
        wrapped.borderStrokeColor = color
        return self
    }
    
    @discardableResult
    func shadowRadius(_ radius: CGFloat) -> Self {
        wrapped.borderShadowRadius = radius
        return self
    }
    
    @discardableResult
    func shadowColor(_ color: UIColor?) -> Self {
        wrapped.borderShadowColor = color
        return self
    }
    
    @discardableResult
    func shadowOpacity(_ opacity: Float) -> Self {
        wrapped.borderShadowOpacity = opacity
        return self
    }
    
    @discardableResult
    func tintColor(_ color: UIColor) -> Self {
        wrapped.tintColor = color
        return self
    }
    
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        wrapped.contentMode = mode
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor?) -> Self {
        wrapped.backgroundColor = color
        return self
    }
    
    @discardableResult
    func isContinuousCorners(_ isContinuous: Bool) -> Self {
        if #available(iOS 13, *) {
            wrapped.layer.cornerCurve = isContinuous ? .continuous : .circular
        } else {
            wrapped.layer.setValue(isContinuous, forKey: "continuousCorners")
        }
        return self
    }
    
    @discardableResult
    func isTranslatesAutoresizingMaskIntoConstraints(_ value: Bool) -> Self {
        wrapped.translatesAutoresizingMaskIntoConstraints = value
        return self
    }
    
    @discardableResult
    func addSubview(_ view: UIView) -> Self {
        wrapped.addSubview(view)
        return self
    }
    
    @discardableResult
    func bringSubviewToFront(_ view: UIView) -> Self {
        wrapped.bringSubviewToFront(view)
        return self
    }
    
    @discardableResult
    func sendSubviewToBack(_ view: UIView) -> Self {
        wrapped.sendSubviewToBack(view)
        return self
    }
    
    @discardableResult
    func removeFromSuperview() -> Self {
        wrapped.removeFromSuperview()
        return self
    }
    
    @discardableResult
    func insertSubview(_ view: UIView, atIndex: Int) -> Self {
        wrapped.insertSubview(view, at: atIndex)
        return self
    }
    
    @discardableResult
    func insertSubview(_ view: UIView, aboveSubview: UIView) -> Self {
        wrapped.insertSubview(view, aboveSubview: aboveSubview)
        return self
    }
    
    @discardableResult
    func insertSubview(_ view: UIView, belowSubview: UIView) -> Self {
        wrapped.insertSubview(view, belowSubview: belowSubview)
        return self
    }
    
    @discardableResult
    func exchangeSubview(_ index: Int, atIndex: Int) -> Self {
        wrapped.exchangeSubview(at: index, withSubviewAt: atIndex)
        return self
    }
    
    @discardableResult
    func addToSuperview(_ view: UIView) -> Self {
        view.addSubview(wrapped)
        return self
    }
    
    @discardableResult
    func removeSubview(_ view: UIView) -> Self {
        if view.superview == wrapped {
            view.removeFromSuperview()
        }
        return self
    }
    
    @discardableResult
    func directionalLayoutMargins(_ insets: NSDirectionalEdgeInsets) -> Self {
        wrapped.directionalLayoutMargins = insets
        return self
    }
    
    @discardableResult
    func layoutMargins(_ insets: UIEdgeInsets) -> Self {
        wrapped.layoutMargins = insets
        return self
    }
    
    @discardableResult
    func isPreservesSuperviewLayoutMargins(_ value: Bool) -> Self {
        wrapped.preservesSuperviewLayoutMargins = value
        return self
    }
    
    @discardableResult
    func isInsetsLayoutMarginsFromSafeArea(_ value: Bool) -> Self {
        wrapped.insetsLayoutMarginsFromSafeArea = value
        return self
    }
    
    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        wrapped.alpha = value
        return self
    }
    
    @discardableResult
    func addGestureRecognizer(_ gesture: UIGestureRecognizer) -> Self {
        wrapped.addGestureRecognizer(gesture)
        return self
    }
    
    @discardableResult
    func removeGestureRecognizer(_ gesture: UIGestureRecognizer) -> Self {
        wrapped.removeGestureRecognizer(gesture)
        return self
    }
    
    @discardableResult
    func onTap(handler: @escaping () -> Void) -> Self {
        wrapped.onTap(handler: handler)
        return self
    }
    
    @discardableResult
    func isHidden(_ value: Bool) -> Self {
        wrapped.isHidden = value
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ value: Bool) -> Self {
        wrapped.isUserInteractionEnabled = value
        return self
    }
    
    @discardableResult
    func isClipsToBounds(_ value: Bool) -> Self {
        wrapped.clipsToBounds = value
        return self
    }
    
    @discardableResult
    func tag(_ value: Int) -> Self {
        wrapped.tag = value
        return self
    }
    
    @discardableResult
    func frame(_ value: CGRect) -> Self {
        wrapped.frame = value
        return self
    }
    
    @discardableResult
    func bounds(_ value: CGRect) -> Self {
        wrapped.bounds = value
        return self
    }
    
    @discardableResult
    func size(_ value: CGSize) -> Self {
        wrapped.frame.size = value
        return self
    }
    
    @discardableResult
    func origin(_ point: CGPoint) -> Self {
        wrapped.frame.origin = point
        return self
    }
    
    @discardableResult
    func center(_ point: CGPoint) -> Self {
        wrapped.center = point
        return self
    }
    
    @discardableResult
    func transform(_ value: CGAffineTransform) -> Self {
        wrapped.transform = value
        return self
    }
    
    @discardableResult
    func setNeedsLayout() -> Self {
        wrapped.setNeedsLayout()
        return self
    }
    
    @discardableResult
    func layoutIfNeeded() -> Self {
        wrapped.layoutIfNeeded()
        return self
    }
    
    @_functionBuilder
    struct ConstraintsBuilder {
        
        public static func buildBlock(_ constraints: NSLayoutConstraint...) -> [NSLayoutConstraint] { constraints }
        
    }
    
    @discardableResult
    func layout(@ConstraintsBuilder builder: (UIView) -> [NSLayoutConstraint]) -> Self {
        wrapped.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(builder(wrapped))
        return self
    }
    
    @discardableResult
    func isOpaque(_ value: Bool) -> Self {
        wrapped.isOpaque = value
        return self
    }
    
    @discardableResult
    func tintAdjustmentMode(_ mode: UIView.TintAdjustmentMode) -> Self {
        wrapped.tintAdjustmentMode = mode
        return self
    }
    
    @discardableResult
    func maskView(_ view: UIView?) -> Self {
        wrapped.mask = view
        return self
    }
    
    @discardableResult
    func isMultipleTouchEnabled(_ value: Bool) -> Self {
        wrapped.isMultipleTouchEnabled = value
        return self
    }
    
    @discardableResult
    func isExclusiveTouch(_ value: Bool) -> Self {
        wrapped.isExclusiveTouch = value
        return self
    }
    
    @discardableResult
    func addConstraints(_ constraints: [NSLayoutConstraint]) -> Self {
        wrapped.addConstraints(constraints)
        return self
    }
    
    @discardableResult
    func removeConstraints(_ constraints: [NSLayoutConstraint]) -> Self {
        wrapped.removeConstraints(constraints)
        return self
    }
    
    @discardableResult
    func addLayoutGuide(_ layoutGuide: UILayoutGuide) -> Self {
        wrapped.addLayoutGuide(layoutGuide)
        return self
    }
    
    @discardableResult
    func removeLayoutGuide(_ layoutGuide: UILayoutGuide) -> Self {
        wrapped.removeLayoutGuide(layoutGuide)
        return self
    }
    
    @discardableResult
    func invalidateIntrinsicContentSize() -> Self {
        wrapped.invalidateIntrinsicContentSize()
        return self
    }
    
    @discardableResult
    func contentCompressionResistancePriority(_ priority: UILayoutPriority, axis: NSLayoutConstraint.Axis) -> Self {
        wrapped.setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func contentHuggingPriority(_ priority: UILayoutPriority, axis: NSLayoutConstraint.Axis) -> Self {
        wrapped.setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func setNeedsUpdateConstraints() -> Self {
        wrapped.setNeedsUpdateConstraints()
        return self
    }
    
    @discardableResult
    func updateConstraintsIfNeeded() -> Self {
        wrapped.updateConstraintsIfNeeded()
        return self
    }
    
    @discardableResult
    func exerciseAmbiguityInLayout() -> Self {
        wrapped.exerciseAmbiguityInLayout()
        return self
    }
    
    @discardableResult
    func sizeToFit() -> Self {
        wrapped.sizeToFit()
        return self
    }
    
    @discardableResult
    func isAutoresizesSubviews(_ value: Bool) -> Self {
        wrapped.autoresizesSubviews = value
        return self
    }
    
    @discardableResult
    func autoresizingMask(_ autoresizingMask: UIView.AutoresizingMask) -> Self {
        wrapped.autoresizingMask = autoresizingMask
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func overrideUserInterfaceStyle(_ style: UIUserInterfaceStyle) -> Self {
        wrapped.overrideUserInterfaceStyle = style
        return self
    }
    
    @discardableResult
    func semanticContentAttribute(_ attribute: UISemanticContentAttribute) -> Self {
        wrapped.semanticContentAttribute = attribute
        return self
    }
    
    @discardableResult
    func addInteraction(_ interaction: UIInteraction) -> Self {
        wrapped.addInteraction(interaction)
        return self
    }
    
    @discardableResult
    func removeLayoutGuide(_ interaction: UIInteraction) -> Self {
        wrapped.removeInteraction(interaction)
        return self
    }
    
    @discardableResult
    func setNeedsDisplay() -> Self {
        wrapped.setNeedsDisplay()
        return self
    }
    
    @discardableResult
    func setNeedsDisplay(_ rect: CGRect) -> Self {
        wrapped.setNeedsDisplay(rect)
        return self
    }
    
    @discardableResult
    func contentScaleFactor(_ factor: CGFloat) -> Self {
        wrapped.contentScaleFactor = factor
        return self
    }
    
    @discardableResult
    func addMotionEffect(_ effect: UIMotionEffect) -> Self {
        wrapped.addMotionEffect(effect)
        return self
    }
    
    @discardableResult
    func removeMotionEffect(_ effect: UIMotionEffect) -> Self {
        wrapped.removeMotionEffect(effect)
        return self
    }
    
    @discardableResult
    func restorationIdentifier(_ identifier: String?) -> Self {
        wrapped.restorationIdentifier = identifier
        return self
    }
    
    @discardableResult
    func endEditing(_ isForce: Bool) -> Self {
        wrapped.endEditing(isForce)
        return self
    }
    
    @discardableResult
    func isAccessibilityIgnoresInvertColors(_ value: Bool) -> Self {
        wrapped.accessibilityIgnoresInvertColors = value
        return self
    }
    
    @discardableResult
    func focusGroupIdentifier(_ identifier: String?) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.focusGroupIdentifier = identifier
        }
        return self
    }
    
    @discardableResult
    func largeContentImage(_ image: UIImage?) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.largeContentImage = image
        }
        return self
    }
    
    @discardableResult
    func largeContentImageInsets(_ insets: UIEdgeInsets) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.largeContentImageInsets = insets
        }
        return self
    }
    
    @discardableResult
    func largeContentTitle(_ title: String?) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.largeContentTitle = title
        }
        return self
    }
    
    @discardableResult
    func isScalesLargeContentImage(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.scalesLargeContentImage = value
        }
        return self
    }
    
    @discardableResult
    func isShowsLargeContentViewer(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.showsLargeContentViewer = value
        }
        return self
    }
    
    @discardableResult
    func transform3D(_ transform3D: CATransform3D) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.transform3D = transform3D
        }
        return self
    }
    
    @discardableResult
    func becomeFirstResponder() -> Self {
        wrapped.becomeFirstResponder()
        return self
    }
    
    @discardableResult
    func resignFirstResponder() -> Self {
        wrapped.resignFirstResponder()
        return self
    }
    
}
