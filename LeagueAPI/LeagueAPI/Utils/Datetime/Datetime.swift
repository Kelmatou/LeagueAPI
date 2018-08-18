//
//  Datetime.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/17/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

open class Datetime: Comparable, Equatable {
    
    // MARK: - Variable
    
    public private(set) var date: Date
    
    private var negativeYear: Bool = false
    
    public var year: Int {
        let yearDate: Int = Calendar.current.component(.year, from: date)
        return negativeYear ? -yearDate + 1 : yearDate
    }
    
    public var month: Int {
        return Calendar.current.component(.month, from: date)
    }
    
    public var day: Int {
        return Calendar.current.component(.day, from: date)
    }
    
    public var hour: Int {
        return Calendar.current.component(.hour, from: date)
    }
    
    public var minute: Int {
        return Calendar.current.component(.minute, from: date)
    }
    
    public var second: Int {
        return Calendar.current.component(.second, from: date)
    }
    
    public var monthName: String {
        return Datetime.monthFromInt(month)?.rawValue ?? ""
    }
    
    public var weekday: String {
        return Datetime.weekDayFromInt(weekdayIndex)?.rawValue ??  ""
    }
    
    public var weekdayIndex: Int {
        return getDayIndexInWeek()
    }
    
    // MARK: - Init
    
    public init() {
        self.date = Date()
    }
    
    public init(date: Date) {
        self.date = date
    }
    
    public init(timestamp: Long) {
        self.date = Date(timeIntervalSince1970: Double(timestamp / 1000))
    }
    
