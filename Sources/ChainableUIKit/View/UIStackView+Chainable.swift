//
//  UIStackView+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/1/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIStackView {
    
    @discardableResult
    func addArrangedSubview(_ view: UIView) -> Self {
        wrapped.addArrangedSubview(view)
        return self
    }
    
    @discardableResult
    func insertArrangedSubview(_ view: UIView, atIndex: Int) -> Self {
        wrapped.insertArrangedSubview(view, at: atIndex)
        return self
    }
    
    @discardableResult
    func removeArrangedSubview(_ view: UIView) -> Self {
        wrapped.removeArrangedSubview(view)
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        wrapped.alignment = alignment
        return self
    }
    
    @discardableResult
    func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        wrapped.axis = axis
        return self
    }
    
    @discardableResult
    func isBaselineRelativeArrangement(_ value: Bool) -> Self {
        wrapped.isBaselineRelativeArrangement = value
        return self
    }
    
    @discardableResult
    func isLayoutMarginsRelativeArrangement(_ value: Bool) -> Self {
        wrapped.isLayoutMarginsRelativeArrangement = value
        return self
    }
    
    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> Self {
        wrapped.distribution = distribution
        return self
    }
    
    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        wrapped.spacing = spacing
        return self
    }
    
    @discardableResult
    func customSpacing(_ spacing: CGFloat, afterView: UIView) -> Self {
        wrapped.setCustomSpacing(spacing, after: afterView)
        return self
    }
    
}
