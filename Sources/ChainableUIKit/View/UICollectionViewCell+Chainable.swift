//
//  UICollectionViewCell+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/4.
//

import UIKit

public extension ChainableWrapper where Wrapped: UICollectionViewCell {
    
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
    func isSelected(_ value: Bool) -> Self {
        wrapped.isSelected = value
        return self
    }
    
    @discardableResult
    func isHighlighted(_ value: Bool) -> Self {
        wrapped.isHighlighted = value
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func configurationUpdateHandler(_ handler: ((_ cell: UICollectionViewCell, _ state: UICellConfigurationState) -> Void)?) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.configurationUpdateHandler = handler
        }
        return self
    }
    
}
