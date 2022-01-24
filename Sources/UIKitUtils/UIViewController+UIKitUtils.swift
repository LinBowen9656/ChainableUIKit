//
//  UIViewController+UIKitUtils.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension UIViewController {
    
    /// Get the parent controller of the specified type.
    /// - Parameter type: Parent controller's type.
    /// - Returns: The parent controller of the specified type.
    func parent<T>(type: T.Type) -> T? {
        for viewController in sequence(first: parent, next: { $0?.parent }) {
            if let typeView = viewController as? T {
                return typeView
            }
        }
        return nil
    }
    
    /// Presents a view controller in a primary context.
    /// - Parameters:
    ///   - viewController: The view controller to display.
    ///   - sender: The object that initiated the request.
    ///   - completionHandler: The closure to execute after the view controller is appeared.
    func show(viewController: UIViewController, sender: Any? = nil, completionHandler: (() -> Void)? = nil) {
        if let completionHandler = completionHandler {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completionHandler)
            show(viewController, sender: sender)
            CATransaction.commit()
        } else {
            show(viewController, sender: sender)
        }
    }
    
    /// Presents a view controller in a secondary (or detail) context.
    /// - Parameters:
    ///   - viewController: The view controller to display.
    ///   - sender: The object that initiated the request.
    ///   - completionHandler: The closure to execute after the view controller is appeared.
    func showDetail(viewController: UIViewController, sender: Any? = nil, completionHandler: (() -> Void)? = nil) {
        if let completionHandler = completionHandler {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completionHandler)
            showDetailViewController(viewController, sender: sender)
            CATransaction.commit()
        } else {
            showDetailViewController(viewController, sender: sender)
        }
    }
    
}

public extension UINavigationController {
    
    /// The view controller that resides at the bottom of the navigation stack.
    var rootViewController: UIViewController? { viewControllers.first }
    
    /// Pushes a view controller onto the receiver’s stack and updates the display.
    /// - Parameters:
    ///   - controller: The view controller to push onto the stack.
    ///   - isAnimated: Specify true to animate the transition or false if you do not want the transition to be animated.
    ///   - completionHandler: The closure to execute after the view controller is appeared.
    func pushViewController(_ controller: UIViewController, isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) {
        if let completionHandler = completionHandler {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completionHandler)
            pushViewController(controller, animated: isAnimated)
            CATransaction.commit()
        } else {
            pushViewController(controller, animated: isAnimated)
        }
    }
    
    /// Pops the top view controller from the navigation stack and updates the display.
    /// - Parameters:
    ///   - isAnimated: Set this value to true to animate the transition.
    ///   - completionHandler: The closure to execute after the view controller is popped.
    /// - Returns: The view controller that was popped from the stack.
    @discardableResult
    func popViewController(isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> UIViewController? {
        if let completionHandler = completionHandler {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completionHandler)
            let poppedViewController = popViewController(animated: isAnimated)
            CATransaction.commit()
            return poppedViewController
        } else {
            return popViewController(animated: isAnimated)
        }
    }
    
    /// Pops view controllers until the specified view controller is at the top of the navigation stack.
    /// - Parameters:
    ///   - controller: The view controller that you want to be at the top of the stack.
    ///   - isAnimated: Set this value to true to animate the transition.
    ///   - completionHandler: The closure to execute after the view controller is popped.
    /// - Returns: An array containing the view controllers that were popped from the stack.
    @discardableResult
    func popToViewController(_ controller: UIViewController, isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> [UIViewController]? {
        if let completionHandler = completionHandler {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completionHandler)
            let viewControllers = popToViewController(controller, animated: isAnimated)
            CATransaction.commit()
            return viewControllers
        } else {
            return popToViewController(controller, animated: isAnimated)
        }
    }
    
    /// Pops all the view controllers on the stack except the root view controller and updates the display.
    ///
    /// - Parameters:
    ///   - isAnimated: Set this value to true to animate the transition.
    ///   - completionHandler: The closure to execute after the view controller is popped.
    /// - Returns: An array of view controllers representing the items that were popped from the stack.
    @discardableResult
    func popToRootViewController(isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> [UIViewController]? {
        if let completionHandler = completionHandler {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completionHandler)
            let viewControllers = popToRootViewController(animated: isAnimated)
            CATransaction.commit()
            return viewControllers
        } else {
            return popToRootViewController(animated: isAnimated)
        }
    }
    
    /// Replaces the view controllers currently managed by the navigation controller with the specified items.
    /// - Parameters:
    ///   - controllers: The view controllers to place in the stack.
    ///   - isAnimated: If true, animate the pushing or popping of the top view controller. If false, replace the view controllers without any animations.
    ///   - completionHandler: The closure to execute after the view controllers are set.
    func setViewControllers(_ controllers: [UIViewController], isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) {
        if let completionHandler = completionHandler {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completionHandler)
            setViewControllers(controllers, animated: isAnimated)
            CATransaction.commit()
        } else {
            setViewControllers(controllers, animated: isAnimated)
        }
    }
    
}
