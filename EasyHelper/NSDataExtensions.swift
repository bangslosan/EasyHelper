//
//  NSDataExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 05/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//


import UIKit

public extension NSData {
    

    
}
public extension NSBundle {
    
    public class func getPath(name name:String, type:String) -> String? {
        return NSBundle.mainBundle().pathForResource(name, ofType: type)
    }
    
}