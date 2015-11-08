//
//  UILabelExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

/// ############################################################ ///
///                       Initilizers                            ///
/// ############################################################ ///

// MARK: - extension UILabel Initilizers
public extension UILabel {
    convenience init (
        frame: CGRect,
        text: String,
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        font: UIFont) {
            self.init(frame: frame)
            self.text = text
            self.textColor = textColor
            self.textAlignment = textAlignment
            self.font = font
            
            self.numberOfLines = 0
    }
    
    convenience init (
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        height: CGFloat,
        text: String,
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        font: UIFont) {
            self.init(frame: CGRect (x: x, y: y, width: width, height: height))
            self.text = text
            self.textColor = textColor
            self.textAlignment = textAlignment
            self.font = font
            
            self.numberOfLines = 0
    }
    
    
    // AttributedText
    convenience init (
        frame: CGRect,
        attributedText: NSAttributedString,
        textAlignment: NSTextAlignment) {
            self.init(frame: frame)
            self.attributedText = attributedText
            self.textAlignment = textAlignment
            
            self.numberOfLines = 0
    }
    convenience init (
        x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        height: CGFloat,
        attributedText: NSAttributedString,
        textAlignment: NSTextAlignment) {
            self.init(frame: CGRect (x: x, y: y, width: width, height: height))
            self.attributedText = attributedText
            self.textAlignment = textAlignment
            
            self.numberOfLines = 0
    }
}

/// ############################################################ ///
///                       Classical                              ///
/// ############################################################ ///
public extension UILabel {
    
    
    public var fontSize:CGFloat {
        get {
            return self.font.pointSize
        }
        set {
            self.font =  UIFont(name: self.font.fontName, size: newValue)
        }
    }
    public var fontName:String {
        get {
            return self.font.fontName
        }
        set {
            self.font =  UIFont(name: newValue, size: self.font.pointSize)
        }
    }

    
}
