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
#endif
enum AnchorPosition: StringLiteralType, CGPoint {
    case TopLeft        = "{0, 0}"
    case TopCenter      = "{0.5, 0}"
    case TopRight       = "{1, 0}"
    
    case MidLeft        = "{0, 0.5}"
    case MidCenter      = "{0.5, 0.5}"
    case MidRight       = "{1, 0.5}"
    
    case BottomLeft     = "{0, 1}"
    case BottomCenter   = "{0.5, 1}"
    case BottomRight    = "{1, 1}"
    
    var description:String {
        return self.rawValue
    }
}*/
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
    public init(stringLiteral value: StringLiteralType) {
        self = CGPointFromString(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        self = CGPointFromString(value)
    }
    
    public init(unicodeScalarLiteral value: StringLiteralType) {
        self = CGPointFromString(value)
    }
}