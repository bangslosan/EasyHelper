//
//  SKSpriteNodeExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import SpriteKit
public extension SKSpriteNode {
     /// YANN
    public var width: CGFloat {
        get {
            
            return size.width
        }
        set {
            
            size.width = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            
            return size.height
        }
        set {
            
            size.height = newValue
        }
    }
}