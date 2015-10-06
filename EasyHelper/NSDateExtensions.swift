//
//  NSDateExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 26/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

/*
* Date Extension
* Inspirate by : https://github.com/malcommac/SwiftDate
*
* - Convert Numbers
* - Radians Degrees
*/

/// ############################################################ ///
///      Operations with NSDate WITH DATES (==,!=,<,>,<=,>=      ///
/// ############################################################ ///

//MARK: OPERATIONS WITH DATES (==,!=,<,>,<=,>=)
extension NSDate : Comparable {}

/**
NSDate == NSDate

- returns: Bool
*/
public func == (left: NSDate, right: NSDate) -> Bool {
    return (left.compare(right) == NSComparisonResult.OrderedSame)
}
/**
NSDate != NSDate

- returns: Bool
*/
public func != (left: NSDate, right: NSDate) -> Bool {
    return !(left == right)
}
/**
NSDate < NSDate

- returns: Bool
*/
public func < (left: NSDate, right: NSDate) -> Bool {
    return (left.compare(right) == NSComparisonResult.OrderedAscending)
}
/**
NSDate > NSDate

- returns: Bool
*/
public func > (left: NSDate, right: NSDate) -> Bool {
    return (left.compare(right) == NSComparisonResult.OrderedDescending)
}
/**
NSDate <= NSDate

- returns: Bool
*/
public func <= (left: NSDate, right: NSDate) -> Bool {
    return !(left > right)
}
/**
NSDate >=

- returns: Bool
*/
public func >= (left: NSDate, right: NSDate) -> Bool {
    return !(left < right)
}
/// ############################################################ ///
///               Arithmetic operations with NSDate              ///
/// ############################################################ ///

//MARK: ARITHMETIC OPERATIONS WITH DATES (-,-=,+,+=)
/**
NSDate - 1.day

- returns: NSDate
*/

public func - (left : NSDate, right: NSTimeInterval) -> NSDate {
    return left.dateByAddingTimeInterval(-right)
}
/**
NSDate -= 1.month

*/
public func -= (inout left: NSDate, right: NSTimeInterval) {
    left = left.dateByAddingTimeInterval(-right)
}
/**
NSDate + 1.year

- returns: NSDate
*/
public func + (left: NSDate, right: NSTimeInterval) -> NSDate {
    return left.dateByAddingTimeInterval(right)
}
/**
NSDate += 1.month

*/
public func += (inout left: NSDate, right: NSTimeInterval) {
    left = left.dateByAddingTimeInterval(right)
}

/// ############################################################ ///
///                     Get days functions                       ///
/// ############################################################ ///

// MARK: - Get days functions
public extension NSDate {
    /// Get the day component of the date
    var day: Int			{
        get {
            return components.day
        }
    }
    /// Get the month component of the date
    var month : Int			{
        get {
            return components.month
        }
    }
    /// Get the year component of the date
    public var year : Int			{
        get {
            return components.year
        }
    }
    /// Get the hour component of the date
    var hour: Int			{
        get {
            return components.hour
        }
    }
    /// Get the minute component of the date
    var minute: Int			{
        get {
            return components.minute
        }
    }
    /// Get the second component of the date
    var second: Int			{
        get {
            return components.second
        }
    }
    /// Get the era component of the date
    var era: Int			{
        get {
            return components.era
        }
    }
    /// Get the week of the month component of the date
    var weekOfMonth: Int	{
        get {
            return components.weekOfMonth
        }
    }
    /// Get the week of the month component of the date
    var weekOfYear: Int		{
        get {
            return components.weekOfYear
        }
    }
    /// Get the weekday component of the date
    var weekday: Int		{
        get {
            return components.weekday
        }
    }
    /// Get the weekday ordinal component of the date
    var weekdayOrdinal: Int	{
        get {
            return components.weekdayOrdinal
        }
    }


}
/// ############################################################ ///
///                     To ( Converted )                         ///
/// ############################################################ ///
public extension NSDate {
    /* --------------------------------------------------------------------------- */
    /*                              Create Day                                     */
    /* --------------------------------------------------------------------------- */
    func toString (format: String) -> String {
        let formatter = NSDateFormatter ()
        formatter.locale = NSLocale(localeIdentifier: "tr")
        formatter.dateFormat = format
        
        return formatter.stringFromDate(self)
    }
    
    func toTimeStamp() -> String {
        let timeInterval = self.timeIntervalSince1970
        let result = String(format: "/Date(%.0f000)/", arguments:[timeInterval])
        return result
    }
}
/// ############################################################ ///
///                     Create days functions                    ///
/// ############################################################ ///

