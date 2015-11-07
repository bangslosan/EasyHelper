//
//  Error.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 22/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

public func printLog(message:String, function:String = __FUNCTION__) {
    #if !NDEBUG
        NSLog("%@, %@", function, message)
    #endif
}
public func printObject(obj:Any) {
    #if !NDEBUG
        print(obj)
    #endif
}


public enum EHError: ErrorType, CustomStringConvertible {
    case Error(whereIs:String,funcIs:String, errorIs:String)
    case Nil(String)
    case PathForResource(String)
    case NSData(whereIs:String,funcIs:String, errorIs:String)
    case NSURL(String)
    case JSON(String)
    case NSDictionary(String)
    
    public var description: String {
        switch self {
        case Error(let whereIs,let funcIs, let errorString) : return "[EasyHelper \(whereIs)][\(funcIs)] \(errorString)"
        case Nil(let ePrint) : return ePrint
        case PathForResource(let ePrint) : return ePrint
        case NSData(let whereIs,let funcIs, let errorString) : return "[EasyHelper \(whereIs)][\(funcIs)] \(errorString)"
        case NSURL(let ePrint) : return ePrint
        case JSON(let ePrint) : return ePrint
        case NSDictionary(let ePrint) : return ePrint
        }
    }
    
    func printError() { printObject("[EasyHelper] \(self.description)") }
    
}
