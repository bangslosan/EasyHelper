//
//  NSDataExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 05/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//


import UIKit


/// ############################################################ ///
///                     Get Data from                            ///
/// ############################################################ ///

// MARK: - NSDate Extensions get Data from
public extension NSData {
    
    /**
     Get data From string URL whith completion when finished download or error
     
     - parameter urL:        Url / String URL of file
     - parameter completion: ((data:NSData?, error:NSError?) -> ())) / When finish download or error
     
     */
    public static func getDataFromStringUrl(stringURL urL:String, completion: ((data:NSData?, error:NSError?) -> ())) {
        if let nsurl = NSURL (string: urL) {
            NSData.getDataFromNSURL(nsurl, completion: completion)
        }
    }
    /**
     Get Data From NSURL
     
     - parameter urL:        NSURL / URL of file
     - parameter completion: ((data:NSData?, error:NSError?) -> ())) / When finish download or error
     */
    public static func getDataFromNSURL(urL:NSURL, completion: ((data:NSData?, error:NSError?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(urL) {
            (data, response, error) in
            completion(data: data, error: error)
            }.resume()
    }
}

/// ############################################################ ///
///                     Hexadecimal                              ///
/// ############################################################ ///

// MARK: - NSDate Extensions Hexadecimal
public extension NSData {
    /**
     NSData to image, if NSData is image return UIImage
     
     - returns: UIImage
     */
    func toImage () -> UIImage? {
        return UIImage(data: self)
    }
}

/// ############################################################ ///
///                     Hexadecimal                              ///
/// ############################################################ ///

// MARK: - NSDate Extensions Hexadecimal
public extension NSData {
    /**
     Create hexadecimal string representation of NSData object.
     
     - returns: String
     */
    public func hexadecimalString() -> String {
        let string = NSMutableString(capacity: length * 2)
        var byte: UInt8 = 0
        
        for i in 0 ..< length {
            getBytes(&byte, range: NSMakeRange(i, 1))
            string.appendFormat("%02x", byte)
        }
        return string as String
    }
}

