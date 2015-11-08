//
//  CGSizeExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import CoreGraphics

func + (left: CGSize, right: CGSize) -> CGSize {
    return CGSize (width: left.width + right.width, height: left.height + right.height)
}

func - (left: CGSize, right: CGSize) -> CGSize {
    return CGSize (width: left.width - right.width, height: left.width - right.width)
}

// MARK: - Extensions CGSize, EasyHelper
extension CGSize: Hashable {
    /// Add HashValue for CGSize
    public var hashValue: Int {
        get {
            return (width.hashValue ^ height.hashValue)
        }
    }
}


