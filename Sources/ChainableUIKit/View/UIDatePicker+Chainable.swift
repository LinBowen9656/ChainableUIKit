//
//  File.swift
//  
//
//  Created by 林博文 on 2021/1/31.
//

import UIKit

public extension ChainableWrapper where Wrapped: UIDatePicker {
    
    @discardableResult
    func calendar(_ calendar: Calendar) -> Self {
        wrapped.calendar = calendar
        return self
    }
    
    @discardableResult
    func date(_ date: Date, isAnimated: Bool = true) -> Self {
        wrapped.setDate(date, animated: isAnimated)
        return self
    }
    
    @discardableResult
    func locale(_ locale: Locale?) -> Self {
        wrapped.locale = locale
        return self
    }
    
    @discardableResult
    func timeZone(_ timeZone: TimeZone?) -> Self {
        wrapped.timeZone = timeZone
        return self
    }
    
    @discardableResult
    func datePickerMode(_ mode: UIDatePicker.Mode) -> Self {
        wrapped.datePickerMode = mode
        return self
    }
    
    @discardableResult
    func maximumDate(_ date: Date?) -> Self {
        wrapped.maximumDate = date
        return self
    }
    
    @discardableResult
    func minimumDate(_ date: Date?) -> Self {
        wrapped.minimumDate = date
        return self
    }
    
    @discardableResult
    func minuteInterval(_ interval: Int) -> Self {
        wrapped.minuteInterval = interval
        return self
    }
    
    @discardableResult
    func countDownDuration(_ timeInterval: TimeInterval) -> Self {
        wrapped.countDownDuration = timeInterval
        return self
    }
    
    @available(iOS 13.4, *)
    @discardableResult
    func preferredDatePickerStyle(_ style: UIDatePickerStyle) -> Self {
        wrapped.preferredDatePickerStyle = style
        return self
    }
    
}
