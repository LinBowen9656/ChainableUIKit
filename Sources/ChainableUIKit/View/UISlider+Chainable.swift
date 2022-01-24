//
//  UISlider+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UISlider {
    
    @discardableResult
    func value(_ value: Float, isAnimated: Bool = false) -> Self {
        wrapped.setValue(value, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func minimumValue(_ value: Float) -> Self {
        wrapped.minimumValue = value
        return self
    }
    
    @discardableResult
    func maximumValue(_ value: Float) -> Self {
        wrapped.maximumValue = value
        return self
    }
    
    @discardableResult
    func isContinuous(_ value: Bool) -> Self {
        wrapped.isContinuous = value
        return self
    }
    
    @discardableResult
    func minimumTrackImage(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        wrapped.setMinimumTrackImage(image, for: state)
        return self
    }
    
    @discardableResult
    func maximumTrackImage(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        wrapped.setMaximumTrackImage(image, for: state)
        return self
    }
    
    @discardableResult
    func thumbImage(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        wrapped.setThumbImage(image, for: state)
        return self
    }
    
    @discardableResult
    func minimumTrackTintColor(_ color: UIColor?) -> Self {
        wrapped.minimumTrackTintColor = color
        return self
    }
    
    @discardableResult
    func maximumTrackTintColor(_ color: UIColor?) -> Self {
        wrapped.maximumTrackTintColor = color
        return self
    }
    
    @discardableResult
    func thumbTintColor(_ color: UIColor?) -> Self {
        wrapped.thumbTintColor = color
        return self
    }
    
    @available(iOS 15.0, *)
    @discardableResult
    func preferredBehavioralStyle(_ style: UIBehavioralStyle) -> Self {
        wrapped.preferredBehavioralStyle = style
        return self
    }
    
}
