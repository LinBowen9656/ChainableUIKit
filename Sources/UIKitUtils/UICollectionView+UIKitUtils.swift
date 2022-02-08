//
//  UICollectionView+UIKitUtils.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

private var collectionViewSizeCacheKey: Void?

public extension UICollectionView {
    
    private var collectionViewSizeCache: [String: [AnyHashable: CGSize]] {
        get {
            guard let sizeCaches = objc_getAssociatedObject(self, &collectionViewSizeCacheKey) as? [String: [AnyHashable: CGSize]] else {
                return [String: [AnyHashable: CGSize]]()
            }
            return sizeCaches
        }
        set {
            objc_setAssociatedObject(self, &collectionViewSizeCacheKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// Cache the cell size.
    /// - Parameters:
    ///   - cell: The cell you want to cache size.
    ///   - id: The ID associated with size.
    func cacheCollectionViewCellSize(size: CGSize, id: AnyHashable) {
        guard frame.size.width > 0 && frame.size.height > 0 && size.width.isFinite && size.height.isFinite else { return }
        if collectionViewSizeCache["\(frame.width)*\(frame.height)"] == nil {
            collectionViewSizeCache["\(frame.width)*\(frame.height)"] = [:]
        }
        collectionViewSizeCache["\(frame.width)*\(frame.height)"]?[id] = size
    }
    
    /// Get the size cache of ID.
    /// - Parameter id: The ID which you want to get size cache.
    /// - Returns: The size cache of ID.
    func getCollectionViewCacheSize(id: AnyHashable) -> CGSize? {
        guard frame.size.width > 0 && frame.size.height > 0, let cacheSize = collectionViewSizeCache["\(frame.width)*\(frame.height)"]?[id] else { return nil }
        return cacheSize
    }
    
    /// Clear the cache of ID.
    /// - Parameter ids: The ID which you want to clear size cache.
    func invalidateSizeCache(ids: [AnyHashable]) {
        for collectionViewSize in collectionViewSizeCache.keys {
            for id in ids {
                collectionViewSizeCache[collectionViewSize]?[id] = nil
            }
        }
    }
    
    /// Clear cache.
    func invalidateAllSizeCache() {
        collectionViewSizeCache = [:]
    }
    
    /// Get the item width when needs to fill collection view.
    /// - Parameters:
    ///   - minWidth: Item minimum width.
    ///   - inset: The extra padding need inset the collection view width.
    ///   - minSpacing: The minimum spacing to use between items in the same row.
    /// - Returns: The item width.
    func flexibleItemFillWidth(minWidth: CGFloat, inset: CGFloat, minSpacing: CGFloat) -> CGFloat {
        let availableWidth = max(0, bounds.inset(by: safeAreaInsets).width - inset)
        guard minWidth < availableWidth else { return availableWidth }
        let maxNumColumns = ((availableWidth + minSpacing) / (minWidth + minSpacing)).rounded(.down)
        return ((availableWidth - (maxNumColumns - 1) * minSpacing) / maxNumColumns).rounded(.down)
    }
    
    /// Clear selection when view will appear.
    ///
    /// Call in the `viewWillAppear`.
    /// - Parameter transitionCoordinator: Controller's `transitionCoordinator`.
    func clearSelectionWhenViewWillAppear(transitionCoordinator: UIViewControllerTransitionCoordinator?) {
        if let selectedIndexPaths = indexPathsForSelectedItems {
            if let coordinator = transitionCoordinator {
                coordinator.animate { _ in
                    selectedIndexPaths.forEach { indexPath in
                        self.deselectItem(at: indexPath, animated: true)
                    }
                } completion: { context in
                    if context.isCancelled {
                        selectedIndexPaths.forEach { indexPath in
                            self.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                        }
                    }
                }
            } else {
                selectedIndexPaths.forEach { indexPath in
                    self.deselectItem(at: indexPath, animated: true)
                }
            }
        }
    }
    
}
