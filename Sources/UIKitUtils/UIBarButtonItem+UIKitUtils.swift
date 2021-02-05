//
//  UIBarButtonItem+UIKitUtils.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

private var actionWrapperKey: Void?
public extension UIBarButtonItem {
    
    private var actionWrapper: ActionWrapper? {
        get {
            objc_getAssociatedObject(self, &actionWrapperKey) as? ActionWrapper
        }
        set {
            objc_setAssociatedObject(self, &actionWrapperKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addActionHandler(_ handler: @escaping (UIBarButtonItem) -> Void) {
        let actionHandler = ActionWrapper {
            handler(self)
        }
        actionWrapper = actionHandler
        target = actionHandler
        action = #selector(actionHandler.action)
    }
    
    func removeActionHandler() {
        target = nil
        action = nil
        actionWrapper = nil
    }
    
}
