//
//  NSBunlde.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 07/11/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

// MARK: - Extensions NSBundle by EasyHelper
public extension NSBundle {
    
    /**
     Get path from name file with extensions file
     
     - parameter name: name / Name of file
     - parameter type: type / file extensions .md etc..
     
     - returns: String / Nil / return path of file
     */
    public class func getPath(name name:String, type:String) -> String? {
        return NSBundle.mainBundle().pathForResource(name, ofType: type)
    }
}