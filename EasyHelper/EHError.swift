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
    case Nil(whereIs:String,funcIs:String, errorIs:String)
    case PathForResource(String)
    case NSData(whereIs:String,funcIs:String, errorIs:String)
    case NSURL(whereIs:String,funcIs:String, errorIs:String)
    case JSON(whereIs:String,funcIs:String, errorIs:String)
    case NSDictionary(whereIs:String,funcIs:String, errorIs:String)
    
    public var description: String {
  switch self {
        case Error(let whereIs,let funcIs, let errorString) : return "[\(whereIs)][\(funcIs)] \(errorString)"
        case Nil(let whereIs,let funcIs, let errorString) : return "[\(whereIs)][\(funcIs)] \(errorString)"
        case PathForResource(let ePrint) : return ePrint
        case NSData(let whereIs,let funcIs, let errorString) : return "[\(whereIs)][\(funcIs)] \(errorString)"
        case NSURL(let whereIs,let funcIs, let errorString) : return "[\(whereIs)][\(funcIs)] \(errorString)"
        case JSON(let whereIs,let funcIs, let errorString) : return "[\(whereIs)][\(funcIs)] \(errorString)"
        case NSDictionary(let whereIs,let funcIs, let errorString) : return "[\(whereIs)][\(funcIs)] \(errorString)"
        }
    }
    
    func printError() { printObject("[EasyHelper] \(self.description)") }
    
}
