//
//  UINavigationController.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 21/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import UIKit

// MARK: - Extensions UINavigationController, by EasyHelper
public extension UINavigationController {
    /// Root Controller in Navigation
    public var rootController: UIViewController? {
        get {
             return self.viewControllers.first
        }
    }
    
}