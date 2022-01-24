//
//  UIDatePicker+ChainableTests.swift
//  
//
//  Created by 林博文 on 2022/1/2.
//

import XCTest
@testable import ChainableUIKit

final class UIDatePickerChainableTests: XCTestCase {
    
    func testCalendar() {
        let result = UIDatePicker().chainable
            .calendar(Calendar(identifier: .chinese))
            .wrapped.calendar.identifier == .chinese
        XCTAssert(result)
    }
    
    func testDate() {
        let date = Date()
        let result = UIDatePicker().chainable
            .date(date, isAnimated: false)
            .wrapped.date == date
        XCTAssert(result)
    }
    
    func testLocale() {
        let locale = Locale(identifier: "en")
        let result = UIDatePicker().chainable
            .locale(locale)
            .wrapped.locale == locale
        XCTAssert(result)
    }
    
    func testTimeZone() {
        let timeZone = TimeZone.current
        let result = UIDatePicker().chainable
            .timeZone(timeZone)
            .wrapped.timeZone == timeZone
        XCTAssert(result)
    }
    
    func testDatePickerMode() {
        let result = UIDatePicker().chainable
            .datePickerMode(.time)
            .wrapped.datePickerMode == .time
        XCTAssert(result)
    }
    
    func testMaximumDate() {
        let date = Date()
        let result = UIDatePicker().chainable
            .maximumDate(date)
            .wrapped.maximumDate == date
        XCTAssert(result)
    }
    
    func testMinimumDate() {
        let date = Date()
        let result = UIDatePicker().chainable
            .minimumDate(date)
            .wrapped.minimumDate == date
        XCTAssert(result)
    }
    
    func testMinuteInterval() {
        let result = UIDatePicker().chainable
            .minuteInterval(5)
            .wrapped.minuteInterval == 5
        XCTAssert(result)
    }
    
    func testCountDownDuration() {
        let result = UIDatePicker().chainable
            .datePickerMode(.countDownTimer)
            .countDownDuration(120)
            .wrapped.countDownDuration == 120
        XCTAssert(result)
    }
    
    @available(iOS 13.4, *)
    func testPreferredDatePickerStyle() {
        let result = UIDatePicker().chainable
            .preferredDatePickerStyle(.wheels)
            .wrapped.preferredDatePickerStyle == .wheels
        XCTAssert(result)
    }
    
    func testIsRoundsToMinuteInterval() {
        if #available(iOS 15.0, *) {
            let result = UIDatePicker().chainable
                .isRoundsToMinuteInterval(true)
                .wrapped.roundsToMinuteInterval
            XCTAssert(result)
        } else {
            XCTAssert(true)
        }
    }
    
}
