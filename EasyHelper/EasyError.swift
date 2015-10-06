//
//  Error.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 22/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

typealias EasyError = EHError
enum EHError: ErrorType {
    case Error(String)
    case Nil(String)
    case PathForResource(String)
    case NSData(String)
    case NSURL(String)
    case JSON(String)
    case NSDictionary(String)
    

}
extension EasyError: CustomStringConvertible {
    var description: String {
        switch self {
        case Error(let ePrint) : return ePrint
        case Nil(let ePrint) : return ePrint
        case PathForResource(let ePrint) : return ePrint
        case NSData(let ePrint) : return ePrint
        case NSURL(let ePrint) : return ePrint
        case JSON(let ePrint) : return ePrint
        case NSDictionary(let ePrint) : return ePrint
        }
    }
    
    func printLog() {
        printObject(self.description)
    }
}