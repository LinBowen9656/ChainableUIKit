//
//  UINavigationBarAppearance+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

@available(iOS 13.0, *)
public extension ChainableWrapper where Wrapped: UINavigationBarAppearance {
    
    @discardableResult
    func titleTextAttributes(_ attributes: [NSAttributedString.Key : Any]) -> Self {
        wrapped.titleTextAttributes = attributes
        return self
    }
    
    @discardableResult
    func largeTitleTextAttributes(_ attributes: [NSAttributedString.Key : Any]) -> Self {
        wrapped.largeTitleTextAttributes = attributes
        return self
    }
    
    @discardableResult
    func titlePositionAdjustment(_ offset: UIOffset) -> Self {
        wrapped.titlePositionAdjustment = offset
        return self
    }
    
    @discardableResult
    func buttonAppearance(_ appearance: UIBarButtonItemAppearance) -> Self {
        wrapped.buttonAppearance = appearance
        return self
    }
    
    @discardableResult
    func backButtonAppearance(_ appearance: UIBarButtonItemAppearance) -> Self {
        wrapped.backButtonAppearance = appearance
        return self
    }
    
    @discardableResult
    func backIndicator(image: UIImage?, transitionMaskImage: UIImage?) -> Self {
        wrapped.setBackIndicatorImage(image, transitionMaskImage: transitionMaskImage)
        return self
    }
    
    @discardableResult
    func doneButtonAppearance(_ appearance: UIBarButtonItemAppearance) -> Self {
        wrapped.doneButtonAppearance = appearance
        return self
    }
    
}