// MARK: - Create days functions
public extension NSDate {
    /* --------------------------------------------------------------------------- */
    /*                              Create Day                                     */
    /* --------------------------------------------------------------------------- */
    /**
    Create a new NSDate instance based on refDate (if nil uses current date) and set components
    
    :param: refDate reference date instance (nil to use NSDate())
    :param: year    year component (nil to leave it untouched)
    :param: month   month component (nil to leave it untouched)
    :param: day     day component (nil to leave it untouched)
    :param: tz      time zone component (it's the abbreviation of NSTimeZone, like 'UTC' or 'GMT+2', nil to use current time zone)
    
    :returns: a new NSDate with components changed according to passed params
    */
    public class func date(refDate refDate: NSDate? = nil, year: Int?  = nil, month: Int?  = nil, day:Int?  = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, tz: String? = nil) -> NSDate {
        let referenceDate = refDate ?? NSDate()
        return referenceDate.set(year, month: month, day: day, hour: hour, minute: minute, second: second, tz: tz)
    }
    /* --------------------------------------------------------------------------- */
    /*                    Create day by Today, Yesteday, Tomorrow                  */
    /* --------------------------------------------------------------------------- */
    /**
    Return a new NSDate instance with the current date and time set to 00:00:00
    
    :param: tz optional timezone abbreviation
    
    :returns: a new NSDate instance of the today's date
    */
    public class func today() -> NSDate {
        let nowDate = NSDate()
        return NSDate.date(refDate: nowDate, year: nowDate.year, month: nowDate.month, day: nowDate.day)
    }
    
    /**
    Return a new NSDate istance with the current date minus one day
    
    :param: tz optional timezone abbreviation
    
    :returns: a new NSDate instance which represent yesterday's date
    */
    public class func yesterday() -> NSDate {
        return today()-1.day
    }
    
    /**
    Return a new NSDate istance with the current date plus one day
    
    :param: tz optional timezone abbreviation
    
    :returns: a new NSDate instance which represent tomorrow's date
    */
    public class func tomorrow() -> NSDate {
        return today()+1.day
    }

}

/// ############################################################ ///
///                       Is ( Tested )                          ///
/// ############################################################ ///
// MARK: - Is ( Tested )
public extension NSDate {

    /// Return true if the date is the weekend
    public var isWeekend:Bool {
        let range = NSCalendar.currentCalendar().maximumRangeOfUnit(NSCalendarUnit.Weekday)
        return (self.weekday == range.location || self.weekday == range.length)
    }
    /// Return true if current date's day is not a weekend day
    public var isWeekday:Bool {
        return !self.isWeekend
    }
}

/// ############################################################ ///
///                         Private                              ///
/// ############################################################ ///

// MARK: - Get days functions
public extension NSDate {
    /* --------------------------------------------------------------------------- */
    /*                              Create Day                                     */
    /* --------------------------------------------------------------------------- */
    /**
    Individual set single component of the current date instance
    
    :param: year   a non-nil value to change the year component of the instance
    :param: month  a non-nil value to change the month component of the instance
    :param: day    a non-nil value to change the day component of the instance
    :param: hour   a non-nil value to change the hour component of the instance
    :param: minute a non-nil value to change the minute component of the instance
    :param: second a non-nil value to change the second component of the instance
    :param: tz     a non-nil value (timezone abbreviation string as for NSTimeZone) to change the timezone component of the instance
    
    :returns: a new NSDate instance with changed values
    */
    private func set(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, tz: String? = nil) -> NSDate! {
        let components = self.components
        components.year = year ?? self.year
        components.month = month ?? self.month
        components.day = day ?? self.day
        components.hour = hour ?? self.hour
        components.minute = minute ?? self.minute
        components.second = second ?? self.second
        components.timeZone = (tz != nil ? NSTimeZone(abbreviation: tz!) : NSTimeZone.defaultTimeZone())
        return NSCalendar.currentCalendar().dateFromComponents(components)
    }
    /* --------------------------------------------------------------------------- */
    /*                              Components                                     */
    /* --------------------------------------------------------------------------- */
    /// Specify calendrical units such as day and month
    private class var componentFlags:NSCalendarUnit {
        return [NSCalendarUnit.Year ,
            NSCalendarUnit.Month ,
            NSCalendarUnit.Day,
            NSCalendarUnit.WeekOfYear,
            NSCalendarUnit.Hour ,
            NSCalendarUnit.Minute ,
            NSCalendarUnit.Second ,
            NSCalendarUnit.Weekday ,
            NSCalendarUnit.WeekdayOrdinal,
            NSCalendarUnit.WeekOfYear]
    }
    /// Return the NSDateComponents which represent current date
    private var components: NSDateComponents {
        return  NSCalendar.currentCalendar().components(NSDate.componentFlags, fromDate: self)
    }
}
