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
    public class func addTextToImage(image:UIImage, label:UILabel,pointof: CGPoint) throws -> UIImage {
        
        guard let textLabel = label.text else {
            throw EasyError.Nil("[EasyHelper][addTextToImage] Label haven't text")
        }
        
        let dict:NSDictionary = [
            NSForegroundColorAttributeName:label.textColor,
            NSFontAttributeName : label.font]
        
        UIGraphicsBeginImageContext(image.size)
        image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.height))
        
        let rect: CGRect = CGRectMake(pointof.x, pointof.y, image.size.width, image.size.height)
        textLabel.drawInRect(CGRectIntegral(rect), withAttributes:dict as? [String : AnyObject])
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    /**
    Create Screenshot
    
    :returns: UIImage
    */
    public static func screenshot(opaque:Bool = false) throws ->  UIImage {
        guard let keyWindowV = UIApplication.sharedApplication().keyWindow else {
            throw EasyError.Nil("[EasyHelper][screenShot] Nil object keyWindow")
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            throw EasyError.Nil("[EasyHelper][screenShot] Nil object UIGraphicsGetCurrentContext")
        }
        
        let layer = keyWindowV.layer
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, opaque, EasyHelper.screenScale);
        layer.renderInContext(context)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        return screenshot
        
    }
}
