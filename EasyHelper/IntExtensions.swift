//
//  IntExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/03/2558 E.B..
//  Copyright (c) 2558 ère b. DaRk-_-D0G. All rights reserved.
//

import CoreGraphics

public extension Int {
    
    /// Int to CGFloat
    public var toCGFloat:CGFloat {
        get {
            return CGFloat(self)
        }
        
    }
    
    /// Int to String
    public var toString:String {
        get {
            return String(self)
        }
    }
    /**
    Returns a random Int point number between 0 and Int.max, inclusive.
    By DaRkDOG
    */
    public static var random:Int {
        get {
            return Int.random(Int.max)
        }
    }
    
    /**
    Random integer between 0 and n-1.
    
    :param: n Int to end
    
    :returns: Int
    */
    public static func random(n: Int) -> Int { return Int(arc4random_uniform(UInt32(n))) }
    
    /**
    Random integer between min and max
    
    :param: min       Min Int
    :param: max       Max Int
    :param: exclusion Int Exlusion
    
    :returns: Int
    */
    public static func random(min: Int, max: Int) -> Int {
        return Int.random(max - min + 1) + min
            //Int(arc4random_uniform(UInt32(max - min + 1))) + min }
    }
    
}
// MARK: - Date
public extension Int {
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