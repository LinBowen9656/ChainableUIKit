//
//  UIToolbarAppearance+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/6.
//

import UIKit

@available(iOS 13.0, *)
public extension ChainableWrapper where Wrapped: UIToolbarAppearance {
    
    @discardableResult
    func buttonAppearance(_ appearance: UIBarButtonItemAppearance) -> Self {
        wrapped.buttonAppearance = appearance
        return self
    }
    
    @discardableResult
    func doneButtonAppearance(_ appearance: UIBarButtonItemAppearance) -> Self {
        wrapped.doneButtonAppearance = appearance
        return self
    }
    
}
