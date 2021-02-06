//
//  UIListContentConfiguration+Chainable.swift
//  
//
//  Created by 柴阿文 on 2021/2/6.
//

import UIKit

@available(iOS 14.0, *)
extension UIListContentConfiguration: ChainableType {}

@available(iOS 14.0, *)
public extension ChainableWrapper where Wrapped == UIListContentConfiguration {
    
    @discardableResult
    mutating func image(_ image: UIImage?) -> Self {
        wrapped.image = image
        return self
    }
    
    @discardableResult
    mutating func text(_ text: String?) -> Self {
        wrapped.text = text
        return self
    }
    
    @discardableResult
    mutating func attributedText(_ attributedString: NSAttributedString?) -> Self {
        wrapped.attributedText = attributedString
        return self
    }
    
    @discardableResult
    mutating func secondaryText(_ text: String?) -> Self {
        wrapped.secondaryText = text
        return self
    }
    
    @discardableResult
    mutating func secondaryAttributedText(_ attributedString: NSAttributedString?) -> Self {
        wrapped.secondaryAttributedText = attributedString
        return self
    }
    
    @discardableResult
    mutating func imageProperties(_ properties: UIListContentConfiguration.ImageProperties) -> Self {
        wrapped.imageProperties = properties
        return self
    }
    
    @discardableResult
    mutating func textProperties(_ properties: UIListContentConfiguration.TextProperties) -> Self {
        wrapped.textProperties = properties
        return self
    }
    
    @discardableResult
    mutating func secondaryTextProperties(_ properties: UIListContentConfiguration.TextProperties) -> Self {
        wrapped.secondaryTextProperties = properties
        return self
    }
    
    @discardableResult
    mutating func axesPreservingSuperviewLayoutMargins(_ axis: UIAxis) -> Self {
        wrapped.axesPreservingSuperviewLayoutMargins = axis
        return self
    }
    
    @discardableResult
    mutating func directionalLayoutMargins(_ insets: NSDirectionalEdgeInsets) -> Self {
        wrapped.directionalLayoutMargins = insets
        return self
    }
    
    @discardableResult
    mutating func isPrefersSideBySideTextAndSecondaryText(_ value: Bool) -> Self {
        wrapped.prefersSideBySideTextAndSecondaryText = value
        return self
    }
    
    @discardableResult
    mutating func imageToTextPadding(_ padding: CGFloat) -> Self {
        wrapped.imageToTextPadding = padding
        return self
    }
    
    @discardableResult
    mutating func textToSecondaryTextHorizontalPadding(_ padding: CGFloat) -> Self {
        wrapped.textToSecondaryTextHorizontalPadding = padding
        return self
    }
    
    @discardableResult
    mutating func textToSecondaryTextVerticalPadding(_ padding: CGFloat) -> Self {
        wrapped.textToSecondaryTextVerticalPadding = padding
        return self
    }
    
}

@available(iOS 14.0, *)
extension UIListContentConfiguration.ImageProperties: ChainableType {}

@available(iOS 14.0, *)
public extension ChainableWrapper where Wrapped == UIListContentConfiguration.ImageProperties {
    
    @discardableResult
    mutating func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?) -> Self {
        wrapped.preferredSymbolConfiguration = configuration
        return self
    }
    
    @discardableResult
    mutating func tintColor(_ color: UIColor?) -> Self {
        wrapped.tintColor = color
        return self
    }
    
    @discardableResult
    mutating func tintColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        wrapped.tintColorTransformer = transformer
        return self
    }
    
    @discardableResult
    mutating func cornerRadius(_ radius: CGFloat) -> Self {
        wrapped.cornerRadius = radius
        return self
    }
    
    @discardableResult
    mutating func maximumSize(_ size: CGSize) -> Self {
        wrapped.maximumSize = size
        return self
    }
    
    @discardableResult
    mutating func reservedLayoutSize(_ size: CGSize) -> Self {
        wrapped.reservedLayoutSize = size
        return self
    }
    
    @discardableResult
    mutating func isAccessibilityIgnoresInvertColors(_ value: Bool) -> Self {
        wrapped.accessibilityIgnoresInvertColors = value
        return self
    }
    
}

@available(iOS 14.0, *)
extension UIListContentConfiguration.TextProperties: ChainableType {}

@available(iOS 14.0, *)
public extension ChainableWrapper where Wrapped == UIListContentConfiguration.TextProperties {
    
    @discardableResult
    mutating func font(_ font: UIFont) -> Self {
        wrapped.font = font
        return self
    }
    
    @discardableResult
    mutating func color(_ color: UIColor) -> Self {
        wrapped.color = color
        return self
    }
    
    @discardableResult
    mutating func colorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        wrapped.colorTransformer = transformer
        return self
    }
    
    @discardableResult
    mutating func alignment(_ alignment: UIListContentConfiguration.TextProperties.TextAlignment) -> Self {
        wrapped.alignment = alignment
        return self
    }
    
    @discardableResult
    mutating func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        wrapped.lineBreakMode = mode
        return self
    }
    
    @discardableResult
    mutating func numberOfLines(_ value: Int) -> Self {
        wrapped.numberOfLines = value
        return self
    }
    
    @discardableResult
    mutating func isAdjustsFontSizeToFitWidth(_ value: Bool) -> Self {
        wrapped.adjustsFontSizeToFitWidth = value
        return self
    }
    
    @discardableResult
    mutating func minimumScaleFactor(_ factor: CGFloat) -> Self {
        wrapped.minimumScaleFactor = factor
        return self
    }
    
    @discardableResult
    mutating func isAllowsDefaultTighteningForTruncation(_ value: Bool) -> Self {
        wrapped.allowsDefaultTighteningForTruncation = value
        return self
    }
    
    @discardableResult
    mutating func isAdjustsFontForContentSizeCategory(_ value: Bool) -> Self {
        wrapped.adjustsFontForContentSizeCategory = value
        return self
    }
    
    @discardableResult
    mutating func transform(_ transform: UIListContentConfiguration.TextProperties.TextTransform) -> Self {
        wrapped.transform = transform
        return self
    }
    
}
