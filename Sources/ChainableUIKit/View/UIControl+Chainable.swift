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
    
}
