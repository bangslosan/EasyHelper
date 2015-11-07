//
//  UIScrollViewExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 05/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

/// ############################################################ ///
///                       Exensition                             ///
/// ############################################################ ///

// MARK: - Extensions UIScrollView 
public extension UIScrollView {
    /**
    Scrool to page
    
    - parameter scrollView: UIScrollView
    - parameter page:       Int
    - parameter animated:   Bool
    */
    func scrollToPage(page: Int, animated: Bool) {
        var frame: CGRect = self.frame
        frame.origin.x = frame.size.width * CGFloat(page);
        frame.origin.y = 0;
        self.scrollRectToVisible(frame, animated: animated)
        
    }
}