//
//  ActionWrapper.swift
//  
//
//  Created by 柴阿文 on 2021/2/5.
//

import Foundation

class ActionWrapper {
    
    private let actionHandler: () -> Void
    
    init(handler: @escaping () -> Void) {
        actionHandler = handler
    }
    
    @objc
    func action() {
        actionHandler()
    }
    
}
