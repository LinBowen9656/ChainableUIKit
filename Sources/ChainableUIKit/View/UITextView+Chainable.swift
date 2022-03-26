//
//  UITextView+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UITextView {
    
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
    func isEditable(_ value: Bool) -> Self {
        wrapped.isEditable = value
        return self
    }
    
    @discardableResult
    func allowsEditingTextAttributes(_ value: Bool) -> Self {
        wrapped.allowsEditingTextAttributes = value
        return self
    }
    
    @discardableResult
    func dataDetectorTypes(_ type: UIDataDetectorTypes) -> Self {
        wrapped.dataDetectorTypes = type
        return self
    }
    
    @discardableResult
    func typingAttributes(_ attributes: [NSAttributedString.Key : Any]) -> Self {
        wrapped.typingAttributes = attributes
        return self
    }
    
    @discardableResult
    func linkTextAttributes(_ attributes: [NSAttributedString.Key : Any]) -> Self {
        wrapped.linkTextAttributes = attributes
        return self
    }
    
    @discardableResult
    func textContainerInset(_ insets: UIEdgeInsets) -> Self {
        wrapped.textContainerInset = insets
        return self
    }
    
    @discardableResult
    func selectedRange(_ range: NSRange) -> Self {
        wrapped.selectedRange = range
        return self
    }
    
    @discardableResult
    func selectedRange(_ range: Range<String.Index>) -> Self {
        wrapped.selectedRange = NSRange(range, in: wrapped.text)
        return self
    }
    
    @discardableResult
    func clearsOnInsertion(_ value: Bool) -> Self {
        wrapped.clearsOnInsertion = value
        return self
    }
    
    @discardableResult
    func isSelectable(_ value: Bool) -> Self {
        wrapped.isSelectable = value
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
    
    @discardableResult
    func usesStandardTextScaling(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.usesStandardTextScaling = value
        }
        return self
    }
    
}
