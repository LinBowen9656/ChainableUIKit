//
//  UIGestureRecognizer+Chainable.swift
//
//
//  Created by 林博文 on 2020/8/4.
//

import UIKit

extension UIGestureRecognizer: ChainableType {}

public extension ChainableWrapper where Wrapped: UIGestureRecognizer {
    
    @discardableResult
    func state(_ state: UIGestureRecognizer.State) -> Self {
        wrapped.state = state
        return self
    }
    
    @discardableResult
    func requireToFail(_ gesture: UIGestureRecognizer) -> Self {
        wrapped.require(toFail: gesture)
        return self
    }
    
    @discardableResult
    func isEnabled(_ value: Bool) -> Self {
        wrapped.isEnabled = value
        return self
    }
    
    @discardableResult
    func cancelsTouchesInView(_ value: Bool) -> Self {
        wrapped.cancelsTouchesInView = value
        return self
    }
    
    @discardableResult
    func delaysTouchesBegan(_ value: Bool) -> Self {
        wrapped.delaysTouchesBegan = value
        return self
    }
    
    @discardableResult
    func delaysTouchesEnded(_ value: Bool) -> Self {
        wrapped.delaysTouchesEnded = value
        return self
    }
    
    @discardableResult
    func allowedPressTypes(_ types: [UIPress.PressType]) -> Self {
        wrapped.allowedPressTypes = types.map { NSNumber(value: $0.rawValue) }
        return self
    }
    
    @discardableResult
    func allowedTouchTypes(_ types: [UITouch.TouchType]) -> Self {
        wrapped.allowedTouchTypes = types.map { NSNumber(value: $0.rawValue) }
        return self
    }
    
    @discardableResult
    func requiresExclusiveTouchType(_ value: Bool) -> Self {
        wrapped.requiresExclusiveTouchType = value
        return self
    }
    
    @discardableResult
    func addTarget(target: Any, action: Selector) -> Self {
        wrapped.addTarget(target, action: action)
        return self
    }
    
    @discardableResult
    func removeTarget(target: Any?, action: Selector?) -> Self {
        wrapped.removeTarget(target, action: action)
        return self
    }
    
    @discardableResult
    func addActionHandler(_ handler: @escaping (Wrapped) -> Void) -> Self {
        wrapped.addActionHandler { gestureRecognizer in
            handler(gestureRecognizer as! Wrapped)
        }
        return self
    }
    
    @discardableResult
    func removeActionHandler() -> Self {
        wrapped.removeActionHandler()
        return self
    }
    
}
