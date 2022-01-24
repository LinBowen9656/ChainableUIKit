//
//  ControllerInformation.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public protocol ControllerInformation {}

public extension ControllerInformation {
    
    /// Get the lastest window.
    var topWindow: UIWindow? { UIApplication.shared.windows.last }
    /// Get the lastest key window.
    var keyWindow: UIWindow? { UIApplication.shared.windows.last { $0.isKeyWindow } }
    /// Get the topest of view controller.
    var currentViewController: UIViewController? {
        var resultVC: UIViewController? = getCurrentViewController(viewController: rootViewController)
        while resultVC?.presentedViewController != nil {
            resultVC = getCurrentViewController(viewController: resultVC?.presentedViewController)
        }
        return resultVC
    }
    /// Get root view controller.
    var rootViewController: UIViewController? { keyWindow?.rootViewController }
    
    private func getCurrentViewController(viewController: UIViewController?) -> UIViewController? {
        switch viewController {
        case let navigationController as UINavigationController:
            guard navigationController.topViewController != nil else { return navigationController }
            return getCurrentViewController(viewController: navigationController.topViewController)
        case let tabBarController as UITabBarController:
            guard tabBarController.selectedViewController != nil else { return tabBarController }
            return getCurrentViewController(viewController: tabBarController.selectedViewController)
        default:
            return viewController
        }
    }
    
    /// Dismiss to the specified view controller.
    /// - Parameters:
    ///   - fromViewController: The controller which you want to dismiss.
    ///   - toViewController: The controller that you want to be at the top of the stack.
    ///   - isAnimated: Specify true to animate the transition or false if you do not want the transition to be animated.
    ///   - completionHandler: The closure to execute after the view controller is dismissed.
    func dismissToController<T: UIViewController>(fromViewController: UIViewController, toViewController: T.Type, isAnimated: Bool, completionHandler: (() -> Void)? = nil) {
        var vc = fromViewController.presentingViewController
        while !(vc is T) {
            vc = vc?.presentingViewController
        }
        vc?.dismiss(animated: isAnimated, completion: completionHandler)
    }
    
    /// Back to the root view controller.
    /// - Parameters:
    ///   - isAnimated: Specify true to animate the transition or false if you do not want the transition to be animated.
    ///   - completionHandler: The closure to execute after the view controller is dismissed.
    func backToRootViewController(isAnimated: Bool, completionHandler: (() -> Void)? = nil) {
        var vc = currentViewController
        if vc?.presentingViewController != nil {
            while vc?.presentingViewController != nil {
                vc = vc?.presentingViewController
            }
            if let navigationController = vc?.presentingViewController?.navigationController {
                vc?.dismiss(animated: false) {
                    navigationController.popToRootViewController(isAnimated: isAnimated, completionHandler: completionHandler)
                }
            } else {
                vc?.dismiss(animated: isAnimated, completion: completionHandler)
            }
        } else {
            if let navigationController = vc?.navigationController {
                navigationController.popToRootViewController(isAnimated: isAnimated, completionHandler: completionHandler)
            }
        }
    }
    
}
