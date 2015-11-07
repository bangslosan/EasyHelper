//
//  UIColorExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import UIKit

/// ############################################################ ///
///                       Extension                              ///
/// ############################################################ ///


// MARK: - Extensions UIColor by EasyHelper 
public extension UIColor {

    /**
    Convert RBGValue HEX to UIColor
    
    :param: rgbValue RBGValue HEX
    :param: alpha    Alpha 0 to 1
    
    :returns: UIColor convert
    */
    public class func fromHex(rgbValue rgbValue:UInt32, alpha :Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    /**
    Ramdom Color

    :returns: UIColor Random
    */
    public class var random:UIColor {
        get {
            return UIColor(red: CGFloat.random, green: CGFloat.random, blue: CGFloat.random, alpha: 1.0)
        }
    }
    
}