//
//  UITabBarController+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension ChainableWrapper where Wrapped: UITabBarController {
    
    @discardableResult
    func viewControllers(_ controllers: [UIViewController], isAnimated: Bool = false) -> Self {
        wrapped.setViewControllers(controllers, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func customizableViewControllers(_ controllers: [UIViewController]?) -> Self {
        wrapped.customizableViewControllers = controllers
        return self
    }
    
    @discardableResult
    func selectedViewController(_ controller: UIViewController?) -> Self {
        wrapped.selectedViewController = controller
        return self
    }
    
    @discardableResult
    func selectedIndex(_ index: Int) -> Self {
        wrapped.selectedIndex = index
        return self
    }
    
}
