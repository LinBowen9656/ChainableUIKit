//
//  UIAlertController+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/6.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIAlertController {
    
    @resultBuilder
    struct AlertActionBuilder {
        
        public static func buildBlock(_ actions: UIAlertAction...) -> [UIAlertAction] { actions }
        
    }
    
    @discardableResult
    func addAction(@AlertActionBuilder builder: () -> [UIAlertAction]) -> Self {
        let actions = builder()
        actions.forEach { wrapped.addAction($0) }
        return self
    }
    
    @discardableResult
    func preferredAction(_ action: UIAlertAction?) -> Self {
        wrapped.preferredAction = action
        return self
    }
    
    @discardableResult
    func addTextField(configurationHandler: ((UITextField) -> Void)? = nil) -> Self {
        wrapped.addTextField(configurationHandler: configurationHandler)
        return self
    }
    
    @discardableResult
    func title(_ title: String?) -> Self {
        wrapped.title = title
        return self
    }
    
    @discardableResult
    func message(_ message: String?) -> Self {
        wrapped.message = message
        return self
    }
    
}
