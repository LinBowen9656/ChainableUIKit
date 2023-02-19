//
//  UIViewController+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/4.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIViewController {
    
    @discardableResult
    func title(_ title: String?) -> Self {
        wrapped.title = title
        return self
    }
    
    @discardableResult
    func preferredContentSize(_ size: CGSize) -> Self {
        wrapped.preferredContentSize = size
        return self
    }
    
    @discardableResult
    func additionalSafeAreaInsets(_ insets: UIEdgeInsets) -> Self {
        wrapped.additionalSafeAreaInsets = insets
        return self
    }
    
    @discardableResult
    func viewRespectsSystemMinimumLayoutMargins(_ value: Bool) -> Self {
        wrapped.viewRespectsSystemMinimumLayoutMargins = value
        return self
    }
    
    @discardableResult
    func edgesForExtendedLayout(_ value: UIRectEdge) -> Self {
        wrapped.edgesForExtendedLayout = value
        return self
    }
    
    @discardableResult
    func extendedLayoutIncludesOpaqueBars(_ value: Bool) -> Self {
        wrapped.extendedLayoutIncludesOpaqueBars = value
        return self
    }
    
    @discardableResult
    func pushByNavigationController(_ navigationController: UINavigationController?, isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> Self {
        navigationController?.pushViewController(wrapped, isAnimated: isAnimated, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func showByViewController(_ controller: UIViewController, sender: Any? = nil, completionHandler: (() -> Void)? = nil) -> Self {
        controller.show(viewController: wrapped, sender: sender, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func showDetailByViewController(_ controller: UIViewController, sender: Any? = nil, completionHandler: (() -> Void)? = nil) -> Self {
        controller.showDetail(viewController: wrapped, sender: sender, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func presentByViewController(_ controller: UIViewController, isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> Self {
        controller.present(wrapped, animated: isAnimated, completion: completionHandler)
        return self
    }
    
    @discardableResult
    func show(viewController: UIViewController, sender: Any? = nil, completionHandler: (() -> Void)? = nil) -> Self {
        wrapped.show(viewController: viewController, sender: sender, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func showDetail(viewController: UIViewController, sender: Any? = nil, completionHandler: (() -> Void)? = nil) -> Self {
        wrapped.showDetail(viewController: viewController, sender: sender, completionHandler: completionHandler)
        return self
    }
    
    @discardableResult
    func present(_ controller: UIViewController, isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> Self {
        wrapped.present(controller, animated: isAnimated, completion: completionHandler)
        return self
    }
    
    @discardableResult
    func dismiss(isAnimated: Bool = true, completionHandler: (() -> Void)? = nil) -> Self {
        wrapped.dismiss(animated: isAnimated, completion: completionHandler)
        return self
    }
    
    @discardableResult
    func modalPresentationStyle(_ style: UIModalPresentationStyle) -> Self {
        wrapped.modalPresentationStyle = style
        return self
    }
    
    @discardableResult
    func modalTransitionStyle(_ style: UIModalTransitionStyle) -> Self {
        wrapped.modalTransitionStyle = style
        return self
    }
    
    @discardableResult
    func isModalInPresentation(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.isModalInPresentation = value
        }
        return self
    }
    
    @discardableResult
    func definesPresentationContext(_ value: Bool) -> Self {
        wrapped.definesPresentationContext = value
        return self
    }
    
    @discardableResult
    func providesPresentationContextTransitionStyle(_ value: Bool) -> Self {
        wrapped.providesPresentationContextTransitionStyle = value
        return self
    }
    
    @discardableResult
    func restoresFocusAfterTransition(_ value: Bool) -> Self {
        wrapped.restoresFocusAfterTransition = value
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func overrideUserInterfaceStyle(_ style: UIUserInterfaceStyle) -> Self {
        wrapped.overrideUserInterfaceStyle = style
        return self
    }
    
    @discardableResult
    func addChildViewController(_ controller: UIViewController) -> Self {
        wrapped.addChild(controller)
        return self
    }
    
    @discardableResult
    func removeFromParentViewController() -> Self {
        wrapped.removeFromParent()
        return self
    }
    
    @discardableResult
    func overrideTraitCollection(_ collection: UITraitCollection?, childViewController: UIViewController) -> Self {
        wrapped.setOverrideTraitCollection(collection, forChild: childViewController)
        return self
    }
    
    @discardableResult
    func hidesBottomBarWhenPushed(_ value: Bool) -> Self {
        wrapped.hidesBottomBarWhenPushed = value
        return self
    }
    
    @discardableResult
    func toolbarItems(_ items: [UIBarButtonItem]?, isAnimated: Bool = false) -> Self {
        wrapped.setToolbarItems(items, animated: isAnimated)
        return self
    }
    
    @available(iOS 15.0, *)
    @discardableResult
    func contentScrollView(_ scrollView: UIScrollView?, for edge: NSDirectionalRectEdge) -> Self {
        wrapped.setContentScrollView(scrollView, for: edge)
        return self
    }
    
    @discardableResult
    func updateScreenEdgesDeferringSystemGestures() -> Self {
        wrapped.setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
        return self
    }
    
    @discardableResult
    func updateHomeIndicatorAutoHidden() -> Self {
        wrapped.setNeedsUpdateOfHomeIndicatorAutoHidden()
        return self
    }
    
    @discardableResult
    func modalPresentationCapturesStatusBarAppearance(_ value: Bool) -> Self {
        wrapped.modalPresentationCapturesStatusBarAppearance = value
        return self
    }
    
    @discardableResult
    func updateStatusBarAppearance() -> Self {
        wrapped.setNeedsStatusBarAppearanceUpdate()
        return self
    }
    
    @discardableResult
    func isEditing(_ value: Bool, isAnimated: Bool = true) -> Self {
        wrapped.setEditing(value, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func restorationIdentifier(_ identifier: String?) -> Self {
        wrapped.restorationIdentifier = identifier
        return self
    }
    
    @discardableResult
    func restorationClass(_ restorationClass: UIViewControllerRestoration.Type?) -> Self {
        
        wrapped.restorationClass = restorationClass
        return self
    }
    
}
