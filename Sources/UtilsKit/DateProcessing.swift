//
//  DateProcessing.swift
//
//  Created by Stuart on 2019/4/18.
//

import Foundation

// MARK: - 时间戳转化
public extension String {
    
    /// 字符串转化为日期
    ///
    /// - Parameters:
    ///   - dateStyle: 文字日期格式
    /// - Returns: 转化后的日期
    func toDate(dateStyle: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateStyle
        return dateFormatter.date(from: self)
    }
    
    /// 不同格式日期字符串转化
    ///
    /// - Parameters:
    ///   - oldDateStyle: 原日期格式
    ///   - newDateStyle: 新日期格式
    /// - Returns: 转化后的日期
    func dateStringFormat(oldDateStyle: String, newDateStyle: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = oldDateStyle
        var dateString = ""
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = newDateStyle
            dateString = dateFormatter.string(from: date)
        }
        return dateString
    }
    
}

public extension Date {
    
    /// 毫秒级时间戳
    var millisecondsSince1970: Int {
        Int(timeIntervalSince1970 * 1000)
    }
    
    /// 日期00:00:00的时间
    var start: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.startOfDay(for: self)
    }
    
    /// 日期23:59:59的时间
    var end: Date {
        start + 3600 * 24 - 1
    }
    
    /// 计算指定时间后的日期
    ///
    /// - Parameters:
    ///   - year: 年
    ///   - month: 月
    ///   - day: 日
    /// - Returns: 计算后的日期
    func after(year: Int = 0, month: Int = 0, day: Int = 0) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        let date = calendar.date(byAdding: components, to: self)!
        return date
    }
    
    /// 将日期转换为指定格式字符串
    ///
    /// - Parameter dateStyle: 日期格式
    /// - Returns: 转化后的日期字符串
    func formatToString(dateStyle: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateStyle
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    /// 将日期转换为指定本地化格式
    ///
    /// - Parameter template: 日期格式
    /// - Returns: 转化后的日期字符串
    func localizedFormatToString(template: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate(template)
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
}

public extension Calendar {
    
    var startOfCurrentMonth: Date {
        let components = dateComponents([.year, .month], from: Date())
        let startOfMonth = date(from: components)!
        return startOfMonth
    }
    
    var endOfCurrentMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        let endOfMonth = date(byAdding: components, to: startOfCurrentMonth)!
        return endOfMonth
    }
    
    var startOfCurrentYear: Date {
        let components = dateComponents([.year], from: Date())
        let startOfYear = date(from: components)!
        return startOfYear
    }
    
    var endOfCurrentYear: Date {
        var components = DateComponents()
        components.year = 1
        components.second = -1
        let endOfMonth = date(byAdding: components, to: startOfCurrentYear)!
        return endOfMonth
    }
    
}
