//
//  UISplitViewController+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension ChainableWrapper where Wrapped: UISplitViewController {
    
    @available(iOS 14.0, *)
    @discardableResult
    func viewController(_ controller: UIViewController?, column: UISplitViewController.Column) -> Self {
        wrapped.setViewController(controller, for: column)
        return self
    }
    
    @discardableResult
    func viewControllers(_ controllers: [UIViewController]) -> Self {
        wrapped.viewControllers = controllers
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func isShowColumn(_ value: Bool, column: UISplitViewController.Column) -> Self {
        if value {
            wrapped.show(column)
        } else {
            wrapped.hide(column)
        }
        return self
    }
    
    @discardableResult
    func showViewController(_ controller: UIViewController, sender: Any?) -> Self {
        wrapped.show(controller, sender: sender)
        return self
    }
    
    @discardableResult
    func showDetailViewController(_ controller: UIViewController, sender: Any?) -> Self {
        wrapped.showDetailViewController(controller, sender: sender)
        return self
    }
    
    @discardableResult
    func preferredDisplayMode(_ mode: UISplitViewController.DisplayMode) -> Self {
        wrapped.preferredDisplayMode = mode
        return self
    }
    
    @discardableResult
    func presentsWithGesture(_ value: Bool) -> Self {
        wrapped.presentsWithGesture = value
        return self
    }
    
    @discardableResult
    func showsSecondaryOnlyButton(_ value: Bool) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.showsSecondaryOnlyButton = value
        }
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func preferredSplitBehavior(_ behavior: UISplitViewController.SplitBehavior) -> Self {
        wrapped.preferredSplitBehavior = behavior
        return self
    }
    
    @discardableResult
    func preferredPrimaryColumnWidthFraction(_ fraction: CGFloat) -> Self {
        wrapped.preferredPrimaryColumnWidthFraction = fraction
        return self
    }
    
    @discardableResult
    func preferredPrimaryColumnWidth(_ width: CGFloat) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.preferredPrimaryColumnWidth = width
        }
        return self
    }
    
    @discardableResult
    func minimumPrimaryColumnWidth(_ width: CGFloat) -> Self {
        wrapped.minimumPrimaryColumnWidth = width
        return self
    }
    
    @discardableResult
    func maximumPrimaryColumnWidth(_ width: CGFloat) -> Self {
        wrapped.maximumPrimaryColumnWidth = width
        return self
    }
    
    @discardableResult
    func preferredSupplementaryColumnWidthFraction(_ fraction: CGFloat) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.preferredSupplementaryColumnWidthFraction = fraction
        }
        return self
    }
    
    @discardableResult
    func preferredSupplementaryColumnWidth(_ width: CGFloat) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.preferredSupplementaryColumnWidth = width
        }
        return self
    }
    
    @discardableResult
    func minimumSupplementaryColumnWidth(_ width: CGFloat) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.minimumSupplementaryColumnWidth = width
        }
        return self
    }
    
    @discardableResult
    func maximumSupplementaryColumnWidth(_ width: CGFloat) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.maximumSupplementaryColumnWidth = width
        }
        return self
    }
    
    @discardableResult
    func primaryEdge(_ edge: UISplitViewController.PrimaryEdge) -> Self {
        wrapped.primaryEdge = edge
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func primaryBackgroundStyle(_ style: UISplitViewController.BackgroundStyle) -> Self {
        wrapped.primaryBackgroundStyle = style
        return self
    }
    
}
