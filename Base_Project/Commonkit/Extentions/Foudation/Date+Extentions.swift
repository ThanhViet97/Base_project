//
//  Date+Extentions.swift
//  Base_Project
//
//  Created by VietPT on 12/08/2021.
//

import Foundation

extension Date {
    
    var day: Int {
        return Calendar(identifier: .gregorian).component(.day, from: self)
    }
    
    var year: Int {
        return Calendar(identifier: .gregorian).component(.year, from: self)
    }
    
    func toTimestampMilisecond() -> UInt64 {
        return toTimestampSecond() * 1000
    }
    
    func toTimestampSecond() -> UInt64 {
        return UInt64(self.timeIntervalSince1970)
    }
    
    func toTimestampString() -> String {
        return String(toTimestampSecond())
    }
    
    func toDateFormatString(format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
    
    func isSameDate(date: Date) -> Bool {
        return self.day == date.day
    }

    func isSameYear(date: Date) -> Bool {
        return self.year == date.year
    }
    
    static func getDateFromTimestamp(timestamp: UInt64?) -> Date? {
        guard var timestamp = timestamp else { return nil }
        timestamp /= 1000
        return Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
}

// MARK: - Distance between two dates
extension Date {
    
    func minutesFrom(date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    func hoursFrom(date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
    func daysFrom(date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    func monthsFrom(date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    
    func yearsFrom(date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}

// MARK: - Function is primary for library datepicker
extension Date {
    
    static func isAWeekStartOnSunday() -> Bool {
        // USA a week starts on Sunday. Calendar.current.firstWeekday => 1
        // Some country a week starts on Monday. Calendar.current.firstWeekday => 2
        return Calendar(identifier: .gregorian).firstWeekday == 1
    }
    
    static func indexSundayOfDaysInWeek() -> Int {
        let startIndexOfDaysInWeek = 1
        let endIndexOfDaysInWeek = 7
        let indexSundayOfDaysInWeek = isAWeekStartOnSunday() ? startIndexOfDaysInWeek : endIndexOfDaysInWeek
        return indexSundayOfDaysInWeek
    }
    
    static func date(year: Int, month: Int = 1, day: Int = 1, isMaxTime: Bool, timeZone: TimeZone? = .current) -> Date? {
        let hour = isMaxTime ? 23 : 0
        let minute = isMaxTime ? 59 : 0
        let second = isMaxTime ? 59 : 0
        let dateComponents = DateComponents(calendar: Calendar(identifier: Calendar.Identifier.gregorian),
                                            timeZone: timeZone,
                                            year: year,
                                            month: month,
                                            day: day,
                                            hour: hour,
                                            minute: minute,
                                            second: second)
        
        return Calendar(identifier: .gregorian).date(from: dateComponents)
    }
    
    static func date(from date: Date, hour: Int, minute: Int) -> Date? {
        let dateComponents = DateComponents(calendar: Calendar(identifier: Calendar.Identifier.gregorian),
                                            year: date.year,
                                            month: date.monthDatePicker(),
                                            day: date.day,
                                            hour: hour,
                                            minute: minute)
        return Calendar(identifier: .gregorian).date(from: dateComponents)
    }
    
    func weekDayDatePicker() -> Int {
        return Calendar(identifier: .gregorian).component(.weekday, from: self)
    }
    
    func yearDatePicker() -> Int {
        return Calendar(identifier: .gregorian).component(.year, from: self)
    }
    
    func monthDatePicker() -> Int {
        return Calendar(identifier: .gregorian).component(.month, from: self)
    }
    
    func dayDatePicker() -> Int {
        return Calendar(identifier: .gregorian).component(.day, from: self)
    }
    
    func hourDatePicker() -> Int {
        return Calendar(identifier: .gregorian).component(.hour, from: self)
    }
    
    func minuteDatePicker() -> Int {
        return Calendar(identifier: .gregorian).component(.minute, from: self)
    }
    
    func secondDatePicker() -> Int {
        return Calendar(identifier: .gregorian).component(.second, from: self)
    }
    
    func daysBetweenDates(date: Date) -> Int {
        let fromDate = Date.date(year: self.year,
                                  month: self.monthDatePicker(),
                                  day: self.dayDatePicker(),
                                  isMaxTime: false,
                                  timeZone: TimeZone(abbreviation: "UTC"))
        let toDate = Date.date(year: date.year,
                                   month: date.monthDatePicker(),
                                   day: date.dayDatePicker(),
                                   isMaxTime: false,
                                   timeZone: TimeZone(abbreviation: "UTC"))
        return Calendar(identifier: .gregorian).dateComponents([.day], from: fromDate ?? self, to: toDate ?? date).day ?? 0
    }
    
    func daysBetweenDatesExactly(date: Date) -> Int {
        return Calendar(identifier: .gregorian).dateComponents([.day], from: self, to: date).day ?? 0
    }
    
    func hoursBetweenDates(date: Date) -> Int {
        return Calendar(identifier: .gregorian).dateComponents([.hour], from: self, to: date).hour ?? 0
    }
}

extension Date {
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
}
