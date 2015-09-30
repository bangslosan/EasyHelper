//
//  CGSizeExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import CoreGraphics

extension CGSize: Hashable {
    /// Add HashValue for CGSize
    public var hashValue: Int {
        get {
            return (width.hashValue ^ height.hashValue)
        }
    }
}