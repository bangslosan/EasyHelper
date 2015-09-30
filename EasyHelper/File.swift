//
//  File.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation
import MediaPlayer


public extension UIViewController {
    
    func displayVideoFromURL( address: String ) {
       let path = NSBundle.mainBundle().pathForResource("keyboard_swift", ofType:"mp4")
        if let url:NSURL = NSURL( fileURLWithPath: path! ) {
            
            if let moviePlayer = MPMoviePlayerController( contentURL: url ) {
                moviePlayer.prepareToPlay()
                view.addSubview( moviePlayer.view )
                moviePlayer.fullscreen = true
                moviePlayer.scalingMode = MPMovieScalingMode.AspectFill
                moviePlayer.controlStyle = MPMovieControlStyle.Embedded
                moviePlayer.movieSourceType = MPMovieSourceType.Streaming
                
                moviePlayer.play()
            }
        }
    }
    /*
    class func openDialogGameCenterAuthentication(title title:String, message:String,buttonOK:String,buttonOpenGameCenterLogin:String, completion: ((openGameCenterAuthentification:Bool) -> Void)?) {
        
        let delegateUIVC = EasyGameCenter.delegate
        
        
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            
            delegateUIVC.presentViewController(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: buttonOK, style: .Default, handler: {
                action in
                
                if completion != nil { completion!(openGameCenterAuthentification: false) }
                
            }))
            alert.addAction(UIAlertAction(title: buttonOpenGameCenterLogin, style: .Default, handler: {
                action in
                
                EasyGameCenter.showGameCenterAuthentication({
                    (resultOpenGameCenter) -> Void in
                    
                    if completion != nil { completion!(openGameCenterAuthentification: resultOpenGameCenter) }
                })
                
            }))
        } else {
            let alert: UIAlertView = UIAlertView()
            alert.delegate = self
            alert.title = title
            alert.message = message
            alert.addButtonWithTitle(buttonOK)
            alert.addButtonWithTitle(buttonOpenGameCenterLogin)
            alert.show()
        }
        
        
        
        
        
    }
    /**
    Class callBack UIAlertView iOS 7
    
    - parameter View:        UIAlertView
    - parameter buttonIndex: ButtonIndex
    
    */
    class func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
        
        switch buttonIndex{
            
        case 1:
            EasyGameCenter.showGameCenterAuthentication({
                (resultOpenGameCenter) -> Void in
                EasyGameCenter.debug("\n[Easy Game Center] showGameCenterAuthentication() has been opened\n")
            })
            break;
        case 0:
            EasyGameCenter.debug("Dismiss")
            break;
        default:
            break;
            
        }
    }*/
}