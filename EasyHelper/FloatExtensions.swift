//
//  FloatExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 17/08/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

/// ############################################################ ///
///                       To ( Convert )                         ///
/// ############################################################ ///

// MARK: - Classical
public extension Float {
    /* --------------------------------------------------------------------------- */
    /*                              Convert Numbers                                */
    /* --------------------------------------------------------------------------- */
    /// Int to String
    public var toString:String {
        get {
            return self.description
        }
    }
    /// Float to CGFloat
    public var toCGFloat:CGFloat {
        get {
            return CGFloat(self)
        }
        
    }
    /// Float to Int
    public var toInt:Int {
        get {
            return Int(self)
        }
        
    }
    /// Float to Double
    public var toDouble:Double {
        get {
            return Double(self)
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
///                        Is ( Tested )                         ///
/// ############################################################ ///
// MARK: - Is tested
public extension Float {
    /// Is Integer
    public var isInt:Bool {
        get {
            return floor(self) == self
        }
    }
}
/// ############################################################ ///
///                         Random                               ///
/// ############################################################ ///
// MARK: - Random
public extension Float {
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random:Float {
        get {
            return Float(arc4random()) / 0xFFFFFFFF
        }
    }
    /**
    Create a random num Float
    
    - parameter min: Float
    - parameter max: Float
    
    - returns: Float
    */
    public static func random(min min: Float, max: Float) -> Float {
        return Float.random * (max - min) + min
    }
}
/// ############################################################ ///
///                           Date                               ///
/// ############################################################ ///
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