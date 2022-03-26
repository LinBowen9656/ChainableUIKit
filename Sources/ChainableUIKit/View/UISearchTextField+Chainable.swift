//
//  UISearchTextField+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

@available(iOS 13.0, *)
public extension ChainableWrapper where Wrapped: UISearchTextField {
    
    @discardableResult
    func replaceTextualPortion(_ range: UITextRange, token: UISearchToken, index: Int) -> Self {
        wrapped.replaceTextualPortion(of: range, with: token, at: index)
        return self
    }
    
    @discardableResult
    func allowsDeletingTokens(_ value: Bool) -> Self {
        wrapped.allowsDeletingTokens = value
        return self
    }
    
    @discardableResult
    func allowsCopyingTokens(_ value: Bool) -> Self {
        wrapped.allowsCopyingTokens = value
        return self
    }
    
    @discardableResult
    func insertToken(_ token: UISearchToken, index: Int) -> Self {
        wrapped.insertToken(token, at: index)
        return self
    }
    
    @discardableResult
    func removeToken(_ index: Int) -> Self {
        wrapped.removeToken(at: index)
        return self
    }
    
}
