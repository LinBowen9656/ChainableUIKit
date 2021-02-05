//
//  UIGestureRecognizer+Chainable.swift
//
//
//  Created by 林博文 on 2020/8/4.
//

import UIKit

extension UIGestureRecognizer: ChainableType {}

public extension ChainableWrapper where Wrapped: UIGestureRecognizer {
    
    @discardableResult
    func requireToFail(_ gesture: UIGestureRecognizer) -> Self {
        wrapped.require(toFail: gesture)
        return self
    }
    
    @discardableResult
    func isEnabled(_ value: Bool) -> Self {
        wrapped.isEnabled = value
        return self
    }
    
    @discardableResult
    func isCancelsTouchesInView(_ value: Bool) -> Self {
        wrapped.cancelsTouchesInView = value
        return self
    }
    
    @discardableResult
    func isDelaysTouchesBegan(_ value: Bool) -> Self {
        wrapped.delaysTouchesBegan = value
        return self
    }
    
    @discardableResult
    func isDelaysTouchesEnded(_ value: Bool) -> Self {
        wrapped.delaysTouchesEnded = value
        return self
    }
    
    @discardableResult
    func addActionHandler(_ handler: @escaping (Wrapped) -> Void) -> Self {
        wrapped.addActionHandler { gestureRecognizer in
            handler(gestureRecognizer as! Wrapped)
        }
        return self
    }
    
    @discardableResult
    func removeActionHandler() -> Self {
        wrapped.removeActionHandler()
        return self
    }
    
}
