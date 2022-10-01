//
//  UISwipeActionsConfiguration+Chainable.swift
//  
//
//  Created by 林博文 on 2021/11/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UISwipeActionsConfiguration {
    
    @discardableResult
    func performsFirstActionWithFullSwipe(_ value: Bool) -> Self {
        wrapped.performsFirstActionWithFullSwipe = value
        return self
    }
    
}
