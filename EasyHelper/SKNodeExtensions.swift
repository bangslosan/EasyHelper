//
//  SKNodeExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import SpriteKit
public extension SKNode {
    
    public var x: CGFloat {
        get {
            
            return position.x
        }
        set {
            
            position.x = newValue
        }
    }
    
    public var y: CGFloat {
        get {
            
            return position.y
        }
        set {
            
            position.y = newValue
        }
    }
}