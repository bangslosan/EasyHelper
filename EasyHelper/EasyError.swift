//
//  Error.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 22/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation


enum EasyError: ErrorType {
    case Nil(String)
    case PathForResource(String)
    case NSData(String)
    case NSURL(String)
    case JSON(String)
}