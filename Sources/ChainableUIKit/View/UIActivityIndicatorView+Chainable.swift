//
//  UIActivityIndicatorView+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIActivityIndicatorView {
    
    @discardableResult
    func hidesWhenStop(_ value: Bool) -> Self {
        wrapped.hidesWhenStopped = value
        return self
    }
    
    @discardableResult
    func isAnimating(_ value: Bool) -> Self {
        if value {
            wrapped.startAnimating()
        } else {
            wrapped.stopAnimating()
        }
        return self
    }
    
    @discardableResult
    func style(_ style: UIActivityIndicatorView.Style) -> Self {
        wrapped.style = style
        return self
    }
    
    @discardableResult
    func color(_ color: UIColor) -> Self {
        wrapped.color = color
        return self
    }
    
}
