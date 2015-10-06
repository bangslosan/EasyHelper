//
//  UIViewControllerExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 05/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation


public extension UIViewController {
    var tabBarHeight: CGFloat {
        get {
            if let tab = self.tabBarController {
                return tab.tabBar.frame.size.height
            }
            
            return 0
        }
    }
    var navBar: UINavigationBar? {
        get {
            return navigationController?.navigationBar
        }
    }
    
    func push (vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func pop () {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func present (vc: UIViewController,completion: (()->())?) {
        presentViewController(vc, animated: true, completion: completion)
    }
    
    func dismiss (completion: (()->())?) {
        dismissViewControllerAnimated(true, completion: completion)
    }
    
}