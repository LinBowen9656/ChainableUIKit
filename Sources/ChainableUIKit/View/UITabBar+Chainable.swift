//
//  UITabBar+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

public extension ChainableWrapper where Wrapped: UITabBar {
    
    @discardableResult
    func isTranslucent(_ value: Bool) -> Self {
        wrapped.isTranslucent = value
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func standardAppearance(_ appearance: UITabBarAppearance) -> Self {
        wrapped.standardAppearance = appearance
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func barStyle(_ style: UIBarStyle) -> Self {
        wrapped.barStyle = style
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func barTintColor(_ color: UIColor?) -> Self {
        wrapped.barTintColor = color
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func itemPositioning(_ position: UITabBar.ItemPositioning) -> Self {
        wrapped.itemPositioning = position
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func itemSpacing(_ spacing: CGFloat) -> Self {
        wrapped.itemSpacing = spacing
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func itemWidth(_ width: CGFloat) -> Self {
        wrapped.itemWidth = width
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func unselectedItemTintColor(_ color: UIColor?) -> Self {
        wrapped.unselectedItemTintColor = color
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func selectionIndicatorImage(_ image: UIImage?) -> Self {
        wrapped.selectionIndicatorImage = image
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func backgroundImage(_ image: UIImage?) -> Self {
        wrapped.backgroundImage = image
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func shadowImage(_ image: UIImage?) -> Self {
        wrapped.shadowImage = image
        return self
    }
    
}
