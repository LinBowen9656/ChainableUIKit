//
//  UIColor+UIKitUtils.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

public extension UIColor {
    
    var redValue: CGFloat {
        var red: CGFloat = 0
        getRed(&red, green: nil, blue: nil, alpha: nil)
        return red
    }
    var greenValue: CGFloat {
        var green: CGFloat = 0
        getRed(nil, green: &green, blue: nil, alpha: nil)
        return green
    }
    var blueValue: CGFloat {
        var blue: CGFloat = 0
        getRed(nil, green: nil, blue: &blue, alpha: nil)
        return blue
    }
    var alphaValue: CGFloat {
        var alpha: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &alpha)
        return alpha
    }
    /// RGB字符串
    var rgbHexString: String { String(format: "#%02X%02X%02X", Int(redValue * 255), Int(greenValue * 255), Int(blueValue * 255)) }
    /// RGBA字符串
    var rgbaHexString: String { String(format: "#%02X%02X%02X%02X", Int(redValue * 255), Int(greenValue * 255), Int(blueValue * 255), Int(alphaValue * 255)) }
    /// 是否是暗色系颜色
    var isDark: Bool { 1 - ((redValue * 0.299) + (greenValue * 0.587) + (blueValue * 0.114)) > 0.411 }
    /// 颜色对应的互补色
    var inverseColor: UIColor { UIColor(red: 1 - redValue, green: 1 - greenValue, blue: 1 - blueValue, alpha: alphaValue) }
    
    /// 颜色叠加
    /// - Parameter color: 叠加的颜色
    /// - Returns: 叠加后的颜色
    func overlay(color: UIColor) -> UIColor {
        let resultAlpha: CGFloat = color.alphaValue + alphaValue * (1 - color.alphaValue)
        let resultRed = (color.redValue * color.alphaValue + redValue * alphaValue * (1 - color.alphaValue)) / resultAlpha
        let resultGreen = (color.greenValue * color.alphaValue + greenValue * alphaValue * (1 - color.alphaValue)) / resultAlpha
        let resultBlue = (color.blueValue * color.alphaValue + blueValue * alphaValue * (1 - color.alphaValue)) / resultAlpha
        return UIColor(red: resultRed, green: resultGreen, blue: resultBlue, alpha: resultAlpha)
    }
    
}
