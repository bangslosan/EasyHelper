//
//  EasyHelper.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 02/09/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

//(UIScreen.mainScreen().nativeBounds.size.width / UIScreen.mainScreen().nativeScale)
import SystemConfiguration
import Foundation
import UIKit

public typealias EH = EasyHelper
public class EasyHelper {
    
    /**
    CheckUp Connection the new
    
    - returns: Bool Connection Validation
    
    */
    public class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(&zeroAddress, {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }) else {
            return false
        }
        
        var flags : SCNetworkReachabilityFlags = []
        if SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) == false {
            return false
        }
        
        let isReachable = flags.contains(.Reachable)
        let needsConnection = flags.contains(.ConnectionRequired)
        return (isReachable && !needsConnection)
    }
    /// Is iPad
    public class var isIpad:Bool {
        get {
            return UI_USER_INTERFACE_IDIOM() == .Pad
        }
        
    }
    /// Is iPhone
    public class var isIphone:Bool {
        get {
            return UI_USER_INTERFACE_IDIOM() == .Phone
        }
    }
    /// Is iPhone 4 and less
    public static var isIphone4Less:Bool {
        get {
           return EasyHelper.isIphone && screenMaxLength < 568.0
        }
    }
    /// Is iPhone 5
    public static var isIphone5:Bool {
        get {
            return EasyHelper.isIphone && screenMaxLength == 568.0
        }
    }
    /// Is iPhone 6
    public static var isIphone6:Bool {
        get {
            return EasyHelper.isIphone && screenMaxLength == 667.0
        }
    }
    /// Is Iphone 6 Plus
    public static var isIphone6p:Bool {
        get {
            return EasyHelper.isIphone && screenMaxLength == 736.0
        }
    }
    /// Language use
    public class var languageCode:String {
        get {
            return NSLocale.preferredLanguages()[0] as String
           // return NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode) as? String
        }
    }
    /// Country type in iPhone
    public class var countryCode:String? {
        get {
            return NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as? String
        }
    }
    /// Screen Width
    public class var screenWidth:CGFloat {
        get {
            return UIScreen.mainScreen().bounds.size.width
        }
    }
    /// Screen Height
    public class var screenHeight:CGFloat {
        get {
            return UIScreen.mainScreen().bounds.size.height
        }
    }
    /// Screen Scale
    public class var screenScale:CGFloat {
        return UIScreen.mainScreen().scale
    }
    /// Screen Max length
    public class var screenMaxLength:CGFloat {
        get {
           return max(screenWidth, screenHeight)
        }
    }
    /// Screen Min Length
    public class var screenMinLength:CGFloat {
        get {
          return min(screenWidth, screenHeight)
        }
    }
    /// Full access
    public static var isAllowFullAccess : Bool {
        get {
            return (UIPasteboard.generalPasteboard().isKindOfClass(UIPasteboard))
        }
        
    }
    /// Is Portrait
    public static var isPortrait:Bool {
        get {
            return UIScreen.mainScreen().bounds.size.width < UIScreen.mainScreen().bounds.size.height ? true : false
            
        }
    }
    /// Is Landscape
    public static var isLandscape:Bool {
        get {
            return !(isPortrait)
        }
    }
    public static var appDelegate:UIApplicationDelegate? {
        get {
            return UIApplication.sharedApplication().delegate
        }
        set {
            EH.appDelegate = newValue
        }
    }
    public static var rootController:UIViewController? {
        get {
            return EH.appDelegate?.window??.rootViewController
        }
        set {
            EH.rootController = newValue
        }

    }

    
    /**
    Create Screenshot
    
    :returns: UIImage
    */
    public static func getScreenshot(opaque:Bool = false) throws ->  UIImage {
        guard let keyWindowV = UIApplication.sharedApplication().keyWindow else {
            throw EHError.Nil("[EasyHelper][screenShot] Nil object keyWindow")
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            throw EHError.Nil("[EasyHelper][screenShot] Nil object UIGraphicsGetCurrentContext")
        }
        
        let layer = keyWindowV.layer
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, opaque, EasyHelper.screenScale);
        layer.renderInContext(context)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        return screenshot
        
    }
    
    public static func getDataFromUrl(urL:String, completion: ((data:NSData?, error:NSError?) -> ())) {
        if let nsurl = NSURL (string: urL) {
            EasyHelper.getDataFromUrl(nsurl, completion: completion)
        }
    }
    public static func getDataFromUrl(urL:NSURL, completion: ((data:NSData?, error:NSError?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(urL) {
            (data, response, error) in
            completion(data: data, error: error)
            }.resume()
    }
    
    public class func getStoryboard(storyName storyName:String) -> UIStoryboard {
        return UIStoryboard(name: storyName, bundle: nil)
    }
    public class func getViewControllerByIdentifier(storyName storyName:String, identifierVC:String) -> UIViewController {
            return EasyHelper.getStoryboard(storyName: storyName).instantiateViewControllerWithIdentifier(identifierVC)

    }

}

