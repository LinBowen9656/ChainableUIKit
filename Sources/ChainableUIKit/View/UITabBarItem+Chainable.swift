//
//  UITabBarItem+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

public extension ChainableWrapper where Wrapped: UITabBarItem {
    
    @available(iOS 13.0, *)
    @discardableResult
    func standardAppearance(_ appearance: UITabBarAppearance?) -> Self {
        wrapped.standardAppearance = appearance
        return self
    }
    
    @discardableResult
    func badgeValue(_ string: String?) -> Self {
        wrapped.badgeValue = string
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func titlePositionAdjustment(_ offset: UIOffset) -> Self {
        wrapped.titlePositionAdjustment = offset
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func selectedImage(_ image: UIImage?) -> Self {
        wrapped.selectedImage = image
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func badgeColor(_ color: UIColor?) -> Self {
        wrapped.badgeColor = color
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func badgeTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, state: UIControl.State) -> Self {
        wrapped.setBadgeTextAttributes(attributes, for: state)
        return self
    }
    
}
