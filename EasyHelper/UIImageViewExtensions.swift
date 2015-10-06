//
//  UIImageViewExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

extension UIImageView {
    
    convenience init (
        frame: CGRect,
        nsurl:NSURL,
        defaultImage:String? = nil,
        contentMode:UIViewContentMode = .ScaleAspectFit,
        beforeAddImage:((imageView:UIImageView,donwloadedImage:UIImage)->())? = nil,
        errorAddImage:(()->())? = nil) {
            self.init(frame: frame, imageName: defaultImage, contentMode: contentMode)
            self.imageWithUrl(nsurl,succesDownload: beforeAddImage,errorDownload: errorAddImage)
    }
    
    convenience init  (
        frame: CGRect,
        url:String,
        defaultImage:String? = nil, contentMode:UIViewContentMode = .ScaleAspectFit) {
            
            self.init(frame: frame, imageName: defaultImage, contentMode: contentMode)
            
            guard let nsurl = NSURL (string: url) else {
                EHError.Nil("[UIImageView][imageWithUrl] NSURL nil").printLog()
                self.image = nil
                return
            }
            
            self.imageWithUrl(nsurl)
            
    }
    
    convenience init (frame: CGRect, imageName: String?, contentMode:UIViewContentMode = .ScaleAspectFit) {
        guard let hasImgName = imageName, let hasImage = UIImage (named: hasImgName) else {
            self.init (frame: frame)
            self.contentMode = contentMode
            return
        }
        self.init (frame: frame,image: hasImage, contentMode: contentMode)
    }
    
    convenience init (frame: CGRect, image: UIImage, contentMode:UIViewContentMode = .ScaleAspectFit) {
        self.init (frame: frame)
        self.image = image
        self.contentMode = contentMode
    }
    func imageWithUrl(url:NSURL,
        succesDownload:((imageView:UIImageView,donwloadedImage: UIImage)->())? = nil,
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
                        
                        if (errorDownload != nil) { errorDownload!() }; return
                    }
                    guard succesDownload != nil else {
                        succesDownload!(imageView: self, donwloadedImage:hasImage); return
                    }
                    self.image = hasImage
                    
                })
            }
    }
    
    
    
    
    func round() throws {
        guard  (self.image != nil) else {
            EHError.Nil("[EasyHelper][round] UIImageView not have image ")
            return
        }
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}