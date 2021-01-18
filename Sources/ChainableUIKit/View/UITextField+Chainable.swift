//
//  UITextField+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/1/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UITextField {
    
    @discardableResult
    func text(_ string: String?) -> Self {
        wrapped.text = string
        return self
    }
    
    @discardableResult
    func attributedText(_ string: NSAttributedString?) -> Self {
        wrapped.attributedText = string
        return self
    }
    
    @discardableResult
    func placeholder(_ string: String?) -> Self {
        wrapped.placeholder = string
        return self
    }
    
    @discardableResult
    func attributedPlaceholder(_ string: NSAttributedString?) -> Self {
        wrapped.attributedPlaceholder = string
        return self
    }
    
    @discardableResult
    func defaultTextAttributes(_ attributes: [NSAttributedString.Key : Any]) -> Self {
        wrapped.defaultTextAttributes = attributes
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        wrapped.font = font
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        wrapped.textColor = color
        return self
    }
    
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        wrapped.textAlignment = alignment
        return self
    }
    
    @discardableResult
    func typingAttributes(_ attributes: [NSAttributedString.Key : Any]) -> Self {
        wrapped.typingAttributes = attributes
        return self
    }
    
    @discardableResult
    func isClearsOnBeginEditing(_ value: Bool) -> Self {
        wrapped.clearsOnBeginEditing = value
        return self
    }
    
    @discardableResult
    func isClearsOnInsertion(_ value: Bool) -> Self {
        wrapped.clearsOnInsertion = value
        return self
    }
    
    @discardableResult
    func isAllowsEditingTextAttributes(_ value: Bool) -> Self {
        wrapped.allowsEditingTextAttributes = value
        return self
    }
    
    @discardableResult
    func borderStyle(_ style: UITextField.BorderStyle) -> Self {
        wrapped.borderStyle = style
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?) -> Self {
        wrapped.background = image
        return self
    }
    
    @discardableResult
    func disabledBackgroundImage(_ image: UIImage?) -> Self {
        wrapped.disabledBackground = image
        return self
    }
    
    @discardableResult
    func clearButtonMode(_ mode: UITextField.ViewMode) -> Self {
        wrapped.clearButtonMode = mode
        return self
    }
    
    @discardableResult
    func leftView(_ view: UIView?) -> Self {
        wrapped.leftView = view
        return self
    }
    
    @discardableResult
    func leftViewMode(_ mode: UITextField.ViewMode) -> Self {
        wrapped.leftViewMode = mode
        return self
    }
    
    @discardableResult
    func rightView(_ view: UIView?) -> Self {
        wrapped.rightView = view
        return self
    }
    
    @discardableResult
    func rightViewMode(_ mode: UITextField.ViewMode) -> Self {
        wrapped.rightViewMode = mode
        return self
    }
    
    @discardableResult
    func inputView(_ view: UIView?) -> Self {
        wrapped.inputView = view
        return self
    }
    
    @discardableResult
    func inputAccessoryView(_ view: UIView?) -> Self {
        wrapped.inputAccessoryView = view
        return self
    }
    
}
