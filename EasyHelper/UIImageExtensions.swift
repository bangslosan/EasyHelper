//
//  UIImageExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//
import UIKit

public extension UIImage {
    /**
    Resize UIImageView
    
    :param: image      UImage
    :param: sizeChange CGSize new size
    
    :returns: UIImage resize
    */
    public class func resize(image image:UIImage, newSize:CGSize)-> UIImage{
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(newSize, !hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: newSize))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    /**
    Add text to UIImage
    
    :param: image   UIImage add the Text
    :param: label   UILabel Custom
    :param: pointof CGPoint where add the label
    
    :returns: UIImage
    */
    public class func addTextToImage(image:UIImage, label:UILabel,pointof: CGPoint) -> UIImage {
        
        if label.text == nil { EHError.Nil("[EasyHelper][addTextToImage] Label haven't text") }
        let dict:NSDictionary = [
            NSForegroundColorAttributeName:label.textColor,
            NSFontAttributeName : label.font]
        
        UIGraphicsBeginImageContext(image.size)
        image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.height))
        
        let rect: CGRect = CGRectMake(pointof.x, pointof.y, image.size.width, image.size.height)
        label.text?.drawInRect(CGRectIntegral(rect), withAttributes:dict as? [String : AnyObject])
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

}