    public init?(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0, timeZone: TimeZone? = nil) {
        negativeYear = year < 0
        let dateComponents: DateComponents = DateComponents(calendar: nil, timeZone: timeZone , era: nil, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        let newDate: Date? = Calendar.current.date(from: dateComponents)
        guard let unwrappedNewDate = newDate else {
            return nil
        }
        self.date = unwrappedNewDate
    }
    
    public convenience init?(dateTime: Datetime, timeZone: TimeZone) {
        self.init(year: dateTime.year, month: dateTime.month, day: dateTime.day, hour: dateTime.hour, minute: dateTime.minute, second: dateTime.second, timeZone: timeZone)
    }
    
    public convenience init?(string: String, format: String) {
        // Get Token list
        let listOfTokens: [DateToken] = DateToken.tokenList(from: format)
        // Check validity
        guard Datetime.isValidCreationDateFormat(listOfTokens) else { return nil }
        // Get Match list
        if (DateToken.match(tokens: listOfTokens, with: string)) {
            // Convert and create
            var year: Int = 0
            var month: Int = 0
            var day: Int = 0
            var hour: Int = 0
            var minute: Int = 0
            var second: Int = 0
            for token in listOfTokens {
                switch token.type {
                case .Year4Digits:
                    guard let yearInt = Int(token.match) else { return nil }
                    year = yearInt
                case .MonthDigits:
                    guard let monthInt = Int(token.match) else { return nil }
                    month = monthInt
                case .MonthShort, .MonthLong:
                    guard let shortMonth = token.match.substring(startIndex: 0, length: 3) else { return nil }
                    guard let longMonth = Datetime.shortToLongMonth(shortMonth) else { return nil }
                    month = Datetime.intFromMonth(longMonth)
                case .DayDigits:
                    guard let dayInt = Int(token.match) else { return nil }
                    day = dayInt
                case .HourDigits:
                    hour = Int(token.match) ?? 0
                case .MinuteDigits:
                    minute = Int(token.match) ?? 0
                case .SecondDigits:
                    second = Int(token.match) ?? 0
                default:
                    continue
                }
            }
            self.init(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        }
        else {
            return nil
        }
    }
    
    // MARK: - Public methods
    
    /**
     Operator == for Datetime.
     
     - parameter date1: a Datetime object
     - parameter date2: a Datetime object
     
     - returns: true if (year, month, day, hour, minute and second) are the same.
     */
    public static func ==(date1: Datetime, date2: Datetime) -> Bool {
        return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day
            && date1.hour == date2.hour && date1.minute == date2.minute && date1.second == date2.second
    }
    
    /**
     Operator < for Datetime.
     
     - parameter date1: a Datetime object
     - parameter date2: a Datetime object
     
     - returns: true if (year, month, day, hour, minute and second) are the same.
     */
    public static func <(date1: Datetime, date2: Datetime) -> Bool {
        return date1.year < date2.year || (date1.year == date2.year
            && date1.month < date2.month || (date1.month == date2.month
                && date1.day < date2.day || (date1.day == date2.day
                    && date1.hour < date2.hour || (date1.hour == date2.hour
                        && date1.minute < date2.minute || (date1.minute == date2.minute
                            && date1.second < date2.second)))))
    }
    
    /**
     Create a new Datetime object by adding any amount of time
     
     - parameter year: the amount of year to add
     - parameter month: the amount of month to add
     - parameter day: the amount of day to add
     - parameter hour: the amount of hour to add
     - parameter minute: the amount of minute to add
     - parameter second: the amount of second to add
     
     - returns: a new datetime with time added. nil is returned if date couldn't be calculated
     */
    public func datetimeByAdding(year: Int = 0, month: Int = 0, day: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0) -> Datetime? {
        let date1: Date? = Calendar.current.date(byAdding: .year, value: year, to: date)
        guard let date1Unwrapped = date1 else { return nil }
        let date2: Date?  = Calendar.current.date(byAdding: .month, value: month, to: date1Unwrapped)
        guard let date2Unwrapped = date2 else { return nil }
        let date3: Date?  = Calendar.current.date(byAdding: .day, value: day, to: date2Unwrapped)
        guard let date3Unwrapped = date3 else { return nil }
        let date4: Date?  = Calendar.current.date(byAdding: .hour, value: hour, to: date3Unwrapped)
        guard let date4Unwrapped = date4 else { return nil }
        let date5: Date?  = Calendar.current.date(byAdding: .minute, value: minute, to: date4Unwrapped)
        guard let date5Unwrapped = date5 else { return nil }
        let date6: Date?  = Calendar.current.date(byAdding: .second, value: second, to: date5Unwrapped)
        guard let date6Unwrapped = date6 else { return nil }
        return Datetime(date: date6Unwrapped)
    }
    
    /**
     Get number of seconds from now in seconds
     
     - parameter date1: a Datetime object
     - parameter date2: a Datetime object
     
     - returns: number of second from date1 to date2
     */
    public static func interval(from date1: Datetime, to date2: Datetime) -> Double? {
        if let interval1 = date1.intervalFrom1970(), let interval2 = date2.intervalFrom1970() {
            return interval2 - interval1
        }
        return nil
    }
    
    /**
     Get number of seconds from 1st January 1970 in seconds
     
     
     - returns: number of second from 1st January 1970 in seconds
     */
    public func intervalFrom1970() -> Double? {
        let datetimeUTC = Datetime(dateTime: self, timeZone: TimeZone(identifier: "UTC")!)
        if let datetimeUTC = datetimeUTC {
            return datetimeUTC.date.timeIntervalSince1970
        }
        return nil
    }
    
    /**
     Get current Datetime as String (default format is yyyy/MM/dd hh:mm:ss)
     
     - parameter format: the format of the String output
     
     - returns: a String representing Datetime object
     */
    public func toString(format: String = "yyyy/MM/dd hh:mm:ss") -> String {
        let year4Format: String = (year < 0 ? "-" : "") + (year.isBetween(min: -999, max: 999) ? year.isBetween(min: -99, max: 99) ? year.isBetween(min: -9, max: 9) ? "000" : "00" : "0" : "") + "\(year < 0 ? -year : year)"
        let year2Format: String = (year < 0 ? "-" : "") + (year4Format.substring(startIndex: year4Format.count - 2 < 0 ? 0 : year4Format.count - 2) ?? "")
        let monthFormat: String = (month < 10 ? "0" : "") + "\(month)"
        let dayFormat: String = (day < 10 ? "0" : "") + "\(day)"
        let hourFormat: String = (hour < 10 ? "0" : "") + "\(hour)"
        let minuteFormat: String = (minute < 10 ? "0" : "") + "\(minute)"
        let secondFormat: String = (second < 10 ? "0" : "") + "\(second)"
        var index: Int = 0
        var output: String = ""
        while (index < format.count) {
            if let token = DateToken.recognizeToken(format, at: index), token != .Other {
                switch token {
                case .Year4Digits:
                    output += year4Format
                case .Year2Digits:
                    output += year2Format
                case .MonthDigits:
                    output += monthFormat
                case .DayDigits:
                    output += dayFormat
                case .HourDigits:
                    output += hourFormat
                case .MinuteDigits:
                    output += minuteFormat
                case .SecondDigits:
                    output += secondFormat
                case .MonthShort:
                    output += monthName.substring(startIndex: 0, length: 3) ?? monthName
                case .MonthLong:
                    output += monthName
                case .DayShort:
                    output += weekday.substring(startIndex: 0, length: 3) ?? weekday
                case .DayLong:
                    output += weekday
                case .Other:
                    continue
                }
                index += token.rawValue.count
            }
            else {
                output.append(format[format.index(format.startIndex, offsetBy: index)])
                index += 1
            }
        }
        return output
    }
    
    // MARK: - Private methods
    
    private static func isValidCreationDateFormat(_ tokenList: [DateToken]) -> Bool {
        return tokenList.filter { $0.type == DateToken.Tokens.Year4Digits }.count == 1
            && tokenList.filter { $0.type == DateToken.Tokens.MonthDigits || $0.type == DateToken.Tokens.MonthShort || $0.type == DateToken.Tokens.MonthLong }.count == 1
            && tokenList.filter { $0.type == DateToken.Tokens.DayDigits }.count == 1
            && tokenList.filter { $0.type == DateToken.Tokens.HourDigits }.count <= 1
            && tokenList.filter { $0.type == DateToken.Tokens.MinuteDigits }.count <= 1
            && tokenList.filter { $0.type == DateToken.Tokens.SecondDigits }.count <= 1
    }
    
    /**
     Returns the index of a day in week
     0 = Monday
     6 = Sunday
     
     - parameter date: the day
     
     - returns: Int representing the index of the day
     */
    private func getDayIndexInWeek() -> Int {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let firstWeekDay = calendar.component(.weekday, from: date)
        if firstWeekDay == 1 {
            return 6
        }
        else if firstWeekDay == 2 {
            return 0
        }
        else {
            return firstWeekDay - 2
        }
    }
}
