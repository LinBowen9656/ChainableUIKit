//
//  UIControl+Chainable.swift
//
//
//  Created by 林博文 on 2020/8/4.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIControl {
    
    @discardableResult
    func addTarget(target: Any?, action: Selector, event: UIControl.Event) -> Self {
        wrapped.addTarget(target, action: action, for: event)
        return self
    }
    
    @discardableResult
    func removeTarget(target: Any?, action: Selector, event: UIControl.Event) -> Self {
        wrapped.removeTarget(target, action: action, for: event)
        return self
    }
    
    @discardableResult
    func isEnabled(_ value: Bool) -> Self {
        wrapped.isEnabled = value
        return self
    }
    
    @discardableResult
    func isSelected(_ value: Bool) -> Self {
        wrapped.isSelected = value
        return self
    }
    
    @discardableResult
    func isHighlighted(_ value: Bool) -> Self {
        wrapped.isHighlighted = value
        return self
    }
    
    @discardableResult
    func contentVerticalAlignment(_ value: UIControl.ContentVerticalAlignment) -> Self {
        wrapped.contentVerticalAlignment = value
        return self
    }
    
    @discardableResult
    func contentHorizontalAlignment(_ value: UIControl.ContentHorizontalAlignment) -> Self {
        wrapped.contentHorizontalAlignment = value
        return self
    }
    
    @discardableResult
    func addActionHandler(event: UIControl.Event, handler: @escaping (Wrapped) -> Void) -> Self {
        wrapped.addActionHandler(event: event) { control in
            handler(control as! Wrapped)
        }
        return self
    }
    
    @discardableResult
    func removeActionHandler(event: UIControl.Event) -> Self {
        wrapped.removeActionHandler(event: event)
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func addAction(_ action: UIAction, event: UIControl.Event) -> Self {
        wrapped.addAction(action, for: event)
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func removeAction(_ action: UIAction, event: UIControl.Event) -> Self {
        wrapped.removeAction(action, for: event)
        return self
    }
    
}
