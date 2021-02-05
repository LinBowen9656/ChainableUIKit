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

extension UINavigationController {
    
    /// 根视图控制器
    var rootViewController: UIViewController? { viewControllers.first }
    
}
