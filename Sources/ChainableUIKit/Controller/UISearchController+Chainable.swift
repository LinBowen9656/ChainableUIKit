//
//  UISearchController+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension ChainableWrapper where Wrapped: UISearchController {
    
    @discardableResult
    func isActive(_ value: Bool) -> Self {
        wrapped.isActive = value
        return self
    }
    
    @discardableResult
    func isObscuresBackgroundDuringPresentation(_ value: Bool) -> Self {
        wrapped.obscuresBackgroundDuringPresentation = value
        return self
    }
    
    @discardableResult
    func isHidesNavigationBarDuringPresentation(_ value: Bool) -> Self {
        wrapped.hidesNavigationBarDuringPresentation = value
        return self
    }
    
    @discardableResult
    func isAutomaticallyShowsCancelButton(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.automaticallyShowsCancelButton = value
        }
        return self
    }
    
    @discardableResult
    func isAutomaticallyShowsScopeBar(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.automaticallyShowsScopeBar = value
        }
        return self
    }
    
    @discardableResult
    func isAutomaticallyShowsSearchResultsController(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.automaticallyShowsSearchResultsController = value
        }
        return self
    }
    
    @discardableResult
    func isShowsSearchResultsController(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.showsSearchResultsController = value
        }
        return self
    }
    
}
