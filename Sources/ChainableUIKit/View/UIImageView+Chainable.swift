//
//  UIImageView+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/1/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIImageView {
    
    @discardableResult
    func image(_ value: UIImage?) -> Self {
        wrapped.image = value
        return self
    }
    
    @discardableResult
    func highlightedImage(_ value: UIImage?) -> Self {
        wrapped.highlightedImage = value
        return self
    }
    
    @discardableResult
    func animationImages(_ value: [UIImage]?) -> Self {
        wrapped.animationImages = value
        return self
    }
    
    @discardableResult
    func highlightedAnimationImages(_ value: [UIImage]?) -> Self {
        wrapped.highlightedAnimationImages = value
        return self
    }
    
    @discardableResult
    func animationDuration(_ time: TimeInterval) -> Self {
        wrapped.animationDuration = time
        return self
    }
    
    @discardableResult
    func animationRepeatCount(_ count: Int) -> Self {
        wrapped.animationRepeatCount = count
        return self
    }
    
    @discardableResult
    func isHighlighted(_ value: Bool) -> Self {
        wrapped.isHighlighted = value
        return self
    }
    
}
