//
//  UIButton+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIButton {
    
    @discardableResult
    func image(_ image: UIImage?, state: UIControl.State) -> Self {
        wrapped.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?, state: UIControl.State) -> Self {
        wrapped.setBackgroundImage(image, for: state)
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?, state: UIControl.State) -> Self {
        wrapped.setPreferredSymbolConfiguration(configuration, forImageIn: state)
        return self
    }
    
    @discardableResult
    func title(_ title: String?, state: UIControl.State) -> Self {
        wrapped.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func attributedTitle(_ title: NSAttributedString?, state: UIControl.State) -> Self {
        wrapped.setAttributedTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func titleColor(_ color: UIColor?, state: UIControl.State) -> Self {
        wrapped.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func titleShadowColor(_ color: UIColor?, state: UIControl.State) -> Self {
        wrapped.setTitleShadowColor(color, for: state)
        return self
    }
    
    @discardableResult
    func isReversesTitleShadowWhenHighlighted(_ value: Bool) -> Self {
        wrapped.reversesTitleShadowWhenHighlighted = value
        return self
    }
    
    @discardableResult
    func isAdjustsImageWhenDisabled(_ value: Bool) -> Self {
        wrapped.adjustsImageWhenDisabled = value
        return self
    }
    
    @discardableResult
    func isShowsTouchWhenHighlighted(_ value: Bool) -> Self {
        wrapped.showsTouchWhenHighlighted = value
        return self
    }
    
    @discardableResult
    func contentEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        wrapped.contentEdgeInsets = insets
        return self
    }
    
    @discardableResult
    func titleEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        wrapped.titleEdgeInsets = insets
        return self
    }
    
    @discardableResult
    func imageEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        wrapped.imageEdgeInsets = insets
        return self
    }
    
    @discardableResult
    func isPointerInteractionEnabled(_ value: Bool) -> Self {
        if #available(iOS 13.4, *) {
            wrapped.isPointerInteractionEnabled = value
        }
        return self
    }
    
    @available(iOS 13.4, *)
    @discardableResult
    func pointerStyleProvider(_ provider: UIButton.PointerStyleProvider?) -> Self {
        wrapped.pointerStyleProvider = provider
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func role(_ role: UIButton.Role) -> Self {
        wrapped.role = role
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func menu(_ menu: UIMenu) -> Self {
        wrapped.menu = menu
        return self
    }
    
}
