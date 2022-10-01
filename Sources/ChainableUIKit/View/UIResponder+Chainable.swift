//
//  UIResponder+Chainable.swift
//  
//
//  Created by 林博文 on 2022/1/16.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIResponder {
    
    @discardableResult
    func becomeFirstResponder() -> Self {
        wrapped.becomeFirstResponder()
        return self
    }
    
    @discardableResult
    func resignFirstResponder() -> Self {
        wrapped.resignFirstResponder()
        return self
    }
    
}
