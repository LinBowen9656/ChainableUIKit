//
//  UIContextualAction+Chainable.swift
//  
//
//  Created by 林博文 on 2021/11/18.
//

import UIKit

extension UIContextualAction: ChainableType {}

public extension ChainableWrapper where Wrapped: UIContextualAction {
    
    @discardableResult
    func title(_ title: String?) -> Self {
        wrapped.title = title
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        wrapped.backgroundColor = color
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        wrapped.image = image
        return self
    }
    
}
