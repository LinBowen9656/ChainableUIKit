//
//  UIBezierPath+ContinuousCorner.swift
//
//
//  Copyright © 2020 BowenLin. All rights reserved.
//

import UIKit

public extension UIBezierPath {
    
    /// 平滑圆角的贝塞尔曲线
    /// - Parameters:
    ///   - rect: 大小位置
    ///   - continuousCornerRadius: 圆角半径
    convenience init(rect: CGRect, continuousCornerRadius: CGFloat) {
        self.init()
        let limit = min(rect.size.width, rect.size.height) / 2 / 1.52866483
        let limitedRadius = min(continuousCornerRadius, limit)
        move(to: CGPoint(x: rect.minX + 1.52866483 * limitedRadius, y: rect.minY))
        addLine(to: CGPoint(x: rect.minX + rect.size.width - 1.52866471 * limitedRadius, y: rect.minY))
        addCurve(to: CGPoint(x: rect.minX + rect.size.width - 0.66993427 * limitedRadius, y: rect.minY + 0.065496 * limitedRadius), controlPoint1: CGPoint(x: rect.minX + rect.size.width - 1.08849323 * limitedRadius, y: rect.minY), controlPoint2: CGPoint(x: rect.minX + rect.size.width - 0.86840689 * limitedRadius, y: rect.minY))
        addLine(to: CGPoint(x: rect.minX + rect.size.width - 0.63149399 * limitedRadius, y: rect.minY + 0.074911 * limitedRadius))
        addCurve(to: CGPoint(x: rect.minX + rect.size.width - 0.07491176 * limitedRadius, y: rect.minY + 0.63149399 * limitedRadius), controlPoint1: CGPoint(x: rect.minX + rect.size.width - 0.37282392 * limitedRadius, y: rect.minY + 0.16905899 * limitedRadius), controlPoint2: CGPoint(x: rect.minX + rect.size.width - 0.16906013 * limitedRadius, y: rect.minY + 0.37282401 * limitedRadius))
        addCurve(to: CGPoint(x: rect.minX + rect.size.width, y: rect.minY + 1.52866483 * limitedRadius), controlPoint1: CGPoint(x: rect.minX + rect.size.width, y: rect.minY + 0.86840701 * limitedRadius), controlPoint2: CGPoint(x: rect.minX + rect.size.width, y: rect.minY + 1.08849299 * limitedRadius))
        addLine(to: CGPoint(x: rect.minX + rect.size.width, y: rect.minY + rect.size.height - 1.52866471 * limitedRadius))
        addCurve(to: CGPoint(x: rect.minX + rect.size.width - 0.06549569 * limitedRadius, y: rect.minY + rect.size.height - 0.66993493 * limitedRadius), controlPoint1: CGPoint(x: rect.minX + rect.size.width, y: rect.minY + rect.size.height - 1.08849323 * limitedRadius), controlPoint2: CGPoint(x: rect.minX + rect.size.width, y: rect.minY + rect.size.height - 0.86840689 * limitedRadius))
        addLine(to: CGPoint(x: rect.minX + rect.size.width - 0.07491111 * limitedRadius, y: rect.minY + rect.size.height - 0.63149399 * limitedRadius))
        addCurve(to: CGPoint(x: rect.minX + rect.size.width - 0.63149399 * limitedRadius, y: rect.minY + rect.size.height - 0.07491111 * limitedRadius), controlPoint1: CGPoint(x: rect.minX + rect.size.width - 0.16905883 * limitedRadius, y: rect.minY + rect.size.height - 0.37282392 * limitedRadius), controlPoint2: CGPoint(x: rect.minX + rect.size.width - 0.37282392 * limitedRadius, y: rect.minY + rect.size.height - 0.16905883 * limitedRadius))
        addCurve(to: CGPoint(x: rect.minX + rect.size.width - 1.52866471 * limitedRadius, y: rect.minY + rect.size.height), controlPoint1: CGPoint(x: rect.minX + rect.size.width - 0.86840689 * limitedRadius, y: rect.minY + rect.size.height), controlPoint2: CGPoint(x: rect.minX + rect.size.width - 1.08849323 * limitedRadius, y: rect.minY + rect.size.height))
        addLine(to: CGPoint(x: rect.minX + 1.52866483 * limitedRadius, y: rect.minY + rect.size.height))
        addCurve(to: CGPoint(x: rect.minX + 0.66993397, y: rect.minY + rect.size.height - 0.06549569 * limitedRadius), controlPoint1: CGPoint(x: rect.minX + 1.08849299 * limitedRadius, y: rect.minY + rect.size.height), controlPoint2: CGPoint(x: rect.minX + 0.86840701 * limitedRadius, y: rect.minY + rect.size.height))
        addLine(to: CGPoint(x: rect.minX + 0.63149399 * limitedRadius, y: rect.minY + rect.size.height - 0.07491111 * limitedRadius))
        addCurve(to: CGPoint(x: rect.minX + 0.074911 * limitedRadius, y: rect.minY + rect.size.height - 0.63149399 * limitedRadius), controlPoint1: CGPoint(x: rect.minX + 0.37282401 * limitedRadius, y: rect.minY + rect.size.height - 0.16905883 * limitedRadius), controlPoint2: CGPoint(x: rect.minX + 0.16906001 * limitedRadius, y: rect.minY + rect.size.height - 0.37282392 * limitedRadius))
        addCurve(to: CGPoint(x: rect.minX, y: rect.minY + rect.size.height - 1.52866471 * limitedRadius), controlPoint1: CGPoint(x: rect.minX, y: rect.minY + rect.size.height - 0.86840689 * limitedRadius), controlPoint2: CGPoint(x: rect.minX, y: rect.minY + rect.size.height - 1.08849323 * limitedRadius))
        addLine(to: CGPoint(x: rect.minX, y: rect.minY + 1.52866483 * limitedRadius))
        addCurve(to: CGPoint(x: rect.minX + 0.065496 * limitedRadius, y: rect.minY + 0.66993397 * limitedRadius), controlPoint1: CGPoint(x: rect.minX, y: rect.minY + 1.08849299 * limitedRadius), controlPoint2: CGPoint(x: rect.minX, y: rect.minY + 0.86840701 * limitedRadius))
        addLine(to: CGPoint(x: rect.minX + 0.074911 * limitedRadius, y: rect.minY + 0.63149399 * limitedRadius))
        addCurve(to: CGPoint(x: rect.minX + 0.63149399 * limitedRadius, y: rect.minY + 0.074911 * limitedRadius), controlPoint1: CGPoint(x: rect.minX + 0.16906001 * limitedRadius, y: rect.minY + 0.37282401 * limitedRadius), controlPoint2: CGPoint(x: rect.minX + 0.37282401 * limitedRadius, y: rect.minY + 0.16906001 * limitedRadius))
        addCurve(to: CGPoint(x: rect.minX + 0.63149399 * limitedRadius, y: rect.minY), controlPoint1: CGPoint(x: rect.minX + 0.16906001 * limitedRadius, y: rect.minY), controlPoint2: CGPoint(x: rect.minX + 0.37282401 * limitedRadius, y: rect.minY))
        close()
    }
    
}
