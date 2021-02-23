//
//  UICollectionView+UIKitUtils.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
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
    
    func cacheCollectionViewCellSize(size: CGSize, id: AnyHashable) {
        guard frame.size.width > 0 && frame.size.height > 0 && size.width.isFinite && size.height.isFinite else { return }
        if collectionViewSizeCache["\(frame.width)*\(frame.height)"] == nil {
            collectionViewSizeCache["\(frame.width)*\(frame.height)"] = [:]
        }
        collectionViewSizeCache["\(frame.width)*\(frame.height)"]?[id] = size
    }
    
    func getCollectionViewCacheSize(id: AnyHashable) -> CGSize? {
        guard frame.size.width > 0 && frame.size.height > 0, let cacheSize = collectionViewSizeCache["\(frame.width)*\(frame.height)"]?[id] else { return nil }
        return cacheSize
    }
    
    func invalidateSizeCache(ids: [AnyHashable]) {
        for size in collectionViewSizeCache.keys {
            for id in ids {
                collectionViewSizeCache[size]?[id] = nil
            }
        }
    }
    
    func invalidateAllSizeCache() {
        collectionViewSizeCache = [:]
    }
    
    func flexibleItemFillWidth(minWidth: CGFloat, inset: CGFloat, minSpacing: CGFloat) -> CGFloat {
        let availableWidth = bounds.inset(by: safeAreaInsets).width - inset
        let maxNumColumns = ((availableWidth + minSpacing) / (minWidth + minSpacing)).rounded(.down)
        return ((availableWidth - (maxNumColumns - 1) * minSpacing) / maxNumColumns).rounded(.down)
    }
    
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
