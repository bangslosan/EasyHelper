//
//  BoolExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//


/// ############################################################ ///
///                          Random                              ///
/// ############################################################ ///

// MARK: - Bool Random
extension Bool {
    /// Random Bool
    public var random:Bool {
        get {
            return Int.random(0, max: 1) == 1
        }
    }
}