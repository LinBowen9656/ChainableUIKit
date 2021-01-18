//
//  UIView+Chainable.swift
//
//
//  Created by 林博文 on 2020/8/3.
//

import UIKit

extension UIView: ChainableType {}

public extension ChainableWrapper where Wrapped: UIView {
    
    var view: Wrapped { wrapped }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        wrapped.layer.cornerRadius = radius
        return self
    }
    
    @discardableResult
    func maskedCorners(_ corner: CACornerMask) -> Self {
        wrapped.layer.maskedCorners = corner
        return self
    }
    
    @discardableResult
    func borderWidth(_ width: CGFloat) -> Self {
        wrapped.layer.borderWidth = width
        return self
    }
    
    @discardableResult
    func borderColor(_ color: UIColor) -> Self {
        wrapped.layer.borderColor = color.cgColor
        return self
    }
    
    @discardableResult
    func shadowRadius(_ radius: CGFloat) -> Self {
        wrapped.layer.shadowRadius = radius
        return self
    }
    
    @discardableResult
    func shadowColor(_ color: UIColor?) -> Self {
        wrapped.layer.shadowColor = color?.cgColor
        return self
    }
    
    @discardableResult
    func shadowOpacity(_ opacity: Float) -> Self {
        wrapped.layer.shadowOpacity = opacity
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
    func backgroundColor(_ color: UIColor) -> Self {
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
    func alpha(_ value: CGFloat) -> Self {
        wrapped.alpha = value
        return self
    }
    
    @discardableResult
    func addGesture(_ gesture: UIGestureRecognizer) -> Self {
        wrapped.addGestureRecognizer(gesture)
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
    func isClipToBounds(_ value: Bool) -> Self {
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
        
        static func buildBlock(_ constraints: NSLayoutConstraint...) -> [NSLayoutConstraint] { constraints }
        
    }
    
    @discardableResult
    func layout(@ConstraintsBuilder handler: (UIView) -> [NSLayoutConstraint]) -> Self {
        wrapped.translatesAutoresizingMaskIntoConstraints = true
        NSLayoutConstraint.activate(handler(wrapped))
        return self
    }
    
    func asType<T>(type: T.Type) -> ChainableWrapper<T> { ChainableWrapper(wrapped: wrapped as! T) }
    
}
