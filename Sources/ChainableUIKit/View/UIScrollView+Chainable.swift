//
//  UIScrollView+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/1/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIScrollView {
    
    @discardableResult
    func isScrollEnabled(_ value: Bool) -> Self {
        wrapped.isScrollEnabled = value
        return self
    }
    
    @discardableResult
    func isDirectionalLockEnabled(_ value: Bool) -> Self {
        wrapped.isDirectionalLockEnabled = value
        return self
    }
    
    @discardableResult
    func contentOffset(_ offset: CGPoint, isAnimated: Bool = true) -> Self {
        wrapped.setContentOffset(offset, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func contentSize(_ size: CGSize) -> Self {
        wrapped.contentSize = size
        return self
    }
    
    @discardableResult
    func contentInset(_ insets: UIEdgeInsets) -> Self {
        wrapped.contentInset = insets
        return self
    }
    
    @discardableResult
    func contentInsetAdjustmentBehavior(_ behavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        wrapped.contentInsetAdjustmentBehavior = behavior
        return self
    }
    
    @discardableResult
    func isPagingEnabled(_ value: Bool) -> Self {
        wrapped.isPagingEnabled = value
        return self
    }
    
    @discardableResult
    func isCanScrollsToTop(_ value: Bool) -> Self {
        wrapped.scrollsToTop = value
        return self
    }
    
    @discardableResult
    func isBounces(_ value: Bool) -> Self {
        wrapped.bounces = value
        return self
    }
    
    @discardableResult
    func isAlwaysBounceVertical(_ value: Bool) -> Self {
        wrapped.alwaysBounceVertical = value
        return self
    }
    
    @discardableResult
    func isAlwaysBounceHorizontal(_ value: Bool) -> Self {
        wrapped.alwaysBounceHorizontal = value
        return self
    }
    
    @discardableResult
    func decelerationRate(_ rate: UIScrollView.DecelerationRate) -> Self {
        wrapped.decelerationRate = rate
        return self
    }
    
    @discardableResult
    func indicatorStyle(_ style: UIScrollView.IndicatorStyle) -> Self {
        wrapped.indicatorStyle = style
        return self
    }
    
    @discardableResult
    func isShowsHorizontalScrollIndicator(_ value: Bool) -> Self {
        wrapped.showsHorizontalScrollIndicator = value
        return self
    }
    
    @discardableResult
    func isShowsVerticalScrollIndicator(_ value: Bool) -> Self {
        wrapped.showsVerticalScrollIndicator = value
        return self
    }
    
    @discardableResult
    func refreshControl(_ refreshControl: UIRefreshControl) -> Self {
        wrapped.refreshControl = refreshControl
        return self
    }
    
    @discardableResult
    func visibleRect(_ rect: CGRect, isAnimated: Bool = true) -> Self {
        wrapped.scrollRectToVisible(rect, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func zoomScale(_ scale: CGFloat, isAnimated: Bool = true) -> Self {
        wrapped.setZoomScale(scale, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func isBouncesZoom(_ value: Bool) -> Self {
        wrapped.bouncesZoom = value
        return self
    }
    
    @discardableResult
    func maximumZoomScale(_ scale: CGFloat) -> Self {
        wrapped.maximumZoomScale = scale
        return self
    }
    
    @discardableResult
    func minimumZoomScale(_ scale: CGFloat) -> Self {
        wrapped.minimumZoomScale = scale
        return self
    }
    
    @discardableResult
    func keyboardDismissMode(_ mode: UIScrollView.KeyboardDismissMode) -> Self {
        wrapped.keyboardDismissMode = mode
        return self
    }
    
    @discardableResult
    func indexDisplayMode(_ mode: UIScrollView.IndexDisplayMode) -> Self {
        wrapped.indexDisplayMode = mode
        return self
    }
    
    @discardableResult
    func isAutomaticallyAdjustsScrollIndicatorInsets(_ value: Bool) -> Self {
        if #available(iOS 13.0, *) {
            wrapped.automaticallyAdjustsScrollIndicatorInsets = value
        }
        return self
    }
    
    @discardableResult
    func horizontalScrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        if #available(iOS 11.1, *) {
            wrapped.horizontalScrollIndicatorInsets = insets
        } else {
            wrapped.scrollIndicatorInsets = insets
        }
        return self
    }
    
    @discardableResult
    func verticalScrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        if #available(iOS 11.1, *) {
            wrapped.verticalScrollIndicatorInsets = insets
        } else {
            wrapped.scrollIndicatorInsets = insets
        }
        return self
    }
    
    @discardableResult
    func scrollToTop(isAnimated: Bool = true) -> Self {
        let inset: UIEdgeInsets
        inset = wrapped.adjustedContentInset
        wrapped.setContentOffset(CGPoint(x: -inset.left, y: -inset.top), animated: isAnimated)
        return self
    }
    
    @discardableResult
    func scrollToBottom(isAnimated: Bool = true) -> Self {
        let inset: UIEdgeInsets
        inset = wrapped.adjustedContentInset
        guard (wrapped.contentSize.height + inset.top + inset.bottom) > wrapped.bounds.height else { return self }
        wrapped.setContentOffset(CGPoint(x: wrapped.contentOffset.x, y: wrapped.contentSize.height + inset.bottom - wrapped.bounds.height), animated: isAnimated)
        return self
    }
    
    @discardableResult
    func stopDecelerating() -> Self {
        if wrapped.isDecelerating {
            wrapped.setContentOffset(wrapped.contentOffset, animated: false)
        }
        return self
    }
    
}
