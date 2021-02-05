//
//  UIControl+UIKitUtils.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

private var actionWrappersKey: Void?
public extension UIControl {
    
    private var actionWrappers: [UInt: ActionWrapper] {
        get {
            guard let actionWrappers = objc_getAssociatedObject(self, &actionWrappersKey) as? [UInt: ActionWrapper] else {
                return [UInt: ActionWrapper]()
            }
            return actionWrappers
        }
        set {
            objc_setAssociatedObject(self, &actionWrappersKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addActionHandler(event: UIControl.Event, handler: @escaping (UIControl) -> Void) {
        let actionWrapper = ActionWrapper {
            handler(self)
        }
        actionWrappers[event.rawValue] = actionWrapper
        addTarget(actionWrapper, action: #selector(actionWrapper.action), for: event)
    }
    
    func removeActionHandler(event: UIControl.Event) {
        if let actionWrapper = actionWrappers[event.rawValue] {
            removeTarget(actionWrapper, action: #selector(actionWrapper.action), for: event)
        }
        actionWrappers[event.rawValue] = nil
    }
    
}
