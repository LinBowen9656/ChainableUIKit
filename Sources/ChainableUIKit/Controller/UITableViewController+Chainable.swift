//
//  UITableViewController+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension ChainableWrapper where Wrapped: UITableViewController {
    
    @discardableResult
    func clearsSelectionOnViewWillAppear(_ value: Bool) -> Self {
        wrapped.clearsSelectionOnViewWillAppear = value
        return self
    }
    
    @discardableResult
    func refreshControl(_ refreshControl: UIRefreshControl) -> Self {
        wrapped.refreshControl = refreshControl
        return self
    }
    
}
