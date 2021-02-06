//
//  UIBackgroundConfiguration+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/6.
//

import UIKit

@available(iOS 14.0, *)
extension UIBackgroundConfiguration: ChainableType {}

@available(iOS 14.0, *)
public extension ChainableWrapper where Wrapped == UIBackgroundConfiguration {
    
    @discardableResult
    mutating func customView(_ view: UIView?) -> Self {
        wrapped.customView = view
        return self
    }
    
    @discardableResult
    mutating func cornerRadius(_ radius: CGFloat) -> Self {
        wrapped.cornerRadius = radius
        return self
    }
    
    @discardableResult
    mutating func backgroundInsets(_ insets: NSDirectionalEdgeInsets) -> Self {
        wrapped.backgroundInsets = insets
        return self
    }
    
    @discardableResult
    mutating func edgesAddingLayoutMarginsToBackgroundInsets(_ edge: NSDirectionalRectEdge) -> Self {
        wrapped.edgesAddingLayoutMarginsToBackgroundInsets = edge
        return self
    }
    
    @discardableResult
    mutating func backgroundColor(_ color: UIColor?) -> Self {
        wrapped.backgroundColor = color
        return self
    }
    
    @discardableResult
    mutating func backgroundColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        wrapped.backgroundColorTransformer = transformer
        return self
    }
    
    @discardableResult
    mutating func strokeColor(_ color: UIColor?) -> Self {
        wrapped.strokeColor = color
        return self
    }
    
    @discardableResult
    mutating func strokeColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        wrapped.strokeColorTransformer = transformer
        return self
    }
    
    @discardableResult
    mutating func strokeWidth(_ width: CGFloat) -> Self {
        wrapped.strokeWidth = width
        return self
    }
    
    @discardableResult
    mutating func strokeOutset(_ outset: CGFloat) -> Self {
        wrapped.strokeOutset = outset
        return self
    }
    
}
