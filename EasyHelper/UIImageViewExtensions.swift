//
//  UIImageViewExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

extension UIImageView {

    func round() throws {
        guard  (self.image != nil) else {
            EasyError.Nil("[EasyHelper][round] UIImageView not have image ")
            return
        }
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}