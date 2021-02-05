//
//  UICollectionViewController+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

public extension ChainableWrapper where Wrapped: UICollectionViewController {
    
    @discardableResult
    func isClearsSelectionOnViewWillAppear(_ value: Bool) -> Self {
        wrapped.clearsSelectionOnViewWillAppear = value
        return self
    }
    
    @discardableResult
    func isInstallsStandardGestureForInteractiveMovement(_ value: Bool) -> Self {
        wrapped.installsStandardGestureForInteractiveMovement = value
        return self
    }
    
    @discardableResult
    func isUseLayoutToLayoutNavigationTransitions(_ value: Bool) -> Self {
        wrapped.useLayoutToLayoutNavigationTransitions = value
        return self
    }
    
}
