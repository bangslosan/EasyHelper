//
//  DoubleExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 17/08/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

public extension Double {
    var isInteger:Bool { return self == Double(Int(self)) }
    /**
    Returns a random floating point number between 0.0 and 1.0, inclusive.
    By DaRkDOG
    */
    public static var random:Double {
        get {
            return Double(arc4random()) / 0xFFFFFFFF
        }
    }
    
    /**
    Create a random num Double
    :param: lower number Double
    :param: upper number Double
    :return: random number Double
    By DaRkDOG
    */
    public static func random(min: Double, max: Double) -> Double {
        return Double.random * (max - min) + min
    }
    
    /// Int to Seconde
    var second: NSTimeInterval {
        get {
            return NSTimeInterval(self)
        }
    }
    /// Int to minute
    var minute: NSTimeInterval {
        get {
            return (self.second * 60)
        }
    }
    /// Int to hour
    var hour: NSTimeInterval {
        get {
            return (self.minute * 60)
        }
    }
    /// Int to day
    var day : NSTimeInterval {
        get {
            return (self.hour * 24)
        }
    }
    /// Int to week
    var week : NSTimeInterval {
        get {
            return (self.day * 7)
        }
    }
    /// Int to work week
    var workWeek : NSTimeInterval {
        get {
            return (self.day * 5)
        }
    }
}