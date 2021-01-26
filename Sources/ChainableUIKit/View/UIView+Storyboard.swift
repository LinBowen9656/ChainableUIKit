//
//  UIView+Storyboard.swift
//  
//
//  Created by 柴阿文 on 2021/1/26.
//

import UIKit

public extension UIView {
    
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
    @IBInspectable var isContinuous: Bool {
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
    @IBInspectable var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    static private var borderColorKey: String?
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = objc_getAssociatedObject(self, &UIView.borderColorKey) as? UIColor else {
                if let borderColor = layer.borderColor {
                    return UIColor(cgColor: borderColor)
                } else {
                    return nil
                }
            }
            return borderColor
        }
        set {
            objc_setAssociatedObject(self, &UIView.borderColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
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
    static private var borderShadowColorKey: String?
    @IBInspectable var borderShadowColor: UIColor? {
        get {
            guard let shadowColor = objc_getAssociatedObject(self, &UIView.borderShadowColorKey) as? UIColor else {
                if let shadowColor = layer.shadowColor {
                    return UIColor(cgColor: shadowColor)
                } else {
                    return nil
                }
            }
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
    
}
