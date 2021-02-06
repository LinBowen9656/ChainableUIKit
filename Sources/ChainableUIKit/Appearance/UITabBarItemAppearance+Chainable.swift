//
//  UITabBarItemAppearance+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/6.
//

import UIKit

@available(iOS 13.0, *)
extension UITabBarItemAppearance: ChainableType {}

@available(iOS 13.0, *)
public extension ChainableWrapper where Wrapped: UITabBarItemAppearance {
    
    @discardableResult
    func defaultStyle(_ style: UITabBarItemAppearance.Style) -> Self {
        wrapped.configureWithDefault(for: style)
        return self
    }
    
}
