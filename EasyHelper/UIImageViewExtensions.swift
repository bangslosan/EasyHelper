//
//  UIImageViewExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

extension UIImageView {
    
    /**
    Initialize with internal image ( with image or not if imageName = nil )
    
    - parameter frame:       CGRect
    - parameter imageName:   String? / Name of image in Asset
    - parameter contentMode: UIViewContentMode ( default = ScaleAspectFit )
    
    - returns: UIImageView
    */
    convenience init (frame: CGRect, imageName: String?, contentMode:UIViewContentMode = .ScaleAspectFit) {
        guard let hasImgName = imageName, let hasImage = UIImage (named: hasImgName) else {
            self.init (frame: frame)
            self.contentMode = contentMode
            return
        }
        self.init (frame: frame,image: hasImage, contentMode: contentMode)
    }
    /**
    Initialize with internal image
    
    - parameter frame:       CGRect
    - parameter image:       String / Name of image in Asset
    - parameter contentMode: UIViewContentMode ( default = ScaleAspectFit )
    
    - returns: UIImageView
    */
    convenience init (frame: CGRect, image: UIImage, contentMode:UIViewContentMode = .ScaleAspectFit) {
        self.init (frame: frame)
        self.image = image
        self.contentMode = contentMode
    }
    /**
    Initialize, Download a image on a server
    
    Can set a default image
    
    When is finished download a callBack (succesDownload or errorDownload) is call, for assign the image with an animation
    
    Or directly if succesDownload = nil
    
    succesDownload (imageView = self / UIImageView , donwloadedImage = UIImage / image downloaded)
    
    
    - parameter frame:           CGRect
    - parameter nsurl:           NSURL
    - parameter defaultImage:    String? / default image (default = nil)
    - parameter contentMode:     UIViewContentMode (default = .ScaleAspectFit)
    - parameter succesDownload:  (imageView = self / UIImageView , donwloadedImage = UIImage / image downloaded)->()
    - parameter errorDownload:   ()->()
    
    - returns: UIImageView
    */
    convenience init (
        frame: CGRect,
        nsurl:NSURL,
        defaultImage:String? = nil,
        contentMode:UIViewContentMode = .ScaleAspectFit,
        succesDownload:((imageView:UIImageView,donwloadedImage:UIImage)->())? = nil,
        errorDownload:(()->())? = nil) {
            self.init(frame: frame, imageName: defaultImage, contentMode: contentMode)
            self.imageWithUrl(nsurl,succesDownload: succesDownload,errorDownload: errorDownload)
    }
    /**
    Initialize, Download a image on a server
    
    Can set a default image
    
    When is finished download a callBack (succesDownload or errorDownload) is call, for assign the image with an animation
    
    Or directly if succesDownload = nil
    
    succesDownload (imageView = self / UIImageView , donwloadedImage = UIImage / image downloaded)
    
    
    - parameter frame:           CGRect
    - parameter url:             String Url
    - parameter defaultImage:    String? / default image (default = nil)
    - parameter contentMode:     UIViewContentMode (default = .ScaleAspectFit)
    - parameter succesDownload:  (imageView = self / UIImageView , donwloadedImage = UIImage / image downloaded)->()
    - parameter errorDownload:   ()->() / Call when error
    
    - returns: UIImageView
    */
    convenience init  (
        frame: CGRect,
        url:String,
        defaultImage:String? = nil,
        contentMode:UIViewContentMode = .ScaleAspectFit,
        succesDownload:((imageView:UIImageView,donwloadedImage:UIImage)->())? = nil,
        errorDownload:(()->())? = nil) {
            
            self.init(frame: frame, imageName: defaultImage, contentMode: contentMode)
            
            guard let nsurl = NSURL (string: url) else {
                EHError.Nil("[UIImageView][imageWithUrl] URLString is nil").printLog()
                return
            }
            
            self.imageWithUrl(nsurl,succesDownload: succesDownload,errorDownload: errorDownload)
            
    }
    /**
    Download image for server
    
    When is finished download a callBack (succesDownload or errorDownload) is call, for assign the image with an animation
    
    Or directly if succesDownload = nil
    
    succesDownload (imageView = self / UIImageView , donwloadedImage = UIImage / image downloaded)
    
    - parameter url:             NSURL
    - parameter succesDownload:  (imageView = self / UIImageView , donwloadedImage = UIImage / image downloaded)->()
    - parameter errorDownload:   ()->() / Call when error
    */
    func imageWithUrl(
        url:NSURL,
        succesDownload:((imageView:UIImageView,imageDownload: UIImage)->())? = nil,
        errorDownload:(()->())? = nil) {
            
            EasyHelper.getDataFromUrl(url) {
                (data, error)  in
                
                EasyAsync.GlobalMainQueue({
                    guard error == nil, let hasData = data, let hasImage = UIImage(data: hasData)   else {
                        if error != nil {
                            EHError.Error("[UIImageView][imageWithUrl] Error : \(error)").printLog()
                        } else {
                            EHError.NSData("[UIImageView][imageWithUrl] NSData Error : data not image").printLog()
                        }
                        
                        if (errorDownload != nil) { errorDownload!() }
                        return
                    }
                    if (succesDownload != nil) { succesDownload!(imageView: self, imageDownload:hasImage); return }
                    self.image = hasImage
                    
                })
            }
    }
}