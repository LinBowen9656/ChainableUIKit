//
//  UIBarAppearance+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

@available(iOS 13.0, *)
extension UIBarAppearance: ChainableType {}

@available(iOS 13.0, *)
public extension ChainableWrapper where Wrapped: UIBarAppearance {
    
    @discardableResult
    func configureWithDefaultBackground() -> Self {
        wrapped.configureWithDefaultBackground()
        return self
    }
    
    @discardableResult
    func configureWithOpaqueBackground() -> Self {
        wrapped.configureWithOpaqueBackground()
        return self
    }
    
    @discardableResult
    func configureWithTransparentBackground() -> Self {
        wrapped.configureWithTransparentBackground()
        return self
    }
    
    @discardableResult
    func backgroundEffect(_ effect: UIBlurEffect?) -> Self {
        wrapped.backgroundEffect = effect
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor?) -> Self {
        wrapped.backgroundColor = color
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?) -> Self {
        wrapped.backgroundImage = image
        return self
    }
    
    @discardableResult
    func backgroundImageContentMode(_ mode: UIView.ContentMode) -> Self {
        wrapped.backgroundImageContentMode = mode
        return self
    }
    
    @discardableResult
    func shadowColor(_ color: UIColor?) -> Self {
        wrapped.shadowColor = color
        return self
    }
    
    @discardableResult
    func shadowImage(_ image: UIImage?) -> Self {
        wrapped.shadowImage = image
        return self
    }
    
}
