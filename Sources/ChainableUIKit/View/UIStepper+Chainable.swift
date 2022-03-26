//
//  UIStepper+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIStepper {
    
    @discardableResult
    func value(_ value: Double) -> Self {
        wrapped.value = value
        return self
    }
    
    @discardableResult
    func autorepeat(_ value: Bool) -> Self {
        wrapped.autorepeat = value
        return self
    }
    
    @discardableResult
    func minimumValue(_ value: Double) -> Self {
        wrapped.minimumValue = value
        return self
    }
    
    @discardableResult
    func maximumValue(_ value: Double) -> Self {
        wrapped.maximumValue = value
        return self
    }
    
    @discardableResult
    func isContinuous(_ value: Bool) -> Self {
        wrapped.isContinuous = value
        return self
    }
    
    @discardableResult
    func wraps(_ value: Bool) -> Self {
        wrapped.wraps = value
        return self
    }
    
    @discardableResult
    func stepValue(_ value: Double) -> Self {
        wrapped.stepValue = value
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        wrapped.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func incrementImage(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        wrapped.setIncrementImage(image, for: state)
        return self
    }
    
    @discardableResult
    func decrementImage(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        wrapped.setDecrementImage(image, for: state)
        return self
    }
    
    @discardableResult
    func dividerImage(_ image: UIImage?, leftSegmentState: UIControl.State = .normal, rightSegmentState: UIControl.State = .normal) -> Self {
        wrapped.setDividerImage(image, forLeftSegmentState: leftSegmentState, rightSegmentState: rightSegmentState)
        return self
    }
    
}
