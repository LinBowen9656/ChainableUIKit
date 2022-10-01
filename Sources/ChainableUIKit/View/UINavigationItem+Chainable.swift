//
//  UINavigationItem+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension ChainableWrapper where Wrapped: UINavigationItem {
    
    @discardableResult
    func title(_ title: String?) -> Self {
        wrapped.title = title
        return self
    }
    
    @discardableResult
    func largeTitleDisplayMode(_ mode: UINavigationItem.LargeTitleDisplayMode) -> Self {
        wrapped.largeTitleDisplayMode = mode
        return self
    }
    
    @discardableResult
    func backBarButtonItem(_ item: UIBarButtonItem?) -> Self {
        wrapped.backBarButtonItem = item
        return self
    }
    
    @discardableResult
    func backButtonTitle(_ title: String?) -> Self {
        wrapped.backButtonTitle = title
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func backButtonDisplayMode(_ mode: UINavigationItem.BackButtonDisplayMode) -> Self {
        wrapped.backButtonDisplayMode = mode
        return self
    }
    
    @discardableResult
    func hidesBackButton(_ value: Bool, isAnimated: Bool = false) -> Self {
        wrapped.setHidesBackButton(value, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func prompt(_ prompt: String?) -> Self {
        wrapped.prompt = prompt
        return self
    }
    
    @discardableResult
    func leftItemsSupplementBackButton(_ value: Bool) -> Self {
        wrapped.leftItemsSupplementBackButton = value
        return self
    }
    
    @discardableResult
    func leftBarButtonItems(_ items: [UIBarButtonItem]?, isAnimated: Bool = false) -> Self {
        wrapped.setLeftBarButtonItems(items, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func rightBarButtonItems(_ items: [UIBarButtonItem]?, isAnimated: Bool = false) -> Self {
        wrapped.setRightBarButtonItems(items, animated: isAnimated)
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func standardAppearance(_ appearance: UINavigationBarAppearance?) -> Self {
        wrapped.standardAppearance = appearance
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func compactAppearance(_ appearance: UINavigationBarAppearance?) -> Self {
        wrapped.compactAppearance = appearance
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func scrollEdgeAppearance(_ appearance: UINavigationBarAppearance?) -> Self {
        wrapped.scrollEdgeAppearance = appearance
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func compactScrollEdgeAppearance(_ appearance: UINavigationBarAppearance?) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.compactScrollEdgeAppearance = appearance
        }
        return self
    }
    
    @discardableResult
    func searchController(_ controller: UISearchController?) -> Self {
        wrapped.searchController = controller
        return self
    }
    
    @discardableResult
    func hidesSearchBarWhenScrolling(_ value: Bool) -> Self {
        wrapped.hidesSearchBarWhenScrolling = value
        return self
    }
    
}
