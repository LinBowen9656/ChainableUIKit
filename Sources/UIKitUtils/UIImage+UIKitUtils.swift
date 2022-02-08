//
//  UIImage+UIKitUtils.swift
//  
//
//  Created by 林博文 on 2021/2/5.
//

import UIKit

public extension UIImage {
    
    /// Get the average color of image.
    var averageColor: UIColor {
        let ciImage: CIImage
        if let image = self.ciImage {
            ciImage = image
        } else if let image = cgImage {
            ciImage = CIImage(cgImage: image)
        } else {
            return .clear
        }
        let parameters = [kCIInputImageKey: ciImage, kCIInputExtentKey: CIVector(cgRect: ciImage.extent)]
        guard let outputImage = CIFilter(name: "CIAreaAverage", parameters: parameters)?.outputImage else { return .clear }
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: cgImage?.colorSpace ?? NSNull()])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
    
    /// Creates and returns a new solid color image object.
    /// - Parameters:
    ///   - color: The color of image.
    ///   - size: The image Size.
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
    
    /// Creates and returns a new gradient color image object.
    /// - Parameter colors: An array of `UIColor` objects defining the color of each gradient stop
    /// - Parameter size: The image Size.
    /// - Parameter startPoint: The start point corresponds to the first stop of the gradient. Default value is (0.5, 0).
    /// - Parameter endPoint: The end point of the gradient when drawn in the coordinate space. Default value is (0.5, 1).
    convenience init?(colors: [UIColor], size: CGSize, startPoint: CGPoint = CGPoint(x: 0.5, y: 0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1)) {
        guard !colors.isEmpty else { return nil }
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
    
    enum IndicatorShape {
        
        case oval
        case triangle
        case disclosure
        case checkmark
        case back
        case close
        
    }
    
    /// Creates and returns a new indicator image object.
    /// - Parameters:
    ///   - shape: The shape of indicator.
    ///   - size: The image Size.
    ///   - lineWidth: The line width of the shape. Unaffected by this parameter if the shape does not consist of lines.
    ///   - tintColor: The color of Shape.
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
    
    /// Creates and returns a new QR code image object.
    /// - Parameters:
    ///   - qrCodeText: The text which stored in the QR code.
    ///   - centerImage: The image overlay on center of the QR code image.
    convenience init?(qrCodeText: String, centerImage: UIImage? = nil) {
        // Create filter.
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setDefaults()
        // Set input text.
        filter?.setValue(qrCodeText.data(using: .utf8), forKey: "inputMessage")
        // Set correction level.
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        // Get the unclear output image.
        if let outputImage = filter?.outputImage {
            // Create the output image.
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
            // Overlay the image if `centerImage` is not `nil`.
            if let centerImage = centerImage {
                // Begin draw context.
                UIGraphicsBeginImageContext(qrCodeImage.size)
                // Draw QR code.
                qrCodeImage.draw(in: CGRect(origin: .zero, size: qrCodeImage.size))
                let x = (qrCodeImage.size.width - 100) * 0.5
                let y = (qrCodeImage.size.height - 100) * 0.5
                centerImage.draw(in: CGRect(x: x, y: y, width: 100, height: 100))
                // Get the output image.
                let newImage = UIGraphicsGetImageFromCurrentImageContext()
                // End draw context.
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
    
    /// Returns a new image which is resize from this image.
    /// - Parameter reSize: The image Size.
    /// - Returns: The new image with the given size.
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
    
    /// Returns a new image which is scaled from this image.
    ///
    /// - Parameter scaleSize: The scale factor.
    /// - Returns: The new image with the given scale.
    func scaleImage(scaleSize: CGFloat) -> UIImage? {
        let reSize = CGSize(width: size.width * scaleSize, height: size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
    
}
