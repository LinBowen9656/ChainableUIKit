//
//  UITextInput+Chainable.swift
//  
//
//  Created by 林博文 on 2022/1/3.
//

import UIKit

public extension ChainableWrapper where Wrapped: UITextField {
    
    @discardableResult
    func replace(range: UITextRange, with text: String) -> Self {
        wrapped.replace(range, withText: text)
        return self
    }
    
    @discardableResult
    func selectedTextRange(_ range: UITextRange?) -> Self {
        wrapped.selectedTextRange = range
        return self
    }
    
    @discardableResult
    func markedText(_ string: String?, range: NSRange) -> Self {
        wrapped.setMarkedText(string, selectedRange: range)
        return self
    }
    
    @discardableResult
    func attributedMarkedText(_ attributedString: NSAttributedString?, range: NSRange) -> Self {
        wrapped.setAttributedMarkedText(attributedString, selectedRange: range)
        return self
    }
    
    @discardableResult
    func unmarkText() -> Self {
        wrapped.unmarkText()
        return self
    }
    
    @discardableResult
    func baseWritingDirection(_ direction: NSWritingDirection, for range: UITextRange) -> Self {
        wrapped.setBaseWritingDirection(direction, for: range)
        return self
    }
    
}

public extension ChainableWrapper where Wrapped: UITextView {
    
    @discardableResult
    func replace(range: UITextRange, with text: String) -> Self {
        wrapped.replace(range, withText: text)
        return self
    }
    
    @discardableResult
    func selectedTextRange(_ range: UITextRange?) -> Self {
        wrapped.selectedTextRange = range
        return self
    }
    
    @discardableResult
    func markedText(_ string: String?, range: NSRange) -> Self {
        wrapped.setMarkedText(string, selectedRange: range)
        return self
    }
    
    @discardableResult
    func attributedMarkedText(_ attributedString: NSAttributedString?, range: NSRange) -> Self {
        wrapped.setAttributedMarkedText(attributedString, selectedRange: range)
        return self
    }
    
    @discardableResult
    func unmarkText() -> Self {
        wrapped.unmarkText()
        return self
    }
    
    @discardableResult
    func baseWritingDirection(_ direction: NSWritingDirection, for range: UITextRange) -> Self {
        wrapped.setBaseWritingDirection(direction, for: range)
        return self
    }
    
}
