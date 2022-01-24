//
//  UIBarButtonItemAppearance+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/6.
//

import UIKit

@available(iOS 13.0, *)
extension UIBarButtonItemAppearance: ChainableType {}

@available(iOS 13.0, *)
public extension ChainableWrapper where Wrapped: UIBarButtonItemAppearance {
    
    @discardableResult
    func defaultStyle(_ style: UIBarButtonItem.Style) -> Self {
        wrapped.configureWithDefault(for: style)
        return self
    }
    
}
