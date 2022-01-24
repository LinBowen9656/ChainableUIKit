//
//  UIKeyInput+Chainable.swift
//  
//
//  Created by 林博文 on 2022/1/3.
//

import UIKit

public extension ChainableWrapper where Wrapped: UITextField {
    
    @discardableResult
    func insertText(_ string: String) -> Self {
        wrapped.insertText(string)
        return self
    }
    
    @discardableResult
    func deleteBackward() -> Self {
        wrapped.deleteBackward()
        return self
    }
    
}

public extension ChainableWrapper where Wrapped: UITextView {
    
    @discardableResult
    func insertText(_ string: String) -> Self {
        wrapped.insertText(string)
        return self
    }
    
    @discardableResult
    func deleteBackward() -> Self {
        wrapped.deleteBackward()
        return self
    }
    
}
