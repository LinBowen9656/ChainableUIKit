//
//  UITabBarAppearance+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/6.
//

import UIKit

@available(iOS 13.0, *)
public extension ChainableWrapper where Wrapped: UITabBarAppearance {
    
    @discardableResult
    func stackedLayoutAppearance(_ appearance: UITabBarItemAppearance) -> Self {
        wrapped.stackedLayoutAppearance = appearance
        return self
    }
    
    @discardableResult
    func stackedItemPositioning(_ position: UITabBar.ItemPositioning) -> Self {
        wrapped.stackedItemPositioning = position
        return self
    }
    
    @discardableResult
    func stackedItemSpacing(_ spacing: CGFloat) -> Self {
        wrapped.stackedItemSpacing = spacing
        return self
    }
    
    @discardableResult
    func stackedItemWidth(_ spacing: CGFloat) -> Self {
        wrapped.stackedItemWidth = spacing
        return self
    }
    
    @discardableResult
    func inlineLayoutAppearance(_ appearance: UITabBarItemAppearance) -> Self {
        wrapped.inlineLayoutAppearance = appearance
        return self
    }
    
    @discardableResult
    func compactInlineLayoutAppearance(_ appearance: UITabBarItemAppearance) -> Self {
        wrapped.compactInlineLayoutAppearance = appearance
        return self
    }
    
    @discardableResult
    func selectionIndicatorTintColor(_ color: UIColor?) -> Self {
        wrapped.selectionIndicatorTintColor = color
        return self
    }
    
    @discardableResult
    func selectionIndicatorImage(_ image: UIImage?) -> Self {
        wrapped.selectionIndicatorImage = image
        return self
    }
    
}
