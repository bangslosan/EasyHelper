//
//  UILabelExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation
public extension UILabel {
    
    public var fontSize:CGFloat {
        get {
            return self.font.pointSize
        }
        set {
            self.font =  UIFont(name: self.font.fontName, size: newValue)
        }
    }
}
