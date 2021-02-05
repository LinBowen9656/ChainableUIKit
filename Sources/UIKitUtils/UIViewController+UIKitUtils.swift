//
//  UIViewController+UIKitUtils.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

public extension UIViewController {
    
    /// 当前是否显示
    var isVisible: Bool { isViewLoaded && view.isVisible }
    /// 是否由Present跳转而来
    var isPresented: Bool {
        var viewController = self
        if let navigationController = navigationController {
            guard navigationController.rootViewController == self else { return false }
            viewController = navigationController
        }
        return viewController.presentingViewController?.presentedViewController == viewController
    }
    
    func parent<T>(type: T.Type) -> T? {
        for viewController in sequence(first: parent, next: { $0?.parent }) {
            if let typeView = viewController as? T {
                return typeView
            }
        }
        return nil
    }
    
}

public extension UINavigationController {
    
    /// 根视图控制器
    var rootViewController: UIViewController? { viewControllers.first }
    
    /// 拥有完成回调的Push
    ///
    /// - Parameters:
    ///   - viewController: 将Push到的View Controller
    ///   - animated: 是否显示动画
    ///   - completion: 完成回调
    func pushViewController(_ controller: UIViewController, isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completionHandler)
        pushViewController(controller, animated: isAnimated)
        CATransaction.commit()
    }
    
    /// 拥有完成回调的Pop
    ///
    /// - Parameters:
    ///   - animated: 是否显示动画
    ///   - completion: 完成回调
    /// - Returns: 被Pop的View Controller
    @discardableResult
    func popViewController(isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> UIViewController? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completionHandler)
        let poppedViewController = popViewController(animated: isAnimated)
        CATransaction.commit()
        return poppedViewController
    }
    
    /// 拥有完成回调的Pop
    ///
    /// - Parameters:
    ///   - viewController: 将Pop到的View Controller
    ///   - animated: 是否显示动画
    ///   - completion: 完成回调
    /// - Returns: 被Pop的View Controller数组
    @discardableResult
    func popToViewController(_ controller: UIViewController, isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> [UIViewController]? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completionHandler)
        let viewControllers = popToViewController(controller, animated: isAnimated)
        CATransaction.commit()
        return viewControllers
    }
    
    /// 拥有完成回调的Pop
    ///
    /// - Parameters:
    ///   - animated: 是否显示动画
    ///   - completion: 完成回调
    /// - Returns: 被Pop的View Controller数组
    @discardableResult
    func popToRootViewController(isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> [UIViewController]? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completionHandler)
        let viewControllers = popToRootViewController(animated: isAnimated)
        CATransaction.commit()
        return viewControllers
    }
    
    /// 拥有回调的SetViewController
    /// - Parameters:
    ///   - viewControllers: 用来替换入栈的控制器
    ///   - animated: 是否显示动画
    ///   - completion: 完成回调
    func setViewControllers(_ controllers: [UIViewController], isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completionHandler)
        setViewControllers(controllers, animated: isAnimated)
        CATransaction.commit()
        return
    }
    
}
