//
//  CGPoint_Extensions.swift
//  SlideGame
//
//  Created by DaRk-_-D0G on 03/05/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import CoreGraphics

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

/*#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
        return CGFloat(sqrtf(Float(a)))
    }
#endif*/

extension CGPoint {
    /// Length
    var length:CGFloat {
        get {
            return sqrt(self.x * self.x + self.y * self.y)
        }
    }
    
    /// Description
    var normalized:CGPoint { return self / self.length }

    /// CGPoint to CGAffineTransform
    var toCGAffineTransform:CGAffineTransform {
        get {
          return CGAffineTransformMakeTranslation(self.x, self.y)
        }
    }
}