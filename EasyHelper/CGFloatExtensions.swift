//
//  CGFLoatExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 05/05/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

/// ############################################################ ///
///                       To ( Convert )                         ///
/// ############################################################ ///

// MARK: - Classical
extension CGFloat {
    /* --------------------------------------------------------------------------- */
    /*                              Convert Numbers                                */
    /* --------------------------------------------------------------------------- */
    /// CGFloat to String
    public var toString:String {
        get {
            return self.description
        }
    }
    /// CGFloat to CGFloat
    public var toInt:Int {
        get {
            return Int(self)
        }
        
    }
    /// CGFloat to Float
    public var toFloat:Float {
        get {
            return Float(self)
        }
        
    }
    /// CGFloat to Double
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
            return CGFloat(M_PI) * self / 180.0
        }
    }
    /// Converts an angle in radians to degrees.
    public var toRadiansToDegrees:CGFloat {
        get {
            return self * 180.0 / CGFloat(M_PI)
        }
    }
    /* --------------------------------------------------------------------------- */
    /*                    CGAffineTransformMakeTranslation                         */
    /* --------------------------------------------------------------------------- */
    /**
    Float structure in translation matrix for an animation
    
    - parameter uCGFloatX: CGFloat
    - parameter uCGFloatY: CGFloat
    
    - returns: CGAffineTransform Structure in translation matrix
    */
    static func toCGAffineTransform(uCGFloatX uCGFloatX: CGFloat, uCGFloatY: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(uCGFloatX, uCGFloatY)
    }
}
/// ############################################################ ///
///                         Is ( Tested )                        ///
/// ############################################################ ///

// MARK: - tested
public extension CGFloat {
    /// Is Integer
    var isInt:Bool {
        get {
            return floor(self) == self
        }
    }
}
/// ############################################################ ///
///                         Random                               ///
/// ############################################################ ///

// MARK: - Random
public extension CGFloat {
    /// Randomly returns either 1.0 or -1.0.
    public static var randomSign:CGFloat {
        get {
            return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
        }
    }
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random:CGFloat {
        get {
            return CGFloat(Float.random)
        }
    }
    /**
    Create a random num CGFloat
    
    - parameter min: CGFloat
    - parameter max: CGFloat
    
    - returns: CGFloat random number
    */
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random * (max - min) + min
    }
}


/// ############################################################ ///
///                         Math Angle                           ///
/// ############################################################ ///

// MARK: - Angle
public extension CGFloat {
    /**
    Returns the shortest angle between two angles. The result is always between -π and π.
    
    - parameter angle1: CGFloat
    - parameter angle2: CGFloat
    
    - returns: CGFloat
    */
    func shortestAngleBetween(angle1: CGFloat, angle2: CGFloat) -> CGFloat {
        let π = CGFloat(M_PI)
        let twoπ = π * 2.0
        var angle = (angle2 - angle1) % twoπ
        if (angle >= π) {
            angle = angle - twoπ
        }
        if (angle <= -π) {
            angle = angle + twoπ
        }
        return angle
    }
}