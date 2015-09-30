//
//  UIRectCornerExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import SpriteKit
public extension UIRectCorner {
    
    public static func setByTuple(sideTake:(topLeft:Bool,topRight:Bool,bottomRight:Bool,bottomLeft:Bool)) -> UIRectCorner {
        var  corner : UIRectCorner = UIRectCorner.AllCorners
        switch sideTake {
        case (true,true,true,true):
            corner = UIRectCorner.AllCorners
            break
        case (_,_,_,true):
            corner = [corner, .BottomLeft]
        case (_,_,true,_):
            corner = [corner, .BottomRight]
        case (_,true,_,_):
            corner = [corner, .TopRight]
        case (true,_,_,_):
            corner = [corner, .TopLeft]
        default:
            break
        }
        return corner
    }
}