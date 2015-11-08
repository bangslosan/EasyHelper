//
//  NStringExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 05/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation
// MARK: - Extensions NSString by EasyHelper
extension NSString {
    
    /**
     Get Size for font with Width & Height of your View
     
     - parameter width:  width
     - parameter height: height
     - parameter font:   font
     
     - returns: Size
     */
    func getSizeWithFont (width: CGFloat = .max, height: CGFloat = .max, font: UIFont) -> CGSize {
        return self.boundingRectWithSize(
            CGSize(width: width, height: height),
            options: .UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName: font],
            context: nil).size
    }
    
}