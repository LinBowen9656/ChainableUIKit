//
//  UIPageControl+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIPageControl {
    
    @discardableResult
    func currentPage(_ page: Int) -> Self {
        wrapped.currentPage = page
        return self
    }
    
    @discardableResult
    func numberOfPages(_ value: Int) -> Self {
        wrapped.numberOfPages = value
        return self
    }
    
    @discardableResult
    func isHidesForSinglePage(_ value: Bool) -> Self {
        wrapped.hidesForSinglePage = value
        return self
    }
    
    @discardableResult
    func pageIndicatorTintColor(_ color: UIColor?) -> Self {
        wrapped.pageIndicatorTintColor = color
        return self
    }
    
    @discardableResult
    func currentPageIndicatorTintColor(_ color: UIColor?) -> Self {
        wrapped.currentPageIndicatorTintColor = color
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func backgroundStyle(_ style: UIPageControl.BackgroundStyle) -> Self {
        wrapped.backgroundStyle = style
        return self
    }
    
    @discardableResult
    func isAllowsContinuousInteraction(_ value: Bool) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.allowsContinuousInteraction = value
        }
        return self
    }
    
    @discardableResult
    func preferredIndicatorImage(_ image: UIImage?) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.preferredIndicatorImage = image
        }
        return self
    }
    
    @discardableResult
    func indicatorImage(_ image: UIImage?, page: Int) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.setIndicatorImage(image, forPage: page)
        }
        return self
    }
    
}
