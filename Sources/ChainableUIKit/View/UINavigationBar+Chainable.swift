//
//  UINavigationBar+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

public extension ChainableWrapper where Wrapped: UINavigationBar {
    
    @discardableResult
    func prefersLargeTitles(_ value: Bool) -> Self {
        wrapped.prefersLargeTitles = value
        return self
    }
    
    @discardableResult
    func isTranslucent(_ value: Bool) -> Self {
        wrapped.isTranslucent = value
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func standardAppearance(_ appearance: UINavigationBarAppearance) -> Self {
        wrapped.standardAppearance = appearance
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func compactAppearance(_ appearance: UINavigationBarAppearance?) -> Self {
        wrapped.compactAppearance = appearance
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func scrollEdgeAppearance(_ appearance: UINavigationBarAppearance?) -> Self {
        wrapped.scrollEdgeAppearance = appearance
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func compactScrollEdgeAppearance(_ appearance: UINavigationBarAppearance?) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.compactScrollEdgeAppearance = appearance
        }
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
    func titleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?) -> Self {
        wrapped.titleTextAttributes = attributes
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func largeTitleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?) -> Self {
        wrapped.largeTitleTextAttributes = attributes
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func titleVerticalPositionAdjustment(_ offset: CGFloat, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setTitleVerticalPositionAdjustment(offset, for: barMetrics)
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func backIndicatorImage(_ image: UIImage?) -> Self {
        wrapped.backIndicatorImage = image
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func backIndicatorTransitionMaskImage(_ image: UIImage?) -> Self {
        wrapped.backIndicatorTransitionMaskImage = image
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
    func backgroundImage(_ image: UIImage?, position: UIBarPosition = .any, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setBackgroundImage(image, for: position, barMetrics: barMetrics)
        return self
    }
    
    @available(iOS, obsoleted: 13.0, message: "iOS 13.0以上请使用Appearance相关方法")
    @discardableResult
    func shadowImage(_ image: UIImage?) -> Self {
        wrapped.shadowImage = image
        return self
    }
    
}
