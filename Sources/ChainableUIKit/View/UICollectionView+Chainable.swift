//
//  UICollectionView+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/4.
//

import UIKit

public extension ChainableWrapper where Wrapped: UICollectionView {
    
    @discardableResult
    func isPrefetchingEnabled(_ value: Bool) -> Self {
        wrapped.isPrefetchingEnabled = value
        return self
    }
    
    @discardableResult
    func registerCell(cellClass: UICollectionViewCell.Type, reuseIdentifier: String) -> Self {
        wrapped.register(cellClass, forCellWithReuseIdentifier: reuseIdentifier)
        return self
    }
    
    @discardableResult
    func registerCell(nib: UINib, reuseIdentifier: String) -> Self {
        wrapped.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        return self
    }
    
    @discardableResult
    func registerSupplementaryView(viewClass: UIView.Type, kind: String, reuseIdentifier: String) -> Self {
        wrapped.register(viewClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIdentifier)
        return self
    }
    
    @discardableResult
    func registerSupplementaryView(nib: UINib, kind: String, reuseIdentifier: String) -> Self {
        wrapped.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIdentifier)
        return self
    }
    
    @discardableResult
    func backgroundView(_ view: UIView?) -> Self {
        wrapped.backgroundView = view
        return self
    }
    
    @discardableResult
    func collectionViewLayout(_ layout: UICollectionViewLayout, isAnimated: Bool = false, completionHandler: ((Bool) -> Void)? = nil) -> Self {
        wrapped.setCollectionViewLayout(layout, animated: isAnimated, completion: completionHandler)
        return self
    }
    
    private var isCollectionViewEmpty: Bool {
        let numberOfSections = wrapped.numberOfSections
        guard numberOfSections != 0 else { return true }
        for section in 0..<numberOfSections {
            guard wrapped.numberOfItems(inSection: section) == 0 else { return false }
        }
        return true
    }
    
    @discardableResult
    func update(operation: DataSourceOperation, isAnimated: Bool = true, emptyViewHandler: ((UIView) -> Void)? = nil, completionHandler: ((Bool) -> Void)? = nil) -> Self {
        wrapped.viewWithTag(.max)?.removeFromSuperview()
        func handler(isFinished: Bool) -> Void {
            if let emptyViewHandler = emptyViewHandler, isCollectionViewEmpty {
                let emptyBackgroundView = UIView()
                emptyBackgroundView.tag = .max
                emptyBackgroundView.frame.size = wrapped.bounds.size
                emptyBackgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                wrapped.insertSubview(emptyBackgroundView, at: 0)
                emptyViewHandler(emptyBackgroundView)
            }
            completionHandler?(isFinished)
        }
        switch operation {
        case .diff(let diffOperations):
            if wrapped.window == nil {
                if !diffOperations.isEmpty {
                    wrapped.reloadData()
                }
                handler(isFinished: true)
            } else {
                if isAnimated {
                    wrapped.performBatchUpdates({
                        diffOperations.forEach { diffOperation in
                            switch diffOperation {
                            case .insertSections(let indexSet):
                                wrapped.insertSections(indexSet)
                            case .deleteSections(let indexSet):
                                wrapped.deleteSections(indexSet)
                            case .updateSections(let indexSet):
                                wrapped.reloadSections(indexSet)
                            case .moveSections(let indexs):
                                indexs.forEach { (atIndex, toIndex) in
                                    wrapped.moveSection(atIndex, toSection: toIndex)
                                }
                            case .insert(let indexPaths):
                                wrapped.insertItems(at: indexPaths)
                            case .delete(let indexPaths):
                                wrapped.deleteItems(at: indexPaths)
                            case .update(let indexPaths):
                                wrapped.reloadItems(at: indexPaths)
                            case .move(let indexPaths):
                                indexPaths.forEach { (atIndexPath, toIndexPath) in
                                    wrapped.moveItem(at: atIndexPath, to: toIndexPath)
                                }
                            }
                        }
                    }, completion: handler)
                } else {
                    UIView.performWithoutAnimation {
                        wrapped.performBatchUpdates({
                            diffOperations.forEach { diffOperation in
                                switch diffOperation {
                                case .insertSections(let indexSet):
                                    wrapped.insertSections(indexSet)
                                case .deleteSections(let indexSet):
                                    wrapped.deleteSections(indexSet)
                                case .updateSections(let indexSet):
                                    wrapped.reloadSections(indexSet)
                                case .moveSections(let indexs):
                                    indexs.forEach { (atIndex, toIndex) in
                                        wrapped.moveSection(atIndex, toSection: toIndex)
                                    }
                                case .insert(let indexPaths):
                                    wrapped.insertItems(at: indexPaths)
                                case .delete(let indexPaths):
                                    wrapped.deleteItems(at: indexPaths)
                                case .update(let indexPaths):
                                    wrapped.reloadItems(at: indexPaths)
                                case .move(let indexPaths):
                                    indexPaths.forEach { (atIndexPath, toIndexPath) in
                                        wrapped.moveItem(at: atIndexPath, to: toIndexPath)
                                    }
                                }
                            }
                        }, completion: handler)
                    }
                }
            }
        case .reload:
            wrapped.reloadData()
            handler(isFinished: true)
        }
        return self
    }
    
    @discardableResult
    func reloadEmptyView(handler: (UIView) -> Void) -> Self {
        wrapped.viewWithTag(.max)?.removeFromSuperview()
        if isCollectionViewEmpty {
            let emptyBackgroundView = UIView()
            emptyBackgroundView.tag = .max
            emptyBackgroundView.frame.size = wrapped.bounds.size
            emptyBackgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            wrapped.insertSubview(emptyBackgroundView, at: 0)
            handler(emptyBackgroundView)
        }
        return self
    }
    
    @discardableResult
    func dragInteractionEnabled(_ value: Bool) -> Self {
        wrapped.dragInteractionEnabled = value
        return self
    }
    
    @discardableResult
    func reorderingCadence(_ value: UICollectionView.ReorderingCadence) -> Self {
        wrapped.reorderingCadence = value
        return self
    }
    
    @discardableResult
    func selectItem(indexPath: IndexPath?, isAnimated: Bool = true, scrollPosition: UICollectionView.ScrollPosition) -> Self {
        wrapped.selectItem(at: indexPath, animated: isAnimated, scrollPosition: scrollPosition)
        return self
    }
    
    @discardableResult
    func deselectItem(indexPath: IndexPath, isAnimated: Bool = true) -> Self {
        wrapped.deselectItem(at: indexPath, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func allowsSelection(_ value: Bool) -> Self {
        wrapped.allowsSelection = value
        return self
    }
    
    @discardableResult
    func allowsMultipleSelection(_ value: Bool) -> Self {
        wrapped.allowsMultipleSelection = value
        return self
    }
    
    @discardableResult
    func allowsSelectionDuringEditing(_ value: Bool) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.allowsSelectionDuringEditing = value
        }
        return self
    }
    
    @discardableResult
    func allowsMultipleSelectionDuringEditing(_ value: Bool) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.allowsMultipleSelectionDuringEditing = value
        }
        return self
    }
    
    @discardableResult
    func remembersLastFocusedIndexPath(_ value: Bool) -> Self {
        wrapped.remembersLastFocusedIndexPath = value
        return self
    }
    
    @discardableResult
    func selectionFollowsFocus(_ value: Bool) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.selectionFollowsFocus = value
        }
        return self
    }
    
    @discardableResult
    func scrollToItem(_ indexPath: IndexPath, scrollPosition: UICollectionView.ScrollPosition, isAnimated: Bool = true) -> Self {
        wrapped.scrollToItem(at: indexPath, at: scrollPosition, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func scrollToLastItem(isAnimated: Bool = true) -> Self {
        let numberOfSections = wrapped.numberOfSections
        guard numberOfSections > 0 else { return self }
        for index in 1...numberOfSections {
            let numberOfItems = wrapped.numberOfItems(inSection: numberOfSections - index)
            if numberOfItems > 0 {
                wrapped.scrollToItem(at: IndexPath(item: numberOfItems - 1, section: numberOfSections - index), at: .bottom, animated: isAnimated)
                break
            }
        }
        return self
    }
    
    @discardableResult
    func reconfigureItems(at indexPaths: [IndexPath]) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.reconfigureItems(at: indexPaths)
        }
        return self
    }
    
    @discardableResult
    func allowsFocus(_ value: Bool) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.allowsFocus = value
        }
        return self
    }
    
    @discardableResult
    func allowsFocusDuringEditing(_ value: Bool) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.allowsFocusDuringEditing = value
        }
        return self
    }
    
}
