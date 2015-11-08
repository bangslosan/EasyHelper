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
    public class var statusBarHeight: CGFloat {
        return UIApplication.sharedApplication().statusBarFrame.height
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
    /// Get the appDelegate
    public static var appDelegate:UIApplicationDelegate? {
        get {
            return UIApplication.sharedApplication().delegate
        }
        set {
            UIApplication.sharedApplication().delegate = newValue
        }
    }
    
   /// Get the RootController
   public static var rootController:UIViewController? {
        get {
            return UIApplication.sharedApplication().delegate?.window??.rootViewController
        }
        set {
            UIApplication.sharedApplication().delegate?.window??.rootViewController = newValue
        }

    }
    /**
     Get Storyboard
     
     - parameter storyName: String / Name of Storyboard
     
     - returns: UIStoryboard
     */
    public class func getStoryboard(storyName storyName:String) -> UIStoryboard {
        return UIStoryboard(name: storyName, bundle: nil)
    }
    /**
     Get ViewController by indentifier
     
     - parameter storyName:    String / Name of Storyboard
     - parameter identifierVC: String / Identifier of VC
     
     - returns: UIViewController
     */
    public class func getViewControllerByIdentifier(storyName storyName:String, identifierVC:String) -> UIViewController {
            return UIStoryboard(name: storyName, bundle: nil).instantiateViewControllerWithIdentifier(identifierVC)

    }
    
    //********** A REVOIR ********//
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

}

