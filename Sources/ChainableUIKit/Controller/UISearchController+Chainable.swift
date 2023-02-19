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
    func obscuresBackgroundDuringPresentation(_ value: Bool) -> Self {
        wrapped.obscuresBackgroundDuringPresentation = value
        return self
    }
    
    @discardableResult
    func hidesNavigationBarDuringPresentation(_ value: Bool) -> Self {
        wrapped.hidesNavigationBarDuringPresentation = value
        return self
    }
    
    @discardableResult
    func automaticallyShowsCancelButton(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.automaticallyShowsCancelButton = value
        }
        return self
    }
    
    @available(iOS, deprecated: 16.0)
    @discardableResult
    func automaticallyShowsScopeBar(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.automaticallyShowsScopeBar = value
        }
        return self
    }
    
    @discardableResult
    func automaticallyShowsSearchResultsController(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.automaticallyShowsSearchResultsController = value
        }
        return self
    }
    
    @discardableResult
    func showsSearchResultsController(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.showsSearchResultsController = value
        }
        return self
    }
    
    @discardableResult
    func ignoresSearchSuggestionsForSearchBarPlacementStacked(_ value: Bool) -> Self {
        if #available(iOS 16.0, *) {
            wrapped.ignoresSearchSuggestionsForSearchBarPlacementStacked = value
        }
        return self
    }
    
    @available(iOS 16.0, *)
    @discardableResult
    func scopeBarActivation(_ value: UISearchController.ScopeBarActivation) -> Self {
        wrapped.scopeBarActivation = value
        return self
    }
    
    @available(iOS 16.0, *)
    @discardableResult
    func searchSuggestions(_ suggestions: [UISearchSuggestion]?) -> Self {
        wrapped.searchSuggestions = suggestions
        return self
    }
}
