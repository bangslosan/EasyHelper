//
//  NSURLConnectionExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 05/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import UIKit

extension NSURLConnection {
    
    /*class func urlRequest (
        url: String,
        success: (NSData?)->Void,
        error: ((NSError)->Void)? = nil) {
            
            if let nsurl = NSURL (string: url) {
                
            
                NSURLSession.dataTaskWithRequest
                
                sendAsynchronousRequest(
                    NSURLRequest (URL: nsurl),
                    queue: NSOperationQueue.mainQueue(),
                    completionHandler: { response, data, err in
                        if let e = err {
                            error? (e)
                        } else {
                            success (data)
                        }
                })
            }
    }*/

    

    
   /* class func imageRequest (
        url: String,
        success: (UIImage?)->Void) {
            
            urlRequest(url,
                success: {
                    data in
                    success(UIImage(data: data!))
            })
    }
    
    class func jsonRequest (
        url: String,
        success: (AnyObject?->Void),
        error: ((NSError)->Void)?) {
            
            urlRequest(url,
                success: {
                    data in
                    
                    let json: AnyObject? = try? NSJSONSerialization.JSONObjectWithData(data!,
                        options: NSJSONReadingOptions.AllowFragments)
                    
                    
                    success (json)
                },
                error: {
                    e in
                    error? (e)
            })
    }*/
    
}