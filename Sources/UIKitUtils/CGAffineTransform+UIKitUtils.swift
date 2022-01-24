//
//  CGAffineTransform+UIKitUtils.swift
//  
//
//  Created by 林博文 on 2021/6/21.
//

import CoreGraphics

public extension CGAffineTransform {
    
    var translationX: CGFloat { tx }
    var translationY: CGFloat { ty }
    var scaleX: CGFloat { a }
    var scaleY: CGFloat { d }
    var angle: CGFloat { atan2(b, a) }
    
}
