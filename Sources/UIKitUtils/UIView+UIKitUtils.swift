//
//  UIView+UIKitUtils.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

public extension UIView {
    
    /// 视图所在的ViewController
    var responderViewController: UIViewController? {
        for tempView in sequence(first: self, next: { $0.superview }) {
            if let responder = tempView.next as? UIViewController {
                return responder
            }
        }
        return nil
    }
    /// 是否正在显示
    var isVisible: Bool {
        guard let window = window else { return false }
        let viewFrame = window.convert(frame, from: superview)
        let screenFrame = window.bounds
        guard viewFrame.intersects(screenFrame) else { return false }
        for view in sequence(first: self, next: { $0.superview }) where view.isHidden || view.alpha == 0 {
            return false
        }
        return true
    }
    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    @IBInspectable private var maskedCornersArray: CGRect {
        get {
            CGRect(x: layer.maskedCorners.contains(.layerMinXMinYCorner) ? 1 : 0, y: layer.maskedCorners.contains(.layerMaxXMinYCorner) ? 1 : 0, width: layer.maskedCorners.contains(.layerMinXMaxYCorner) ? 1 : 0, height: layer.maskedCorners.contains(.layerMaxXMaxYCorner) ? 1 : 0)
        }
        set {
            var maskedCorners: CACornerMask = []
            if newValue.origin.x > 0 {
                maskedCorners.insert(.layerMinXMinYCorner)
            }
            if newValue.origin.y > 0 {
                maskedCorners.insert(.layerMaxXMinYCorner)
            }
            if newValue.size.width > 0 {
                maskedCorners.insert(.layerMinXMaxYCorner)
            }
            if newValue.size.height > 0 {
                maskedCorners.insert(.layerMaxXMaxYCorner)
            }
            layer.maskedCorners = maskedCorners
        }
    }
    @IBInspectable var isCornerContinuous: Bool {
        get {
            if #available(iOS 13.0, *) {
                return layer.cornerCurve == .continuous
            } else {
                return layer.value(forKey: "continuousCorners") as? Bool ?? false
            }
        }
        set {
            if #available(iOS 13, *) {
                layer.cornerCurve = newValue ? .continuous : .circular
            } else {
                layer.setValue(newValue, forKey: "continuousCorners")
            }
        }
    }
    @IBInspectable var borderStrokeWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    static private var borderStrokeColorKey: Void?
    @IBInspectable var borderStrokeColor: UIColor? {
        get {
            guard let borderColor = objc_getAssociatedObject(self, &UIView.borderStrokeColorKey) as? UIColor else { return nil }
            return borderColor
        }
        set {
            objc_setAssociatedObject(self, &UIView.borderStrokeColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if #available(iOS 13.0, *) {
                layer.borderColor = newValue?.resolvedColor(with: traitCollection).cgColor
            } else {
                layer.borderColor = newValue?.cgColor
            }
        }
    }
    @IBInspectable var borderShadowRadius: CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    static private var borderShadowColorKey: Void?
    @IBInspectable var borderShadowColor: UIColor? {
        get {
            guard let shadowColor = objc_getAssociatedObject(self, &UIView.borderShadowColorKey) as? UIColor else { return nil }
            return shadowColor
        }
        set {
            objc_setAssociatedObject(self, &UIView.borderShadowColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if #available(iOS 13.0, *) {
                layer.shadowColor = newValue?.resolvedColor(with: traitCollection).cgColor
            } else {
                layer.shadowColor = newValue?.cgColor
            }
        }
    }
    @IBInspectable var borderShadowOpacity: Float {
        get { layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    @IBInspectable var borderShadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    @IBInspectable private var translationTransform: CGPoint {
        get { .zero }
        set { transform = transform.translatedBy(x: newValue.x, y: newValue.y)  }
    }
    @IBInspectable private var scaleTransform: CGPoint {
        get { .zero }
        set { transform = transform.scaledBy(x: newValue.x, y: newValue.y)  }
    }
    @IBInspectable private var rotatedTransform: CGFloat {
        get { 0 }
        set { transform = transform.rotated(by: newValue) }
    }
    
    /// 获取UIView特定标识符的约束
    ///
    /// - Parameter identifier: 标识符
    /// - Returns: 筛选后的约束
    func constraintWithIdentifier(identifier: String) -> [NSLayoutConstraint] {
        constraints.filter { $0.identifier == identifier }
    }
    
    /// 获取UIView特定类型父视图
    /// - Parameter type: 父视图的类型
    /// - Returns: 父视图
    func superview<T: UIView>(type: T.Type) -> T? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let typeView = view as? T {
                return typeView
            }
        }
        return nil
    }
    
}
