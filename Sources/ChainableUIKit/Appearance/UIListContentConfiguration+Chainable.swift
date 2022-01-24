//
//  UIListContentConfiguration+Chainable.swift
//  
//
//  Created by 林博文 on 2021/2/6.
//

import UIKit

@available(iOS 14.0, *)
extension UIListContentConfiguration: ChainableType {}

@available(iOS 14.0, *)
public extension ChainableWrapper where Wrapped == UIListContentConfiguration {
    
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        var wrap = wrapped
        wrap.image = image
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func text(_ string: String?) -> Self {
        var wrap = wrapped
        wrap.text = string
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func attributedText(_ attributedString: NSAttributedString?) -> Self {
        var wrap = wrapped
        wrap.attributedText = attributedString
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func secondaryText(_ string: String?) -> Self {
        var wrap = wrapped
        wrap.secondaryText = string
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func secondaryAttributedText(_ attributedString: NSAttributedString?) -> Self {
        var wrap = wrapped
        wrap.secondaryAttributedText = attributedString
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func imageProperties(_ properties: UIListContentConfiguration.ImageProperties) -> Self {
        var wrap = wrapped
        wrap.imageProperties = properties
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func textProperties(_ properties: UIListContentConfiguration.TextProperties) -> Self {
        var wrap = wrapped
        wrap.textProperties = properties
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func secondaryTextProperties(_ properties: UIListContentConfiguration.TextProperties) -> Self {
        var wrap = wrapped
        wrap.secondaryTextProperties = properties
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func axesPreservingSuperviewLayoutMargins(_ axis: UIAxis) -> Self {
        var wrap = wrapped
        wrap.axesPreservingSuperviewLayoutMargins = axis
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func directionalLayoutMargins(_ insets: NSDirectionalEdgeInsets) -> Self {
        var wrap = wrapped
        wrap.directionalLayoutMargins = insets
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func isPrefersSideBySideTextAndSecondaryText(_ value: Bool) -> Self {
        var wrap = wrapped
        wrap.prefersSideBySideTextAndSecondaryText = value
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func imageToTextPadding(_ padding: CGFloat) -> Self {
        var wrap = wrapped
        wrap.imageToTextPadding = padding
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func textToSecondaryTextHorizontalPadding(_ padding: CGFloat) -> Self {
        var wrap = wrapped
        wrap.textToSecondaryTextHorizontalPadding = padding
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func textToSecondaryTextVerticalPadding(_ padding: CGFloat) -> Self {
        var wrap = wrapped
        wrap.textToSecondaryTextVerticalPadding = padding
        return ChainableWrapper(wrapped: wrap)
    }
    
}

@available(iOS 14.0, *)
extension UIListContentConfiguration.ImageProperties: ChainableType {}

@available(iOS 14.0, *)
public extension ChainableWrapper where Wrapped == UIListContentConfiguration.ImageProperties {
    
    @discardableResult
    func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?) -> Self {
        var wrap = wrapped
        wrap.preferredSymbolConfiguration = configuration
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func tintColor(_ color: UIColor?) -> Self {
        var wrap = wrapped
        wrap.tintColor = color
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func tintColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        var wrap = wrapped
        wrap.tintColorTransformer = transformer
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        var wrap = wrapped
        wrap.cornerRadius = radius
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func maximumSize(_ size: CGSize) -> Self {
        var wrap = wrapped
        wrap.maximumSize = size
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func reservedLayoutSize(_ size: CGSize) -> Self {
        var wrap = wrapped
        wrap.reservedLayoutSize = size
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func isAccessibilityIgnoresInvertColors(_ value: Bool) -> Self {
        var wrap = wrapped
        wrap.accessibilityIgnoresInvertColors = value
        return ChainableWrapper(wrapped: wrap)
    }
    
}

@available(iOS 14.0, *)
extension UIListContentConfiguration.TextProperties: ChainableType {}

@available(iOS 14.0, *)
public extension ChainableWrapper where Wrapped == UIListContentConfiguration.TextProperties {
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        var wrap = wrapped
        wrap.font = font
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func color(_ color: UIColor) -> Self {
        var wrap = wrapped
        wrap.color = color
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func colorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        var wrap = wrapped
        wrap.colorTransformer = transformer
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func alignment(_ alignment: UIListContentConfiguration.TextProperties.TextAlignment) -> Self {
        var wrap = wrapped
        wrap.alignment = alignment
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        var wrap = wrapped
        wrap.lineBreakMode = mode
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func numberOfLines(_ value: Int) -> Self {
        var wrap = wrapped
        wrap.numberOfLines = value
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func isAdjustsFontSizeToFitWidth(_ value: Bool) -> Self {
        var wrap = wrapped
        wrap.adjustsFontSizeToFitWidth = value
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func minimumScaleFactor(_ factor: CGFloat) -> Self {
        var wrap = wrapped
        wrap.minimumScaleFactor = factor
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func isAllowsDefaultTighteningForTruncation(_ value: Bool) -> Self {
        var wrap = wrapped
        wrap.allowsDefaultTighteningForTruncation = value
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func isAdjustsFontForContentSizeCategory(_ value: Bool) -> Self {
        var wrap = wrapped
        wrap.adjustsFontForContentSizeCategory = value
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func transform(_ transform: UIListContentConfiguration.TextProperties.TextTransform) -> Self {
        var wrap = wrapped
        wrap.transform = transform
        return ChainableWrapper(wrapped: wrap)
    }
    
}
