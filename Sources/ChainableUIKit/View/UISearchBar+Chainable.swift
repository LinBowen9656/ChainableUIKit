//
//  UISearchBar+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

public extension ChainableWrapper where Wrapped: UISearchBar {
    
    @discardableResult
    func placeholder(_ string: String?) -> Self {
        wrapped.placeholder = string
        return self
    }
    
    @discardableResult
    func prompt(_ string: String?) -> Self {
        wrapped.prompt = string
        return self
    }
    
    @discardableResult
    func text(_ string: String?) -> Self {
        wrapped.text = string
        return self
    }
    
    @discardableResult
    func barTintColor(_ color: UIColor?) -> Self {
        wrapped.barTintColor = color
        return self
    }
    
    @discardableResult
    func searchBarStyle(_ style: UISearchBar.Style) -> Self {
        wrapped.searchBarStyle = style
        return self
    }
    
    @discardableResult
    func isTranslucent(_ value: Bool) -> Self {
        wrapped.isTranslucent = value
        return self
    }
    
    @discardableResult
    func barStyle(_ style: UIBarStyle) -> Self {
        wrapped.barStyle = style
        return self
    }
    
    @discardableResult
    func showsBookmarkButton(_ value: Bool) -> Self {
        wrapped.showsBookmarkButton = value
        return self
    }
    
    @discardableResult
    func showsCancelButton(_ value: Bool, isAnimated: Bool = false) -> Self {
        wrapped.setShowsCancelButton(value, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func showsSearchResultsButton(_ value: Bool) -> Self {
        wrapped.showsSearchResultsButton = value
        return self
    }
    
    @discardableResult
    func isSearchResultsButtonSelected(_ value: Bool) -> Self {
        wrapped.isSearchResultsButtonSelected = value
        return self
    }
    
    @discardableResult
    func scopeButtonTitles(_ titles: [String]?) -> Self {
        wrapped.scopeButtonTitles = titles
        return self
    }
    
    @discardableResult
    func selectedScopeButtonIndex(_ index: Int) -> Self {
        wrapped.selectedScopeButtonIndex = index
        return self
    }
    
    @discardableResult
    func showsScopeBar(_ value: Bool, isAnimated: Bool = false) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.setShowsScope(value, animated: isAnimated)
        } else {
            wrapped.showsScopeBar = value
        }
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?) -> Self {
        wrapped.backgroundImage = image
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?, icon: UISearchBar.Icon, state: UIControl.State = .normal) -> Self {
        wrapped.setImage(image, for: icon, state: state)
        return self
    }
    
    @discardableResult
    func positionAdjustment(_ offset: UIOffset, icon: UISearchBar.Icon) -> Self {
        wrapped.setPositionAdjustment(offset, for: icon)
        return self
    }
    
    @discardableResult
    func inputAccessoryView(_ view: UIView?) -> Self {
        wrapped.inputAccessoryView = view
        return self
    }
    
    @discardableResult
    func scopeBarBackgroundImage(_ image: UIImage?) -> Self {
        wrapped.scopeBarBackgroundImage = image
        return self
    }
    
    @discardableResult
    func scopeBarButtonBackgroundImage(_ image: UIImage?, state: UIControl.State) -> Self {
        wrapped.setScopeBarButtonBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func scopeBarButtonDividerImage(_ image: UIImage?, leftSegmentState: UIControl.State, rightSegmentState: UIControl.State) -> Self {
        wrapped.setScopeBarButtonDividerImage(image, forLeftSegmentState: leftSegmentState, rightSegmentState: rightSegmentState)
        return self
    }
    
    @discardableResult
    func scopeBarButtonTitleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, state: UIControl.State) -> Self {
        wrapped.setScopeBarButtonTitleTextAttributes(attributes, for: state)
        return self
    }
    
    @discardableResult
    func searchFieldBackgroundImage(_ image: UIImage?, state: UIControl.State) -> Self {
        wrapped.setSearchFieldBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func searchFieldBackgroundPositionAdjustment(_ offset: UIOffset) -> Self {
        wrapped.searchFieldBackgroundPositionAdjustment = offset
        return self
    }
    
    @discardableResult
    func searchTextPositionAdjustment(_ offset: UIOffset) -> Self {
        wrapped.searchTextPositionAdjustment = offset
        return self
    }
    
}
