//
//  UILabel+Chainable.swift
//  
//
//  Created by 林博文 on 2021/1/18.
//

import UIKit

public extension ChainableWrapper where Wrapped: UILabel {
    
    @discardableResult
    func text(_ value: String?) -> Self {
        wrapped.text = value
        return self
    }
    
    @discardableResult
    func attributedText(_ value: NSAttributedString?) -> Self {
        wrapped.attributedText = value
        return self
    }
    
    @discardableResult
    func font(_ value: UIFont) -> Self {
        wrapped.font = value
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        wrapped.textColor = color
        return self
    }
    
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        wrapped.textAlignment = alignment
        return self
    }
    
    @discardableResult
    func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        wrapped.lineBreakMode = mode
        return self
    }
    
    @discardableResult
    func isEnabled(_ value: Bool) -> Self {
        wrapped.isEnabled = value
        return self
    }
    
    #if os(tvOS)
    @discardableResult
    func enablesMarqueeWhenAncestorFocused(_ value: Bool) -> Self {
        if #available(tvOS 12.0, *) {
            wrapped.enablesMarqueeWhenAncestorFocused = value
        }
        return self
    }
    #endif
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ value: Bool) -> Self {
        wrapped.adjustsFontSizeToFitWidth = value
        return self
    }
    
    @discardableResult
    func allowsDefaultTighteningForTruncation(_ value: Bool) -> Self {
        wrapped.allowsDefaultTighteningForTruncation = value
        return self
    }
    
    @discardableResult
    func baselineAdjustment(_ adjustment: UIBaselineAdjustment) -> Self {
        wrapped.baselineAdjustment = adjustment
        return self
    }
    
    @discardableResult
    func minimumScaleFactor(_ scale: CGFloat) -> Self {
        wrapped.minimumScaleFactor = scale
        return self
    }
    
    @discardableResult
    func numberOfLines(_ lineNumber: Int) -> Self {
        wrapped.numberOfLines = lineNumber
        return self
    }
    
    @discardableResult
    func highlightedTextColor(_ color: UIColor?) -> Self {
        wrapped.highlightedTextColor = color
        return self
    }
    
    @discardableResult
    func isHighlighted(_ value: Bool) -> Self {
        wrapped.isHighlighted = value
        return self
    }
    
    @discardableResult
    func shadowColor(textShadowColor: UIColor?) -> Self {
        wrapped.shadowColor = textShadowColor
        return self
    }
    
    @discardableResult
    func textShadowOffset(_ offset: CGSize) -> Self {
        wrapped.shadowOffset = offset
        return self
    }
    
    @discardableResult
    func preferredMaxLayoutWidth(_ width: CGFloat) -> Self {
        wrapped.preferredMaxLayoutWidth = width
        return self
    }
    
    @discardableResult
    func showsExpansionTextWhenTruncated(_ value: Bool) -> Self {
        if #available(iOS 15.0, *) {
            wrapped.showsExpansionTextWhenTruncated = value
        }
        return self
    }
    
}
