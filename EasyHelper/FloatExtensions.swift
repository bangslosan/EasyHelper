//
//  FloatExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 17/08/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

public extension Float {
    /// Int to String
    public var toString:String {
        get {
            
            return self.description
            //String(self)
        }
    }
    
    var isInteger:Bool { return floor(self) == self }

    /**
    Returns a random floating point number between 0.0 and 1.0, inclusive.
    By DaRkDOG
    */
    public static var random:Float {
        get {
            return Float(arc4random()) / 0xFFFFFFFF
        }
    }
    /**
    Create a random num Float
    :param: lower number Float
    :param: upper number Float
    :return: random number Float
    By DaRkDOG
    */
    public static func random(min min: Float, max: Float) -> Float {
        return Float.random * (max - min) + min
    }
    
    
}

// MARK: - Date
public extension Float {
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