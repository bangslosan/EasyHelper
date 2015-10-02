//
//  BoolExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//


//xcx
extension Bool {
    /**
    Random Bool
    
    :returns: Bool
    */
    public var random:Bool {
        get {
            return Int.random(0, max: 1) == 1
        }
    }
    /**
    Toggle bool
    
    - returns: !(Self Bool)
    */
    mutating func toggle() -> Bool {
        self = !self
        return self
    }
}