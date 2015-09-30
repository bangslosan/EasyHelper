//
//  Debug//printable.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

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