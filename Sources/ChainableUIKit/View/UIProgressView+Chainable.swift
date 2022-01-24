//
//  UIProgressView+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIProgressView {
    
    @discardableResult
    func progress(_ value: Float, isAnimated: Bool = false) -> Self {
        wrapped.setProgress(value, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func observedProgress(_ progress: Progress?) -> Self {
        wrapped.observedProgress = progress
        return self
    }
    
    @discardableResult
    func progressViewStyle(_ style: UIProgressView.Style) -> Self {
        wrapped.progressViewStyle = style
        return self
    }
    
    @discardableResult
    func progressImage(_ image: UIImage?) -> Self {
        wrapped.progressImage = image
        return self
    }
    
    @discardableResult
    func trackImage(_ image: UIImage?) -> Self {
        wrapped.trackImage = image
        return self
    }
    
    @discardableResult
    func progressTintColor(_ color: UIColor?) -> Self {
        wrapped.progressTintColor = color
        return self
    }
    
    @discardableResult
    func trackTintColor(_ color: UIColor?) -> Self {
        wrapped.trackTintColor = color
        return self
    }
    
}
