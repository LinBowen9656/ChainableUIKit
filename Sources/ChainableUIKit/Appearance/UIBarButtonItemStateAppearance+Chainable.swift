//
//  UIBarButtonItemStateAppearance+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/6.
//

import UIKit

@available(iOS 13.0, *)
extension UIBarButtonItemStateAppearance: ChainableType {}

@available(iOS 13.0, *)
public extension ChainableWrapper where Wrapped: UIBarButtonItemStateAppearance {
    
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
    func backgroundImage(_ image: UIImage?) -> Self {
        wrapped.backgroundImage = image
        return self
    }
    
    @discardableResult
    func backgroundImagePositionAdjustment(_ offset: UIOffset) -> Self {
        wrapped.backgroundImagePositionAdjustment = offset
        return self
    }
    
}
