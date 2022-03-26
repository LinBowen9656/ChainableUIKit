//
//  UIWindow+Chainable.swift
//  
//
//  Created by 林博文 on 2021/11/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIWindow {
    
    @discardableResult
    func rootViewController(_ controller: UIViewController?) -> Self {
        wrapped.rootViewController = controller
        return self
    }
    
    @discardableResult
    func windowLevel(_ level: UIWindow.Level) -> Self {
        wrapped.windowLevel = level
        return self
    }
    
    @discardableResult
    func canResizeToFitContent(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.canResizeToFitContent = value
        }
        return self
    }
    
    @discardableResult
    func makeKey(isChangeVisibility: Bool = true) -> Self {
        if isChangeVisibility {
            wrapped.makeKeyAndVisible()
        } else {
            wrapped.makeKey()
        }
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func windowScene(_ scene: UIWindowScene?) -> Self {
        wrapped.windowScene = scene
        return self
    }
    
}
