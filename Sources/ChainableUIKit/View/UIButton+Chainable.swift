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
    func reversesTitleShadowWhenHighlighted(_ value: Bool) -> Self {
        wrapped.reversesTitleShadowWhenHighlighted = value
        return self
    }
    
    @discardableResult
    func adjustsImageWhenDisabled(_ value: Bool) -> Self {
        wrapped.adjustsImageWhenDisabled = value
        return self
    }
    
    @discardableResult
    func showsTouchWhenHighlighted(_ value: Bool) -> Self {
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
    
    @available(iOS 15.0, *)
    @discardableResult
    func configuration(_ configuration: UIButton.Configuration?) -> Self {
        wrapped.configuration = configuration
        return self
    }
    
    @discardableResult
    func automaticallyUpdatesConfiguration(_ value: Bool) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.automaticallyUpdatesConfiguration = value
        }
        return self
    }
    
    @discardableResult
    func updateConfiguration() -> Self {
        if #available(iOS 15.0, *) {
            wrapped.setNeedsUpdateConfiguration()
        }
        return self
    }
    
    @discardableResult
    func configurationUpdateHandler(_ handler: ((UIButton) -> Void)?) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.configurationUpdateHandler = handler
        }
        return self
    }
    
    @available(iOS 15.0, *)
    @discardableResult
    func preferredBehavioralStyle(_ style: UIBehavioralStyle) -> Self {
        wrapped.preferredBehavioralStyle = style
        return self
    }
    
    @discardableResult
    func changesSelectionAsPrimaryAction(_ value: Bool) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.changesSelectionAsPrimaryAction = value
        }
        return self
    }
    
}
