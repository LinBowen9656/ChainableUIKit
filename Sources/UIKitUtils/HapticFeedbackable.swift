//
//  HapticFeedbackable.swift
//
//  Created by 柴阿文 on 2020/3/27.
//

import UIKit
import AudioToolbox

public protocol HapticFeedbackable {}

public extension HapticFeedbackable {
    
    func hapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        if UIDevice.current.modelName == .iPhone6S || UIDevice.current.modelName == .iPhone6SPlus {
            switch style {
            case .light, .medium:
                AudioServicesPlaySystemSound(1519)
            case .heavy:
                AudioServicesPlaySystemSound(1520)
            default: break
            }
        } else {
            UIImpactFeedbackGenerator(style: style).impactOccurred()
        }
    }
    
}
