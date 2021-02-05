//
//  UINavigationController+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit
import UIKitUtils

public extension ChainableWrapper where Wrapped: UINavigationController {
    
    @discardableResult
    func pushViewController(_ controller: UIViewController, isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> Self {
        wrapped.pushViewController(controller, isAnimated: isAnimated, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func popViewController(isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> Self {
        wrapped.popViewController(isAnimated: isAnimated, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func popToViewController(_ controller: UIViewController, isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> Self {
        wrapped.popToViewController(controller, isAnimated: isAnimated, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func popToRootViewController(isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> Self {
        wrapped.popToRootViewController(isAnimated: isAnimated, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func viewControllers(_ controllers: [UIViewController], isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> Self {
        wrapped.setViewControllers(controllers, isAnimated: isAnimated, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func isNavigationBarHidden(_ value: Bool, isAnimated: Bool = true) -> Self {
        wrapped.setNavigationBarHidden(value, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func isToolbarHidden(_ value: Bool, isAnimated: Bool = true) -> Self {
        wrapped.setToolbarHidden(value, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func isHidesBarsOnTap(_ value: Bool) -> Self {
        wrapped.hidesBarsOnTap = value
        return self
    }
    
    @discardableResult
    func isHidesBarsOnSwipe(_ value: Bool) -> Self {
        wrapped.hidesBarsOnSwipe = value
        return self
    }
    
    @discardableResult
    func isHidesBarsWhenVerticallyCompact(_ value: Bool) -> Self {
        wrapped.hidesBarsWhenVerticallyCompact = value
        return self
    }
    
    @discardableResult
    func isHidesBarsWhenKeyboardAppears(_ value: Bool) -> Self {
        wrapped.hidesBarsWhenKeyboardAppears = value
        return self
    }
    
}
