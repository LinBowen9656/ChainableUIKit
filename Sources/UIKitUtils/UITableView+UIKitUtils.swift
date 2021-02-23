//
//  UITableView+UIKitUtils.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

private var tableViewHeightCacheKey: Void?

public extension UITableView {
    
    private var tableViewHeightCache: [CGFloat: [AnyHashable: CGFloat]] {
        get {
            guard let sizeCaches = objc_getAssociatedObject(self, &tableViewHeightCacheKey) as? [CGFloat: [AnyHashable: CGFloat]] else {
                return [CGFloat: [AnyHashable: CGFloat]]()
            }
            return sizeCaches
        }
        set {
            objc_setAssociatedObject(self, &tableViewHeightCacheKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func cacheTableViewCellHeight(cell: UITableViewCell, id: AnyHashable) {
        guard frame.size.width > 0 && frame.size.height > 0 && cell.frame.height.isFinite else { return }
        if tableViewHeightCache[frame.width] == nil {
            tableViewHeightCache[frame.width] = [:]
        }
        tableViewHeightCache[frame.width]?[id] = cell.frame.height
    }
    
    func getTableViewCacheHeight(id: AnyHashable) -> CGFloat {
        guard frame.size.width > 0 && frame.size.height > 0, let cacheHeight = tableViewHeightCache[frame.width]?[id] else { return UITableView.automaticDimension }
        return cacheHeight
    }
    
    func invalidateHeightCache(id: AnyHashable) {
        for height in tableViewHeightCache.keys {
            tableViewHeightCache[height]?[id] = nil
        }
    }
    
    func invalidateAllHeightCache() {
        tableViewHeightCache = [:]
    }
    
    func clearSelectionWhenViewWillAppear(transitionCoordinator: UIViewControllerTransitionCoordinator?) {
        if let selectedIndexPath = indexPathForSelectedRow {
            if let coordinator = transitionCoordinator {
                coordinator.animate { _ in
                    self.deselectRow(at: selectedIndexPath, animated: true)
                } completion: { context in
                    if context.isCancelled {
                        self.selectRow(at: selectedIndexPath, animated: false, scrollPosition: .none)
                    }
                }
            } else {
                deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
    
}
