//
//  IntExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/03/2558 E.B..
//  Copyright (c) 2558 ère b. DaRk-_-D0G. All rights reserved.
//

import Foundation

/// ############################################################ ///
///                       To ( Convert )                         ///
/// ############################################################ ///

// MARK: - Classical
public extension Int {
    /* --------------------------------------------------------------------------- */
    /*                              Convert Numbers                                */
    /* --------------------------------------------------------------------------- */
    /// Int to CGFloat
    public var toCGFloat:CGFloat {
        get {
            return CGFloat(self)
        }
    }
    /// Int to Float
    public var toFloat:Float {
        get {
            return Float(self)
        }
    }
    /// Int to Double
    public var toDouble:Double {
        get {
            return Double(self)
        }
    }
    /// Int to String
    public var toString:String {
        get {
            return self.description
        }
    }
    /* --------------------------------------------------------------------------- */
    /*                              Radians Degrees                                */
    /* --------------------------------------------------------------------------- */
    /// Converts an angle in degrees to radians.
    public var toDegreesToRadians:CGFloat {
        get {
            return CGFloat(M_PI) * self.toCGFloat / 180.0
        }
    }
    /// Converts an angle in radians to degrees.
    public var toRadiansToDegrees:CGFloat {
        get {
            return self.toCGFloat * 180.0 / CGFloat(M_PI)
        }
    }
 
}
/// ############################################################ ///
///                         Is ( Tested )                        ///
/// ############################################################ ///

// MARK: - tested
public extension Int {
    /// Checks if a number is even. (pair)
    public var isEven: Bool {
        get {
            return (self % 2) == 0
        }
    }
    /// Checks if a number is odd. (impair)
    public var isOdd: Bool {
        get {
            return !self.isEven
        }
    }
}

/// ############################################################ ///
///                         Random                               ///
/// ############################################################ ///

// MARK: - Random
public extension Int {
    
    /// Returns a random Int point number between 0 and Int.max.
    public static var random:Int {
        get {
            return Int.random(Int.max)
        }
    }
    /**
    Random integer between 0 and n-1.
    
    - parameter n: Int
    
    - returns: Int
    */
    public static func random(n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }
    /**
    Random integer between min and max
    
    - parameter min: Int
    - parameter max: Int
    
    - returns: Int
    */
    public static func random(min: Int, max: Int) -> Int {
        return Int.random(max - min + 1) + min
        //Int(arc4random_uniform(UInt32(max - min + 1))) + min }
    }
}

/// ############################################################ ///
///                          Date                                ///
/// ############################################################ ///

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