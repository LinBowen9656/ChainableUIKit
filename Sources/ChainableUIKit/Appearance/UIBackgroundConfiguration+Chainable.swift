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
    func customView(_ view: UIView?) -> Self {
        var wrap = wrapped
        wrap.customView = view
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        var wrap = wrapped
        wrap.cornerRadius = radius
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func backgroundInsets(_ insets: NSDirectionalEdgeInsets) -> Self {
        var wrap = wrapped
        wrap.backgroundInsets = insets
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func edgesAddingLayoutMarginsToBackgroundInsets(_ edge: NSDirectionalRectEdge) -> Self {
        var wrap = wrapped
        wrap.edgesAddingLayoutMarginsToBackgroundInsets = edge
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor?) -> Self {
        var wrap = wrapped
        wrap.backgroundColor = color
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func backgroundColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        var wrap = wrapped
        wrap.backgroundColorTransformer = transformer
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func strokeColor(_ color: UIColor?) -> Self {
        var wrap = wrapped
        wrap.strokeColor = color
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func strokeColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        var wrap = wrapped
        wrap.strokeColorTransformer = transformer
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func strokeWidth(_ width: CGFloat) -> Self {
        var wrap = wrapped
        wrap.strokeWidth = width
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func strokeOutset(_ outset: CGFloat) -> Self {
        var wrap = wrapped
        wrap.strokeOutset = outset
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        if #available(iOS 15.0, *) {
            var wrap = wrapped
            wrap.image = image
            return ChainableWrapper(wrapped: wrap)
        } else {
            return self
        }
    }
    
    @discardableResult
    func imageContentMode(_ contentMode: UIView.ContentMode) -> Self {
        if #available(iOS 15.0, *) {
            var wrap = wrapped
            wrap.imageContentMode = contentMode
            return ChainableWrapper(wrapped: wrap)
        } else {
            return self
        }
    }
    
}
