//
//  ControllerInformation.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

public protocol ControllerInformation {}

public extension ControllerInformation {
    
    var topWindow: UIWindow? { UIApplication.shared.windows.last }
    var keyWindow: UIWindow? { UIApplication.shared.windows.last { $0.isKeyWindow } }
    /// 获取当前ViewController
    var currentViewController: UIViewController? {
        var resultVC: UIViewController? = getCurrentViewController(viewController: rootViewController)
        while resultVC?.presentedViewController != nil {
            resultVC = getCurrentViewController(viewController: resultVC?.presentedViewController)
        }
        return resultVC
    }
    /// 获取根控制器
    var rootViewController: UIViewController? { keyWindow?.rootViewController }
    
    /// 获取当前ViewController递归函数
    ///
    /// - Parameter viewController: 要进行递归的View Controller
    /// - Returns: 顶层View Controller
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
    
    /// Dismiss到指定View Controller
    ///
    /// - Parameters:
    ///   - fromViewController: 原视图
    ///   - toViewController: 将要Dismiss的View Controller类型
    ///   - animated: 是否显示动画
    ///   - completion: 完成回调
    func dismissToController<T: UIViewController>(fromViewController: UIViewController, toViewController: T.Type, isAnimated: Bool, completionHandler: (() -> Void)? = nil) {
        var vc = fromViewController.presentingViewController
        while !(vc is T) {
            vc = vc?.presentingViewController
        }
        vc?.dismiss(animated: isAnimated, completion: completionHandler)
    }
    
    /// 返回根视图
    ///
    /// - Parameters:
    ///   - animated: 是否显示动画
    ///   - completion: 完成回调
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
