//
//  UITabBarItemStateAppearance+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/6.
//

import UIKit

@available(iOS 13.0, *)
extension UITabBarItemStateAppearance: ChainableType {}

@available(iOS 13.0, *)
public extension ChainableWrapper where Wrapped: UITabBarItemStateAppearance {
    
    @discardableResult
    func titleTextAttributes(_ attributes: [NSAttributedString.Key : Any]) -> Self {
        wrapped.titleTextAttributes = attributes
        return self
    }
    
    @discardableResult
    func titlePositionAdjustment(_ offset: UIOffset) -> Self {
        wrapped.titlePositionAdjustment = offset
        return self
    }
    
    @discardableResult
    func iconColor(_ color: UIColor?) -> Self {
        wrapped.iconColor = color
        return self
    }
    
    @discardableResult
    func badgeTextAttributes(_ attributes: [NSAttributedString.Key : Any]) -> Self {
        wrapped.badgeTextAttributes = attributes
        return self
    }
    
    @discardableResult
    func badgeBackgroundColor(_ color: UIColor?) -> Self {
        wrapped.badgeBackgroundColor = color
        return self
    }
    
    @discardableResult
    func badgeTitlePositionAdjustment(_ offset: UIOffset) -> Self {
        wrapped.badgeTitlePositionAdjustment = offset
        return self
    }
    
    @discardableResult
    func badgePositionAdjustment(_ offset: UIOffset) -> Self {
        wrapped.badgePositionAdjustment = offset
        return self
    }
    
}
