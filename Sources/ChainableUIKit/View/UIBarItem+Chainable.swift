//
//  UIBarItem+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

extension UIBarItem: ChainableType {}

public extension ChainableWrapper where Wrapped: UIBarItem {
    
    @discardableResult
    func title(_ title: String?) -> Self {
        wrapped.title = title
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        wrapped.image = image
        return self
    }
    
    @discardableResult
    func imageInsets(_ insets: UIEdgeInsets) -> Self {
        wrapped.imageInsets = insets
        return self
    }
    
    @discardableResult
    func landscapePhoneImage(_ image: UIImage?) -> Self {
        wrapped.landscapeImagePhone = image
        return self
    }
    
    @discardableResult
    func landscapePhoneImageInsets(_ insets: UIEdgeInsets) -> Self {
        wrapped.landscapeImagePhoneInsets = insets
        return self
    }
    
    @discardableResult
    func largeContentSizeImage(_ image: UIImage?) -> Self {
        wrapped.largeContentSizeImage = image
        return self
    }
    
    @discardableResult
    func largeContentSizeImageInsets(_ insets: UIEdgeInsets) -> Self {
        wrapped.largeContentSizeImageInsets = insets
        return self
    }
    
    @discardableResult
    func titleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, state: UIControl.State = .normal) -> Self {
        wrapped.setTitleTextAttributes(attributes, for: state)
        return self
    }
    
}
