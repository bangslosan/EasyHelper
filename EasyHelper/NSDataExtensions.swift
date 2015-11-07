//
//  NSDataExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 05/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//


import UIKit

// MARK: - NSDate Extensions by EasyHelper
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
