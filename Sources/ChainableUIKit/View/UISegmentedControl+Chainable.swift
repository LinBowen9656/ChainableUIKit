//
//  UISegmentedControl+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

public extension ChainableWrapper where Wrapped: UISegmentedControl {
    
    @discardableResult
    func image(_ image: UIImage?, index: Int) -> Self {
        wrapped.setImage(image, forSegmentAt: index)
        return self
    }
    
    @discardableResult
    func title(_ title: String?, index: Int) -> Self {
        wrapped.setTitle(title, forSegmentAt: index)
        return self
    }
    
    @discardableResult
    func insertSegment(image: UIImage?, index: Int, isAnimated: Bool = false) -> Self {
        wrapped.insertSegment(with: image, at: index, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func insertSegment(title: String?, index: Int, isAnimated: Bool = false) -> Self {
        wrapped.insertSegment(withTitle: title, at: index, animated: isAnimated)
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func insertSegment(action: UIAction, index: Int, isAnimated: Bool = false) -> Self {
        wrapped.insertSegment(action: action, at: index, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func removeAllSegments() -> Self {
        wrapped.removeAllSegments()
        return self
    }
    
    @discardableResult
    func removeSegment(_ index: Int, isAnimated: Bool = false) -> Self {
        wrapped.removeSegment(at: index, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func selectedSegmentIndex(_ index: Int) -> Self {
        wrapped.selectedSegmentIndex = index
        return self
    }
    
    @discardableResult
    func isMomentary(_ value: Bool) -> Self {
        wrapped.isMomentary = value
        return self
    }
    
    @discardableResult
    func isEnabled(_ value: Bool, index: Int) -> Self {
        wrapped.setEnabled(value, forSegmentAt: index)
        return self
    }
    
    @discardableResult
    func contentOffset(_ offset: CGSize, index: Int) -> Self {
        wrapped.setContentOffset(offset, forSegmentAt: index)
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat, index: Int) -> Self {
        wrapped.setWidth(width, forSegmentAt: index)
        return self
    }
    
    @discardableResult
    func apportionsSegmentWidthsByContent(_ value: Bool) -> Self {
        wrapped.apportionsSegmentWidthsByContent = value
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?, state: UIControl.State, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setBackgroundImage(image, for: state, barMetrics: barMetrics)
        return self
    }
    
    @discardableResult
    func contentPositionAdjustment(_ offset: UIOffset, segmentType: UISegmentedControl.Segment, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setContentPositionAdjustment(offset, forSegmentType: segmentType, barMetrics: barMetrics)
        return self
    }
    
    @discardableResult
    func dividerImage(_ image: UIImage?, leftSegmentState: UIControl.State = .normal, rightSegmentState: UIControl.State = .normal, barMetrics: UIBarMetrics = .default) -> Self {
        wrapped.setDividerImage(image, forLeftSegmentState: leftSegmentState, rightSegmentState: rightSegmentState, barMetrics: barMetrics)
        return self
    }
    
    @discardableResult
    func titleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, state: UIControl.State = .normal) -> Self {
        wrapped.setTitleTextAttributes(attributes, for: state)
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func action(_ action: UIAction, index: Int) -> Self {
        wrapped.setAction(action, forSegmentAt: index)
        return self
    }
    
}
