//
//  UIButtonConfiguration+Chainable.swift
//  
//
//  Created by 林博文 on 2021/9/21.
//

import UIKit

@available(iOS 15.0, *)
extension UIButton.Configuration: ChainableType {}

@available(iOS 15.0, *)
public extension ChainableWrapper where Wrapped == UIButton.Configuration {
    
    @discardableResult
    func title(_ title: String?) -> Self {
        var wrap = wrapped
        wrap.title = title
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func subtitle(_ subtitle: String?) -> Self {
        var wrap = wrapped
        wrap.subtitle = subtitle
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func attributedTitle(_ title: AttributedString?) -> Self {
        var wrap = wrapped
        wrap.attributedTitle = title
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func attributedSubtitle(_ subtitle: AttributedString?) -> Self {
        var wrap = wrapped
        wrap.attributedSubtitle = subtitle
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func titleTextAttributesTransformer(_ transformer: UIConfigurationTextAttributesTransformer?) -> Self {
        var wrap = wrapped
        wrap.titleTextAttributesTransformer = transformer
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func subtitleTextAttributesTransformer(_ transformer: UIConfigurationTextAttributesTransformer?) -> Self {
        var wrap = wrapped
        wrap.subtitleTextAttributesTransformer = transformer
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func titlePadding(_ padding: CGFloat) -> Self {
        var wrap = wrapped
        wrap.titlePadding = padding
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func titleAlignment(_ alignment: UIButton.Configuration.TitleAlignment) -> Self {
        var wrap = wrapped
        wrap.titleAlignment = alignment
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func image(_ value: UIImage?) -> Self {
        var wrap = wrapped
        wrap.image = value
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func imagePadding(_ padding: CGFloat) -> Self {
        var wrap = wrapped
        wrap.imagePadding = padding
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func showsActivityIndicator(_ value: Bool) -> Self {
        var wrap = wrapped
        wrap.showsActivityIndicator = value
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func imagePlacement(_ placement: NSDirectionalRectEdge) -> Self {
        var wrap = wrapped
        wrap.imagePlacement = placement
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func imageColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        var wrap = wrapped
        wrap.imageColorTransformer = transformer
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func preferredSymbolConfigurationForImage(_ configuration: UIImage.SymbolConfiguration?) -> Self {
        var wrap = wrapped
        wrap.preferredSymbolConfigurationForImage = configuration
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func baseBackgroundColor(_ color: UIColor?) -> Self {
        var wrap = wrapped
        wrap.baseBackgroundColor = color
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func baseForegroundColor(_ color: UIColor?) -> Self {
        var wrap = wrapped
        wrap.baseForegroundColor = color
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func background(_ configuration: UIBackgroundConfiguration) -> Self {
        var wrap = wrapped
        wrap.background = configuration
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func cornerStyle(_ style: UIButton.Configuration.CornerStyle) -> Self {
        var wrap = wrapped
        wrap.cornerStyle = style
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func macIdiomStyle(_ style: UIButton.Configuration.MacIdiomStyle) -> Self {
        var wrap = wrapped
        wrap.macIdiomStyle = style
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func activityIndicatorColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        var wrap = wrapped
        wrap.activityIndicatorColorTransformer = transformer
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func automaticallyUpdateForSelection(_ value: Bool) -> Self {
        var wrap = wrapped
        wrap.automaticallyUpdateForSelection = value
        return ChainableWrapper(wrapped: wrap)
    }
    
    @discardableResult
    func setDefaultContentInsets() -> Self {
        var wrap = wrapped
        wrap.setDefaultContentInsets()
        return ChainableWrapper(wrapped: wrap)
    }
    
}
