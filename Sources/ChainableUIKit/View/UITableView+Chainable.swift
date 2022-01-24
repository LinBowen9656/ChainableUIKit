//
//  UITableView+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/4.
//

import UIKit
import UIKitUtils

public extension ChainableWrapper where Wrapped: UITableView {
    
    @discardableResult
    func registerCell(cellClass: UITableViewCell.Type, reuseIdentifier: String) -> Self {
        wrapped.register(cellClass, forCellReuseIdentifier: reuseIdentifier)
        return self
    }
    
    @discardableResult
    func registerCell(nib: UINib, reuseIdentifier: String) -> Self {
        wrapped.register(nib, forCellReuseIdentifier: reuseIdentifier)
        return self
    }
    
    @discardableResult
    func registerSectionHeaderFooterView(viewClass: UIView.Type, reuseIdentifier: String) -> Self {
        wrapped.register(viewClass, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
        return self
    }
    
    @discardableResult
    func registerSectionHeaderFooterView(nib: UINib, reuseIdentifier: String) -> Self {
        wrapped.register(nib, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
        return self
    }
    
    @discardableResult
    func tableHeaderView(_ view: UIView?) -> Self {
        wrapped.tableHeaderView = view
        return self
    }
    
    @discardableResult
    func tableFooterView(_ view: UIView?) -> Self {
        wrapped.tableFooterView = view
        return self
    }
    
    @discardableResult
    func backgroundView(_ view: UIView?) -> Self {
        wrapped.backgroundView = view
        return self
    }
    
    @discardableResult
    func rowHeight(_ height: CGFloat) -> Self {
        wrapped.rowHeight = height
        return self
    }
    
    @discardableResult
    func estimatedRowHeight(_ height: CGFloat) -> Self {
        wrapped.estimatedRowHeight = height
        return self
    }
    
    @discardableResult
    func isCellLayoutMarginsFollowReadableWidth(_ value: Bool) -> Self {
        wrapped.cellLayoutMarginsFollowReadableWidth = value
        return self
    }
    
    @discardableResult
    func isInsetsContentViewsToSafeArea(_ value: Bool) -> Self {
        wrapped.insetsContentViewsToSafeArea = value
        return self
    }
    
    @discardableResult
    func sectionHeaderHeight(_ height: CGFloat) -> Self {
        wrapped.sectionHeaderHeight = height
        return self
    }
    
    @discardableResult
    func sectionFooterHeight(_ height: CGFloat) -> Self {
        wrapped.sectionFooterHeight = height
        return self
    }
    
    @discardableResult
    func estimatedSectionHeaderHeight(_ height: CGFloat) -> Self {
        wrapped.estimatedSectionHeaderHeight = height
        return self
    }
    
    @discardableResult
    func estimatedSectionFooterHeight(_ height: CGFloat) -> Self {
        wrapped.estimatedSectionFooterHeight = height
        return self
    }
    
    @discardableResult
    func separatorStyle(_ style: UITableViewCell.SeparatorStyle) -> Self {
        wrapped.separatorStyle = style
        return self
    }
    
    @discardableResult
    func separatorColor(_ color: UIColor?) -> Self {
        wrapped.separatorColor = color
        return self
    }
    
    @discardableResult
    func separatorEffect(_ effect: UIVisualEffect?) -> Self {
        wrapped.separatorEffect = effect
        return self
    }
    
    @discardableResult
    func separatorInset(_ insets: UIEdgeInsets) -> Self {
        wrapped.separatorInset = insets
        return self
    }
    
    @discardableResult
    func separatorInsetReference(_ reference: UITableView.SeparatorInsetReference) -> Self {
        wrapped.separatorInsetReference = reference
        return self
    }
    
    @discardableResult
    func selectRow(indexPath: IndexPath?, isAnimated: Bool = true, scrollPosition: UITableView.ScrollPosition) -> Self {
        wrapped.selectRow(at: indexPath, animated: isAnimated, scrollPosition: scrollPosition)
        return self
    }
    
    @discardableResult
    func deselectRow(indexPath: IndexPath, isAnimated: Bool = true) -> Self {
        wrapped.deselectRow(at: indexPath, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func isAllowsSelection(_ value: Bool) -> Self {
        wrapped.allowsSelection = value
        return self
    }
    
    @discardableResult
    func isAllowsMultipleSelection(_ value: Bool) -> Self {
        wrapped.allowsMultipleSelection = value
        return self
    }
    
    @discardableResult
    func isAllowsSelectionDuringEditing(_ value: Bool) -> Self {
        wrapped.allowsSelectionDuringEditing = value
        return self
    }
    
    @discardableResult
    func isAllowsMultipleSelectionDuringEditing(_ value: Bool) -> Self {
        wrapped.allowsMultipleSelectionDuringEditing = value
        return self
    }
    
    @discardableResult
    func isRemembersLastFocusedIndexPath(_ value: Bool) -> Self {
        wrapped.remembersLastFocusedIndexPath = value
        return self
    }
    
    @discardableResult
    func isSelectionFollowsFocus(_ value: Bool) -> Self {
        if #available(iOS 14.0, *) {
            wrapped.selectionFollowsFocus = value
        }
        return self
    }
    
    private var isTableViewEmpty: Bool {
        let numberOfSections = wrapped.numberOfSections
        guard numberOfSections != 0 else { return true }
        for section in 0..<numberOfSections {
            guard wrapped.numberOfRows(inSection: section) == 0 else { return false }
        }
        return true
    }
    
    @discardableResult
    func update(operation: DataSourceOperation, isAnimated: Bool = true, emptyViewHandler: ((UIView) -> Void)? = nil, completionHandler: ((Bool) -> Void)? = nil) -> Self {
        wrapped.viewWithTag(.max)?.removeFromSuperview()
        func handler(isFinished: Bool) -> Void {
            if let emptyViewHandler = emptyViewHandler, isTableViewEmpty {
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
                                wrapped.insertSections(indexSet, with: .automatic)
                            case .deleteSections(let indexSet):
                                wrapped.deleteSections(indexSet, with: .automatic)
                            case .updateSections(let indexSet):
                                wrapped.reloadSections(indexSet, with: .automatic)
                            case .moveSections(let indexs):
                                indexs.forEach { (atIndex, toIndex) in
                                    wrapped.moveSection(atIndex, toSection: toIndex)
                                }
                            case .insert(let indexPaths):
                                wrapped.insertRows(at: indexPaths, with: .automatic)
                            case .delete(let indexPaths):
                                wrapped.deleteRows(at: indexPaths, with: .automatic)
                            case .update(let indexPaths):
                                wrapped.reloadRows(at: indexPaths, with: .automatic)
                            case .move(let indexPaths):
                                indexPaths.forEach { (atIndexPath, toIndexPath) in
                                    wrapped.moveRow(at: atIndexPath, to: toIndexPath)
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
                                    wrapped.insertSections(indexSet, with: .automatic)
                                case .deleteSections(let indexSet):
                                    wrapped.deleteSections(indexSet, with: .automatic)
                                case .updateSections(let indexSet):
                                    wrapped.reloadSections(indexSet, with: .automatic)
                                case .moveSections(let indexs):
                                    indexs.forEach { (atIndex, toIndex) in
                                        wrapped.moveSection(atIndex, toSection: toIndex)
                                    }
                                case .insert(let indexPaths):
                                    wrapped.insertRows(at: indexPaths, with: .automatic)
                                case .delete(let indexPaths):
                                    wrapped.deleteRows(at: indexPaths, with: .automatic)
                                case .update(let indexPaths):
                                    wrapped.reloadRows(at: indexPaths, with: .automatic)
                                case .move(let indexPaths):
                                    indexPaths.forEach { (atIndexPath, toIndexPath) in
                                        wrapped.moveRow(at: atIndexPath, to: toIndexPath)
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
        if isTableViewEmpty {
            let emptyBackgroundView = UIView()
            emptyBackgroundView.tag = .max
            emptyBackgroundView.frame = wrapped.bounds
            emptyBackgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            wrapped.insertSubview(emptyBackgroundView, at: 0)
            handler(emptyBackgroundView)
        }
        return self
    }
    
    @discardableResult
    func sectionIndexMinimumDisplayRowCount(_ value: Int) -> Self {
        wrapped.sectionIndexMinimumDisplayRowCount = value
        return self
    }
    
    @discardableResult
    func sectionIndexColor(_ color: UIColor?) -> Self {
        wrapped.sectionIndexColor = color
        return self
    }
    
    @discardableResult
    func sectionIndexBackgroundColor(_ color: UIColor?) -> Self {
        wrapped.sectionIndexBackgroundColor = color
        return self
    }
    
    @discardableResult
    func sectionIndexTrackingBackgroundColor(_ color: UIColor?) -> Self {
        wrapped.sectionIndexTrackingBackgroundColor = color
        return self
    }
    
    @discardableResult
    func isDragInteractionEnabled(_ value: Bool) -> Self {
        wrapped.dragInteractionEnabled = value
        return self
    }
    
    @discardableResult
    func scrollToRow(_ indexPath: IndexPath, scrollPosition: UITableView.ScrollPosition, isAnimated: Bool = true) -> Self {
        wrapped.scrollToRow(at: indexPath, at: scrollPosition, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func scrollToNearestSelectedRow(scrollPosition: UITableView.ScrollPosition, isAnimated: Bool = true) -> Self {
        wrapped.scrollToNearestSelectedRow(at: scrollPosition, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func scrollToLastRow(isAnimated: Bool = true) -> Self {
        let numberOfSections = wrapped.numberOfSections
        guard numberOfSections > 0 else { return self }
        for index in 1...numberOfSections {
            let numberOfRows = wrapped.numberOfRows(inSection: numberOfSections - index)
            if numberOfRows > 0 {
                wrapped.scrollToRow(at: IndexPath(row: numberOfRows - 1, section: numberOfSections - index), at: .bottom, animated: isAnimated)
                break
            }
        }
        return self
    }
    
    @discardableResult
    func isEditing(_ value: Bool, isAnimated: Bool = true) -> Self {
        wrapped.setEditing(value, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func sectionHeaderTopPadding(_ padding: CGFloat) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.sectionHeaderTopPadding = padding
        }
        return self
    }
    
    @discardableResult
    func reconfigureRows(at indexPaths: [IndexPath]) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.reconfigureRows(at: indexPaths)
        }
        return self
    }
    
    @discardableResult
    func isAllowsFocus(_ value: Bool) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.allowsFocus = value
        }
        return self
    }
    
    @discardableResult
    func isAllowsFocusDuringEditing(_ value: Bool) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.allowsFocusDuringEditing = value
        }
        return self
    }
    
    @discardableResult
    func fillerRowHeight(_ height: CGFloat) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.fillerRowHeight = height
        }
        return self
    }
    
    @discardableResult
    func isPrefetchingEnabled(_ value: Bool) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.isPrefetchingEnabled = value
        }
        return self
    }
    
}
