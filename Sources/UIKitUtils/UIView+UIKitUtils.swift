//
//  UIView+UIKitUtils.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

private var tapGestureRecognizerKey: Void?

public extension UIView {
    
    /// Get the controller of the view.
    var responderViewController: UIViewController? {
        for tempView in sequence(first: self, next: { $0.superview }) {
            if let responder = tempView.next as? UIViewController {
                return responder
            }
        }
        return nil
    }
    /// A Boolean value that indicates whether the view visible.
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
    /// The radius to use when drawing rounded corners for the background.
    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    /// Interface Builder property to set `maskedCorners`.
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
    /// Defines the curve used for rendering the rounded corners.
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
    /// Set the border line width.
    @IBInspectable var borderStrokeWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    static private var borderStrokeColorKey: Void?
    /// Set the border line color.
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
    /// Set the shadow radius.
    @IBInspectable var borderShadowRadius: CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    static private var borderShadowColorKey: Void?
    /// Set the shadow color.
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
    /// Set the shadow opacity.
    @IBInspectable var borderShadowOpacity: Float {
        get { layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    /// Set the shadow offset.
    @IBInspectable var borderShadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    /// Interface Builder property to set `transform`.
    @IBInspectable private var translationTransform: CGPoint {
        get { .zero }
        set { transform = transform.translatedBy(x: newValue.x, y: newValue.y)  }
    }
    /// Interface Builder property to set `transform`.
    @IBInspectable private var scaleTransform: CGPoint {
        get { .zero }
        set { transform = transform.scaledBy(x: newValue.x, y: newValue.y)  }
    }
    /// Interface Builder property to set `transform`.
    @IBInspectable private var rotatedTransform: CGFloat {
        get { 0 }
        set { transform = transform.rotated(by: newValue) }
    }
    private var tapGestureRecognizer: UITapGestureRecognizer {
        guard let gesture = objc_getAssociatedObject(self, &tapGestureRecognizerKey) as? UITapGestureRecognizer else {
            let gesture = UITapGestureRecognizer()
            objc_setAssociatedObject(self, &tapGestureRecognizerKey, gesture, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return gesture
        }
        return gesture
    }
    
    /// Adds an action to perform when this view recognizes a tap gesture.
    /// - Parameter handler: The action to perform.
    func onTap(handler: (() -> Void)?) {
        if let handler = handler {
            if tapGestureRecognizer.view != self {
                addGestureRecognizer(tapGestureRecognizer)
            }
            tapGestureRecognizer.addActionHandler { _ in
                handler()
            }
        } else {
            removeGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    /// Get the constraints with the identifier in view.
    /// - Parameter identifier: The identifier of constraint
    /// - Returns: The constraints with the identifier in view.
    func constraints(with identifier: String) -> [NSLayoutConstraint] {
        constraints.filter { $0.identifier == identifier }
    }
    
    /// Get the superview of the specified type.
    /// - Parameter type: Superview's type.
    /// - Returns: The superview of the specified type.
    func superview<T: UIView>(type: T.Type) -> T? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let typeView = view as? T {
                return typeView
            }
        }
        return nil
    }
    
    enum AnimationHelper {
        
        /// Retrieves the target offset at which to stop scrolling.
        /// - Parameters:
        ///   - initialVelocity: The current scrolling velocity.
        ///   - decelerationRate: A floating-point value that determines the rate of deceleration after the user lifts their finger.
        /// - Returns: The target offset.
        public static func targetOffset(initialVelocity: CGFloat, decelerationRate: CGFloat) -> CGFloat {
            (initialVelocity / 1000) * decelerationRate / (1 - decelerationRate)
        }
        
        /// Calculate the rubber-banding effect.
        /// - Parameters:
        ///   - from: The initial offset of the effect.
        ///   - to: The ultimate offset of the effect.
        ///   - offset: The Current offset from the initial offset.
        ///   - coefficient: Coefficient, default Value is 0.55.
        /// - Returns: The offset with the rubber-banding effect. The range of values is greater than zero.
        public static func bounce(from: CGFloat, to: CGFloat, offset: CGFloat, coefficient: CGFloat = 0.55) -> CGFloat {
            from + to + 1 - (1 / (coefficient * offset / to + 1)) * to
        }
        
        /// The interpolation of the animation.
        /// - Parameters:
        ///   - from: Defines the value the receiver uses to start interpolation.
        ///   - to: Defines the value the receiver uses to end interpolation.
        ///   - ease: The easing function.
        /// - Returns: The value at the given time.
        public static func interpolation(from: CGFloat, to: CGFloat, ease: Ease) -> CGFloat {
            (to - from) * ease.interpolation + from
        }
        
        public enum Ease {
            
            case linear(time: CGFloat)
            case easeInSine(time: CGFloat)
            case easeOutSine(time: CGFloat)
            case easeInOutSine(time: CGFloat)
            case easeInQuad(time: CGFloat)
            case easeOutQuad(time: CGFloat)
            case easeInOutQuad(time: CGFloat)
            case easeInCubic(time: CGFloat)
            case easeOutCubic(time: CGFloat)
            case easeInOutCubic(time: CGFloat)
            case easeInQuart(time: CGFloat)
            case easeOutQuart(time: CGFloat)
            case easeInOutQuart(time: CGFloat)
            case easeInQuint(time: CGFloat)
            case easeOutQuint(time: CGFloat)
            case easeInOutQuint(time: CGFloat)
            case easeInExpo(time: CGFloat)
            case easeOutExpo(time: CGFloat)
            case easeInOutExpo(time: CGFloat)
            case easeInCirc(time: CGFloat)
            case easeOutCirc(time: CGFloat)
            case easeInOutCirc(time: CGFloat)
            case easeInBack(time: CGFloat)
            case easeOutBack(time: CGFloat)
            case easeInOutBack(time: CGFloat)
            case easeInElastic(time: CGFloat)
            case easeOutElastic(time: CGFloat)
            case easeInOutElastic(time: CGFloat)
            case easeInBounce(time: CGFloat)
            case easeOutBounce(time: CGFloat)
            case easeInOutBounce(time: CGFloat)
            case spring(time: CGFloat, mass: CGFloat = 1, damping: CGFloat = 18, stiffness: CGFloat = 82, initialVelocity: CGFloat = 0)
            
            var interpolation: CGFloat {
                switch self {
                case .linear(let time):
                    return time
                case .easeInSine(let time):
                    return 1 - cos(time * (.pi / 2))
                case .easeOutSine(let time):
                    return sin(time * (.pi / 2))
                case .easeInOutSine(let time):
                    return -(cos(.pi * time) - 1) / 2
                case .easeInQuad(let time):
                    return pow(time, 2)
                case .easeOutQuad(let time):
                    return 1 - pow(1 - time, 2)
                case .easeInOutQuad(let time):
                    return time < 0.5 ? (2 * pow(time, 2)) : (1 - pow(-2 * time + 2, 2) / 2)
                case .easeInCubic(let time):
                    return pow(time, 3)
                case .easeOutCubic(let time):
                    return 1 - pow(1 - time, 3)
                case .easeInOutCubic(let time):
                    return time < 0.5 ? (4 * pow(time, 3)) : (1 - pow(-2 * time + 2, 3) / 2)
                case .easeInQuart(let time):
                    return pow(time, 4)
                case .easeOutQuart(let time):
                    return 1 - pow(1 - time, 4)
                case .easeInOutQuart(let time):
                    return time < 0.5 ? (8 * pow(time, 4)) : (1 - pow(-2 * time + 2, 4) / 2)
                case .easeInQuint(let time):
                    return pow(time, 5)
                case .easeOutQuint(let time):
                    return 1 - pow(1 - time, 5)
                case .easeInOutQuint(let time):
                    return time < 0.5 ? (16 * pow(time, 5)) : (1 - pow(-2 * time + 2, 5) / 2)
                case .easeInExpo(let time):
                    return time == 0 ? 0 : pow(2, 10 * time - 10)
                case .easeOutExpo(let time):
                    return time == 1 ? 1 : 1 - pow(2, -10 * time)
                case .easeInOutExpo(let time):
                    return time == 0 ? 0 : time == 1 ? 1 : time < 0.5 ? pow(2, 20 * time - 10) / 2 : (2 - pow(2, -20 * time + 10)) / 2
                case .easeInCirc(let time):
                    return 1 - sqrt(1 - pow(time, 2))
                case .easeOutCirc(let time):
                    return sqrt(1 - pow(time - 1, 2))
                case .easeInOutCirc(let time):
                    return time < 0.5 ? (1 - sqrt(1 - pow(2 * time, 2))) / 2 : (sqrt(1 - pow(-2 * time + 2, 2)) + 1) / 2
                case .easeInBack(let time):
                    return pow(time, 3) - time * sin(time * .pi)
                case .easeOutBack(let time):
                    return 1 - (pow(1 - time, 3) - (1 - time) * sin((1 - time) * .pi))
                case .easeInOutBack(let time):
                    if time < 0.5 {
                        return 0.5 * (pow(2 * time, 3) - 2 * time * sin(2 * time * .pi))
                    } else {
                        return 0.5 * (1 - (pow(1 - (2 * time - 1), 3) - (1 - (2 * time - 1)) * sin((1 - (2 * time - 1)) * .pi))) + 0.5
                    }
                case .easeInElastic(let time):
                    return sin(13 * (.pi / 2) * time) * pow(2, 10 * (time - 1))
                case .easeOutElastic(let time):
                    return sin(-13 * (.pi / 2) * (time + 1)) * pow(2, -10 * time) + 1
                case .easeInOutElastic(let time):
                    if time < 0.5 {
                        return 0.5 * sin(13 * (.pi / 2) * (2 * time)) * pow(2, 10 * ((2 * time) - 1))
                    } else {
                        return 0.5 * (sin(-13 * (.pi / 2) * ((2 * time - 1) + 1)) * pow(2, -10 * (2 * time - 1)) + 2)
                    }
                case .easeInBounce(let time):
                    return 1 - Self.easeOutBounce(time: 1 - time).interpolation
                case .easeOutBounce(let time):
                    if time < 4 / 11 {
                        return (121 * time * time) / 16
                    } else if time < 8 / 11 {
                        return (363 / 40 * time * time) - (99 / 10 * time) + 17 / 5
                    } else if time < 9 / 10 {
                        return (4356 / 361 * time * time) - (35442 / 1805 * time) + 16061 / 1805
                    } else {
                        return (54 / 5 * time * time) - (513 / 25 * time) + 268 / 25
                    }
                case .easeInOutBounce(let time):
                    if time < 0.5 {
                        return 0.5 * Self.easeInBounce(time: 2 * time).interpolation
                    } else {
                        return 0.5 * Self.easeOutBounce(time: 2 * time - 1).interpolation + 0.5
                    }
                case .spring(let time, let mass, let damping, let stiffness, let initialVelocity):
                    let w0 = sqrt(stiffness / mass)
                    let zeta = damping / (2 * sqrt(stiffness * mass))
                    if zeta < 1 {
                        let wd = w0 * sqrt(1 - zeta * zeta)
                        let b = (zeta * w0 + -initialVelocity) / wd
                        return 1 - (exp(-time * zeta * w0) * (cos(wd * time) + b * sin(wd * time)))
                    } else {
                        let b = -initialVelocity + w0
                        return 1 - (1 + b * time) * exp(-time * w0)
                    }
                }
            }
            
        }
        
    }
    
}
