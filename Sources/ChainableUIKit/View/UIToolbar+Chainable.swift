//
//  UIToolbar+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIToolbar {
    
    @discardableResult
    func items(_ items: [UIBarButtonItem]?, isAnimated: Bool = false) -> Self {
        wrapped.setItems(items, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func isTranslucent(_ value: Bool) -> Self {
        wrapped.isTranslucent = value
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func standardAppearance(_ appearance: UIToolbarAppearance) -> Self {
        wrapped.standardAppearance = appearance
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func compactAppearance(_ appearance: UIToolbarAppearance?) -> Self {
        wrapped.compactAppearance = appearance
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
    func backgroundImage(_ image: UIImage?, position: UIBarPosition, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setBackgroundImage(image, forToolbarPosition: position, barMetrics: barMetrics)
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func shadowImage(_ image: UIImage?, position: UIBarPosition) -> Self {
        wrapped.setShadowImage(image, forToolbarPosition: position)
        return self
    }
    
}
