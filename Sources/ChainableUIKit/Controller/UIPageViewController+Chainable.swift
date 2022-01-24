//
//  UIPageViewController+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIPageViewController {
    
    @discardableResult
    func viewControllers(_ controllers: [UIViewController], direction: UIPageViewController.NavigationDirection, isAnimated: Bool = false, completionHandler: ((Bool) -> Void)? = nil) -> Self {
        wrapped.setViewControllers(controllers, direction: direction, animated: isAnimated, completion: completionHandler)
        return self
    }
    
    @discardableResult
    func isDoubleSided(_ value: Bool) -> Self {
        wrapped.isDoubleSided = value
        return self
    }
    
}
