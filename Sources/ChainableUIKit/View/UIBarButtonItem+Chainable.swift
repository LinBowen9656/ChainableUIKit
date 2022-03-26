//
//  UIBarButtonItem+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIBarButtonItem {
    
    @discardableResult
    func addTarget(target: AnyObject?, action: Selector?) -> Self {
        wrapped.target = target
        wrapped.action = action
        return self
    }
    
    @discardableResult
    func style(_ style: UIBarButtonItem.Style) -> Self {
        wrapped.style = style
        return self
    }
    
    @discardableResult
    func possibleTitles(_ titles: Set<String>?) -> Self {
        wrapped.possibleTitles = titles
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> Self {
        wrapped.width = width
        return self
    }
    
    @discardableResult
    func customView(_ view: UIView?) -> Self {
        wrapped.customView = view
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func menu(_ menu: UIMenu) -> Self {
        wrapped.menu = menu
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func primaryAction(_ action: UIAction) -> Self {
        wrapped.primaryAction = action
        return self
    }
    
    @discardableResult
    func tintColor(_ color: UIColor?) -> Self {
        wrapped.tintColor = color
        return self
    }
    
    @discardableResult
    func backButtonBackgroundImage(_ image: UIImage?, state: UIControl.State = .normal, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setBackButtonBackgroundImage(image, for: state, barMetrics: barMetrics)
        return self
    }
    
    @discardableResult
    func backButtonTitlePositionAdjustment(_ offset: UIOffset, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setBackButtonTitlePositionAdjustment(offset, for: barMetrics)
        return self
    }
    
    @discardableResult
    func backButtonBackgroundVerticalPositionAdjustment(_ offset: CGFloat, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setBackButtonBackgroundVerticalPositionAdjustment(offset, for: barMetrics)
        return self
    }
    
    @discardableResult
    func backgroundVerticalPositionAdjustment(_ offset: CGFloat, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setBackgroundVerticalPositionAdjustment(offset, for: barMetrics)
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?, state: UIControl.State = .normal, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setBackgroundImage(image, for: state, barMetrics: barMetrics)
        return self
    }
    
    @discardableResult
    func titlePositionAdjustment(_ offset: UIOffset, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setTitlePositionAdjustment(offset, for: barMetrics)
        return self
    }
    
    @discardableResult
    func addActionHandler(_ handler: @escaping (Wrapped) -> Void) -> Self {
        wrapped.addActionHandler { barButtonItem in
            handler(barButtonItem as! Wrapped)
        }
        return self
    }
    
    @discardableResult
    func removeActionHandler() -> Self {
        wrapped.removeActionHandler()
        return self
    }
    
    @discardableResult
    func changesSelectionAsPrimaryAction(_ value: Bool) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.changesSelectionAsPrimaryAction = value
        }
        return self
    }
    
    @discardableResult
    func isSelected(_ value: Bool) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.isSelected = value
        }
        return self
    }
    
}
