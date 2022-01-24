//
//  UISwitch+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UISwitch {
    
    @discardableResult
    func isOn(_ value: Bool, isAnimated: Bool = false) -> Self {
        wrapped.setOn(value, animated: isAnimated)
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func preferredStyle(_ style: UISwitch.Style) -> Self {
        wrapped.preferredStyle = style
        return self
    }
    
    @discardableResult
    func title(_ string: String?) -> Self {
        if #available(iOS 14.0, *), UIDevice.current.userInterfaceIdiom == .mac {
            wrapped.title = string
        }
        return self
    }
    
    @discardableResult
    func onTintColor(_ color: UIColor?) -> Self {
        wrapped.onTintColor = color
        return self
    }
    
    @discardableResult
    func thumbTintColor(_ color: UIColor?) -> Self {
        wrapped.thumbTintColor = color
        return self
    }
    
}
