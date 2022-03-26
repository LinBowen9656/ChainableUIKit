//
//  UICollectionViewController+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension ChainableWrapper where Wrapped: UICollectionViewController {
    
    @discardableResult
    func clearsSelectionOnViewWillAppear(_ value: Bool) -> Self {
        wrapped.clearsSelectionOnViewWillAppear = value
        return self
    }
    
    @discardableResult
    func installsStandardGestureForInteractiveMovement(_ value: Bool) -> Self {
        wrapped.installsStandardGestureForInteractiveMovement = value
        return self
    }
    
    @discardableResult
    func useLayoutToLayoutNavigationTransitions(_ value: Bool) -> Self {
        wrapped.useLayoutToLayoutNavigationTransitions = value
        return self
    }
    
}
