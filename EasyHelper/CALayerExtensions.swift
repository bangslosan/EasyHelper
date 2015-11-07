//
//  CALayerExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 01/09/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

/// ############################################################ ///
///                       Classical                              ///
/// ############################################################ ///

// MARK: - Extensions CALayer Classical
public extension CALayer {
    
    /// Position X
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame = CGRect (x: newValue, y: self.y, width: self.width, height: self.height)
        }
    }
    
    /// Position Y
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame = CGRect (x: self.x, y: newValue, width: self.width, height: self.height)
        }
    }
    
    /// Size Width
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame = CGRect (x: self.x, y: self.y, width: newValue, height: self.height)
        }
    }
    
    /// Size Height
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame = CGRect (x: self.x, y: self.y, width: self.width, height: newValue)
        }
    }
    
    /**
     Add border
     
     - parameter edge:      UIRectEdge
     - parameter color:     UIColor
     - parameter thickness: CGFloat
     */
    public func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.Top:
            border.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), thickness)
            break
        case UIRectEdge.Bottom:
            border.frame = CGRectMake(0, CGRectGetHeight(self.frame) - thickness, CGRectGetWidth(self.frame), thickness)
            break
        case UIRectEdge.Left:
            border.frame = CGRectMake(0, 0, thickness, CGRectGetHeight(self.frame))
            break
        case UIRectEdge.Right:
            border.frame = CGRectMake(CGRectGetWidth(self.frame) - thickness, 0, thickness, CGRectGetHeight(self.frame))
            break
        default:
            break
        }
        
        border.backgroundColor = color.CGColor;
        
        self.addSublayer(border)
    }
}