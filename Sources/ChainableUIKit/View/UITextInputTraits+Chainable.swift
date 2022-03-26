//
//  UITextInputTraits+Chainable.swift
//  
//
//  Created by 林博文 on 2022/1/3.
//

import UIKit

public extension ChainableWrapper where Wrapped: UITextField {
    
    @discardableResult
    func keyboardType(_ type: UIKeyboardType) -> Self {
        wrapped.keyboardType = type
        return self
    }
    
    @discardableResult
    func keyboardAppearance(_ appearance: UIKeyboardAppearance) -> Self {
        wrapped.keyboardAppearance = appearance
        return self
    }
    
    @discardableResult
    func returnKeyType(_ type: UIReturnKeyType) -> Self {
        wrapped.returnKeyType = type
        return self
    }
    
    @discardableResult
    func textContentType(_ type: UITextContentType) -> Self {
        wrapped.textContentType = type
        return self
    }
    
    @discardableResult
    func isSecureTextEntry(_ value: Bool) -> Self {
        wrapped.isSecureTextEntry = value
        return self
    }
    
    @discardableResult
    func enablesReturnKeyAutomatically(_ value: Bool) -> Self {
        wrapped.enablesReturnKeyAutomatically = value
        return self
    }
    
    @discardableResult
    func autocapitalizationType(_ type: UITextAutocapitalizationType) -> Self {
        wrapped.autocapitalizationType = type
        return self
    }
    
    @discardableResult
    func autocorrectionType(_ type: UITextAutocorrectionType) -> Self {
        wrapped.autocorrectionType = type
        return self
    }
    
    @discardableResult
    func spellCheckingType(_ type: UITextSpellCheckingType) -> Self {
        wrapped.spellCheckingType = type
        return self
    }
    
    @discardableResult
    func smartQuotesType(_ type: UITextSmartQuotesType) -> Self {
        wrapped.smartQuotesType = type
        return self
    }
    
    @discardableResult
    func smartDashesType(_ type: UITextSmartDashesType) -> Self {
        wrapped.smartDashesType = type
        return self
    }
    
    @discardableResult
    func smartInsertDeleteType(_ type: UITextSmartInsertDeleteType) -> Self {
        wrapped.smartInsertDeleteType = type
        return self
    }
    
    @available(iOS 12.0, *)
    @discardableResult
    func passwordRules(_ rules: UITextInputPasswordRules?) -> Self {
        wrapped.passwordRules = rules
        return self
    }
    
}

public extension ChainableWrapper where Wrapped: UITextView {
    
    @discardableResult
    func keyboardType(_ type: UIKeyboardType) -> Self {
        wrapped.keyboardType = type
        return self
    }
    
    @discardableResult
    func keyboardAppearance(_ appearance: UIKeyboardAppearance) -> Self {
        wrapped.keyboardAppearance = appearance
        return self
    }
    
    @discardableResult
    func returnKeyType(_ type: UIReturnKeyType) -> Self {
        wrapped.returnKeyType = type
        return self
    }
    
    @discardableResult
    func textContentType(_ type: UITextContentType) -> Self {
        wrapped.textContentType = type
        return self
    }
    
    @discardableResult
    func isSecureTextEntry(_ value: Bool) -> Self {
        wrapped.isSecureTextEntry = value
        return self
    }
    
    @discardableResult
    func enablesReturnKeyAutomatically(_ value: Bool) -> Self {
        wrapped.enablesReturnKeyAutomatically = value
        return self
    }
    
    @discardableResult
    func autocapitalizationType(_ type: UITextAutocapitalizationType) -> Self {
        wrapped.autocapitalizationType = type
        return self
    }
    
    @discardableResult
    func autocorrectionType(_ type: UITextAutocorrectionType) -> Self {
        wrapped.autocorrectionType = type
        return self
    }
    
    @discardableResult
    func spellCheckingType(_ type: UITextSpellCheckingType) -> Self {
        wrapped.spellCheckingType = type
        return self
    }
    
    @discardableResult
    func smartQuotesType(_ type: UITextSmartQuotesType) -> Self {
        wrapped.smartQuotesType = type
        return self
    }
    
    @discardableResult
    func smartDashesType(_ type: UITextSmartDashesType) -> Self {
        wrapped.smartDashesType = type
        return self
    }
    
    @discardableResult
    func smartInsertDeleteType(_ type: UITextSmartInsertDeleteType) -> Self {
        wrapped.smartInsertDeleteType = type
        return self
    }
    
    @available(iOS 12.0, *)
    @discardableResult
    func passwordRules(_ rules: UITextInputPasswordRules?) -> Self {
        wrapped.passwordRules = rules
        return self
    }
    
}
