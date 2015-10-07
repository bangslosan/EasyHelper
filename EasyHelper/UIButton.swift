//
//  UIButton.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 05/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

public extension UIButton {
    convenience init (x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        self.init(frame: CGRect (x: x, y: y, width: width, height: height))
    }
}