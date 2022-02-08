//
//  UIColor+UIKitUtils.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension UIColor {
    
    /// The red value of the color object.
    var redValue: CGFloat {
        var red: CGFloat = 0
        getRed(&red, green: nil, blue: nil, alpha: nil)
        return red
    }
    /// The green value of the color object.
    var greenValue: CGFloat {
        var green: CGFloat = 0
        getRed(nil, green: &green, blue: nil, alpha: nil)
        return green
    }
    /// The blue value of the color object.
    var blueValue: CGFloat {
        var blue: CGFloat = 0
        getRed(nil, green: nil, blue: &blue, alpha: nil)
        return blue
    }
    /// The opacity value of the color object
    var alphaValue: CGFloat {
        var alpha: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &alpha)
        return alpha
    }
    /// RGB hex string of the color object.
    var rgbHexString: String { String(format: "#%02X%02X%02X", Int((redValue * 255).rounded()), Int((greenValue * 255).rounded()), Int((blueValue * 255).rounded())) }
    /// RGBA hex string of the color object.
    var rgbaHexString: String { String(format: "#%02X%02X%02X%02X", Int((redValue * 255).rounded()), Int((greenValue * 255).rounded()), Int((blueValue * 255).rounded()), Int((alphaValue * 255).rounded())) }
    /// A Boolean value that indicates whether the color is dark color.
    var isDark: Bool { 1 - ((redValue * 0.299) + (greenValue * 0.587) + (blueValue * 0.114)) > 0.411 }
    /// The complementary color of the color object.
    var complementaryColor: UIColor { UIColor(red: 1 - redValue, green: 1 - greenValue, blue: 1 - blueValue, alpha: alphaValue) }
    
    /// Get the color after the current color overlay the other color.
    /// - Parameter color: The overlay color.
    /// - Returns: The color after the current color overlay the other color.
    func overlay(color: UIColor) -> UIColor {
        let resultAlpha: CGFloat = color.alphaValue + alphaValue * (1 - color.alphaValue)
        let resultRed = (color.redValue * color.alphaValue + redValue * alphaValue * (1 - color.alphaValue)) / resultAlpha
        let resultGreen = (color.greenValue * color.alphaValue + greenValue * alphaValue * (1 - color.alphaValue)) / resultAlpha
        let resultBlue = (color.blueValue * color.alphaValue + blueValue * alphaValue * (1 - color.alphaValue)) / resultAlpha
        return UIColor(red: resultRed, green: resultGreen, blue: resultBlue, alpha: resultAlpha)
    }
    
    /// Convert the color object to another color.
    /// - Parameters:
    ///   - color: The target color.
    ///   - progress: The progress value of convert.
    /// - Returns: The color after converted.
    func become(color: UIColor, progress: CGFloat) -> UIColor {
        let progress = max(0, min(progress, 1))
        let finalRed = redValue + (color.redValue - redValue) * progress
        let finalGreen = greenValue + (color.greenValue - greenValue) * progress
        let finalBlue = blueValue + (color.blueValue - blueValue) * progress
        let finalAlpha = alphaValue + (color.alphaValue - alphaValue) * progress
        return UIColor(red: finalRed, green: finalGreen, blue: finalBlue, alpha: finalAlpha)
    }
    
}
