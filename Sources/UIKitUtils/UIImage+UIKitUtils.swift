//
//  UIImage+UIKitUtils.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import UIKit

public extension UIImage {
    
    /// 获取图片平均颜色
    var averageColor: UIColor {
        guard let ciImage = ciImage else { return .clear }
        let parameters = [kCIInputImageKey: ciImage, kCIInputExtentKey: CIVector(cgRect: ciImage.extent)]
        guard let outputImage = CIFilter(name: "CIAreaAverage", parameters: parameters)?.outputImage else { return .clear }
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: cgImage?.colorSpace ?? NSNull()])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
    
    /// 生成纯色图片
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - size: 图片大小
    convenience init(color: UIColor, size: CGSize) {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        UIGraphicsEndImageContext()
        self.init(cgImage: cgImage!)
    }
    
    /// 生成渐变色图片
    /// - Parameter colors: 渐变颜色
    /// - Parameter size: 图片大小
    /// - Parameter startPoint: 渐变相对起始位置，默认为(0.5, 0)
    /// - Parameter endPoint: 渐变相对结束位置，默认为(0.5, 1)
    convenience init?(colors: [UIColor], size: CGSize, startPoint: CGPoint = CGPoint(x: 0.5, y: 0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1)) {
        guard !colors.isEmpty else {
            return nil
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = rect
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.colors = colors.map(\.cgColor)
        UIGraphicsBeginImageContext(rect.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        UIGraphicsEndImageContext()
        self.init(cgImage: cgImage!)
    }
    
    
    /// 指示器形状
    enum IndicatorShape {
        /// 椭圆形
        case oval
        /// 三角形
        case triangle
        /// 详情
        case disclosure
        /// 勾选
        case checkmark
        /// 返回
        case back
        /// 关闭
        case close
    }
    
    
    /// 生成常见指示器图片
    /// - Parameters:
    ///   - shape: 形状
    ///   - size: 大小
    ///   - lineWidth: 线宽，如形状不由线构成则不受该参数影响
    ///   - tintColor: 颜色
    convenience init(shape: IndicatorShape, size: CGSize, lineWidth: CGFloat = 3, tintColor: UIColor) {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        let path: UIBezierPath
        let isStroke: Bool
        let drawOffset = lineWidth / 2
        switch shape {
        case .oval:
            path = UIBezierPath(ovalIn: CGRect(origin: .zero, size: size))
            isStroke = false
        case .triangle:
            path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: size.height))
            path.addLine(to: CGPoint(x: size.width / 2, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.close()
            isStroke = false
        case .disclosure:
            path = UIBezierPath()
            path.lineWidth = lineWidth
            path.move(to: CGPoint(x: drawOffset, y: drawOffset))
            path.addLine(to: CGPoint(x: size.width - drawOffset, y: size.height / 2))
            path.addLine(to: CGPoint(x: drawOffset, y: size.height - drawOffset))
            isStroke = true
        case .checkmark:
            let lineAngle = CGFloat.pi / 4
            path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: size.height / 2))
            path.addLine(to: CGPoint(x: size.width / 3, y: size.height))
            path.addLine(to: CGPoint(x: size.width, y: lineWidth * sin(lineAngle)))
            path.addLine(to: CGPoint(x: size.width - lineWidth * cos(lineAngle), y: 0))
            path.addLine(to: CGPoint(x: size.width / 3, y: size.height - lineWidth / sin(lineAngle)))
            path.addLine(to: CGPoint(x: lineWidth * sin(lineAngle), y: size.height / 2 - lineWidth * sin(lineAngle)))
            path.close()
            isStroke = false
        case .back:
            path = UIBezierPath()
            path.lineWidth = lineWidth
            path.move(to: CGPoint(x: size.width - drawOffset, y: drawOffset))
            path.addLine(to: CGPoint(x: 0 + drawOffset, y: size.height / 2.0))
            path.addLine(to: CGPoint(x: size.width - drawOffset, y: size.height - drawOffset))
            isStroke = true
        case .close:
            path = UIBezierPath()
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.close()
            path.move(to: CGPoint(x: size.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            path.close()
            path.lineWidth = lineWidth
            path.lineCapStyle = .round
            isStroke = true
        }
        if isStroke {
            context?.setStrokeColor(tintColor.cgColor)
            path.stroke()
        } else {
            context?.setFillColor(tintColor.cgColor)
            path.fill()
        }
        let cgImage = (UIGraphicsGetImageFromCurrentImageContext()?.cgImage)!
        UIGraphicsEndImageContext()
        self.init(cgImage: cgImage)
    }
    
    /// 生成二维码图片
    /// - Parameters:
    ///   - qrCodeText: 二维码包含文字
    ///   - centerImage: 二维码中间图片，默认为空
    convenience init?(qrCodeText: String, centerImage: UIImage? = nil) {
        // 创建滤镜
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setDefaults()
        // 将文字加入二维码
        filter?.setValue(qrCodeText.data(using: .utf8), forKey: "inputMessage")
        // 设置容错率
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        // 取出生成的二维码（不清晰）
        if let outputImage = filter?.outputImage {
            // 生成清晰度更好的二维码
            let integral = outputImage.extent.integral
            let proportion = min(300 / integral.width, 300 / integral.height)
            let width = integral.width * proportion
            let height = integral.height * proportion
            let colorSpace = CGColorSpaceCreateDeviceGray()
            let bitmapRef = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: 0)!
            let context = CIContext(options: nil)
            let bitmapImage: CGImage = context.createCGImage(outputImage, from: integral)!
            bitmapRef.interpolationQuality = CGInterpolationQuality.none
            bitmapRef.scaleBy(x: proportion, y: proportion)
            bitmapRef.draw(bitmapImage, in: integral)
            let cgImage = bitmapRef.makeImage()!
            let qrCodeImage = UIImage(cgImage: cgImage)
            // 如果有一个头像的话，将头像加入二维码中心
            if let centerImage = centerImage {
                // 开启图片上下文
                UIGraphicsBeginImageContext(qrCodeImage.size)
                // 绘制背景图片
                qrCodeImage.draw(in: CGRect(origin: .zero, size: qrCodeImage.size))
                let x = (qrCodeImage.size.width - 100) * 0.5
                let y = (qrCodeImage.size.height - 100) * 0.5
                centerImage.draw(in: CGRect(x: x, y: y, width: 100, height: 100))
                // 取出绘制好的图片
                let newImage = UIGraphicsGetImageFromCurrentImageContext()
                // 关闭上下文
                UIGraphicsEndImageContext()
                if let cgImage = newImage?.cgImage {
                    self.init(cgImage: cgImage)
                } else {
                    self.init(cgImage: cgImage)
                }
            } else {
                self.init(cgImage: cgImage)
            }
        }
        return nil
    }
    
    /// 重设图片大小
    ///
    /// - Parameter reSize: 设置图片大小
    /// - Returns: 转化后的图片
    func reSizeImage(reSize: CGSize) -> UIImage? {
        if reSize.width <= 0 || reSize.height <= 0 {
            return nil
        }
        UIGraphicsBeginImageContextWithOptions(reSize, false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height))
        let reSizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return reSizeImage
    }
    
    /// 等比例缩放图片
    ///
    /// - Parameter scaleSize: 缩放倍数
    /// - Returns: 转化后的图片
    func scaleImage(scaleSize: CGFloat) -> UIImage? {
        let reSize = CGSize(width: size.width * scaleSize, height: size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
    
}
