//
//  UIGestureRecognizer+UIKitUtils.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

private var actionWrapperKey: Void?
public extension UIGestureRecognizer {
    
    private var actionWrapper: ActionWrapper? {
        get {
            objc_getAssociatedObject(self, &actionWrapperKey) as? ActionWrapper
        }
        set {
            objc_setAssociatedObject(self, &actionWrapperKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addActionHandler(_ handler: @escaping (UIGestureRecognizer) -> Void) {
        let action = ActionWrapper {
            handler(self)
        }
        actionWrapper = action
        addTarget(action, action: #selector(action.action))
    }
    
    func removeActionHandler() {
        if let actionWrapper = actionWrapper {
            removeTarget(actionWrapper, action: #selector(actionWrapper.action))
        }
        actionWrapper = nil
    }
    
}
