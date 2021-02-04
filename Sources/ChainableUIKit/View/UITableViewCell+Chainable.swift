//
//  UITableViewCell+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/4.
//

import UIKit

public extension ChainableWrapper where Wrapped: UITableViewCell {
    
    @available(iOS 14.0, *)
    @discardableResult
    func backgroundConfiguration(_ configuration: UIBackgroundConfiguration?) -> Self {
        wrapped.backgroundConfiguration = configuration
        return self
    }
    
    @discardableResult
    func isAutomaticallyUpdatesBackgroundConfiguration(_ value: Bool) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.automaticallyUpdatesBackgroundConfiguration = value
        }
        return self
    }
    
    @discardableResult
    func backgroundView(_ view: UIView?) -> Self {
        wrapped.backgroundView = view
        return self
    }
    
    @discardableResult
    func selectedBackgroundView(_ view: UIView?) -> Self {
        wrapped.selectedBackgroundView = view
        return self
    }
    
    @discardableResult
    func multipleSelectionBackgroundView(_ view: UIView?) -> Self {
        wrapped.multipleSelectionBackgroundView = view
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func contentConfiguration(_ configuration: UIContentConfiguration?) -> Self {
        wrapped.contentConfiguration = configuration
        return self
    }
    
    @discardableResult
    func isAutomaticallyUpdatesContentConfiguration(_ value: Bool) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.automaticallyUpdatesContentConfiguration = value
        }
        return self
    }
    
    @discardableResult
    func accessoryType(_ type: UITableViewCell.AccessoryType) -> Self {
        wrapped.accessoryType = type
        return self
    }
    
    @discardableResult
    func accessoryView(_ view: UIView?) -> Self {
        wrapped.accessoryView = view
        return self
    }
    
    @discardableResult
    func editingAccessoryType(_ type: UITableViewCell.AccessoryType) -> Self {
        wrapped.editingAccessoryType = type
        return self
    }
    
    @discardableResult
    func editingAccessoryView(_ view: UIView?) -> Self {
        wrapped.editingAccessoryView = view
        return self
    }
    
    @discardableResult
    func selectionStyle(_ style: UITableViewCell.SelectionStyle) -> Self {
        wrapped.selectionStyle = style
        return self
    }
    
    @discardableResult
    func isSelected(_ value: Bool, isAnimated: Bool = false) -> Self {
        wrapped.setSelected(value, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func isHighlighted(_ value: Bool, isAnimated: Bool = false) -> Self {
        wrapped.setHighlighted(value, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func isShowsReorderControl(_ value: Bool) -> Self {
        wrapped.showsReorderControl = value
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabledWhileDragging(_ value: Bool) -> Self {
        wrapped.userInteractionEnabledWhileDragging = value
        return self
    }
    
    @discardableResult
    func indentationLevel(_ level: Int) -> Self {
        wrapped.indentationLevel = level
        return self
    }
    
    @discardableResult
    func indentationWidth(_ width: CGFloat) -> Self {
        wrapped.indentationWidth = width
        return self
    }
    
    @discardableResult
    func separatorInset(_ insets: UIEdgeInsets) -> Self {
        wrapped.separatorInset = insets
        return self
    }
    
    @discardableResult
    func isShouldIndentWhileEditing(_ value: Bool) -> Self {
        wrapped.shouldIndentWhileEditing = value
        return self
    }
    
    @discardableResult
    func focusStyle(_ style: UITableViewCell.FocusStyle) -> Self {
        wrapped.focusStyle = style
        return self
    }
    
}
