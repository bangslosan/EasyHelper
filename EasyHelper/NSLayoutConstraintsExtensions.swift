//
//  NSLayoutConstraints.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 09/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

public extension NSLayoutConstraint {
    
    /**
     Apply Honrizontal constraint on View Contener with array of View
     
     - parameter viewContener: UIView
     - parameter views:        [UIView]
     */
    class func applyHorizontalConstraint(viewContener:UIView,views:[UIView]) {
        viewContener.translatesAutoresizingMaskIntoConstraints = false
        for (index, button) in views.enumerate() {
            
            let topConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0)
            
            let bottomConstraint = NSLayoutConstraint(item: button, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0)
            
            let rightConstraint : NSLayoutConstraint!
            
            if index == 2 {
                rightConstraint = NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: 0)
                viewContener.addConstraint(rightConstraint)
            }
            
            let leftConstraint : NSLayoutConstraint!
            
            if index == 0 {
                leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: 0)
            } else {
                
                let prevtButton = views[index-1]
                leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: prevtButton, attribute: .Right, multiplier: 1.0, constant: 1)
                
                let firstButton = views[0]
                let widthConstraint = NSLayoutConstraint(item: firstButton, attribute: .Width, relatedBy: .Equal, toItem: button, attribute: .Width, multiplier: 1.0, constant: 1)
                
                widthConstraint.priority = 800
                viewContener.addConstraint(widthConstraint)
                
            }
            
            viewContener.removeConstraints([topConstraint, bottomConstraint, leftConstraint])
            viewContener.addConstraints([topConstraint, bottomConstraint, leftConstraint])
        }
    }
}