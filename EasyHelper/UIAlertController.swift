//
//  File.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

@available(iOS 8.0, *)
public extension UIAlertController {
    /**
    Open Standard Alert on iOS 8 and more
    
    - parameter delegate:         Delegate UIViewController
    - parameter title:            Title
    - parameter message:          Message
    - parameter buttonOk:         Title button OK
    - parameter buttonCancel:     Title button Cancel
    - parameter handlerOpenAlert: Completion when Alert is opened
    - parameter handlerCancel:    Completion click button Cancel
    - parameter handlerOk:        Completion click button OK
    */
    class func openStandardAlert(
        delegate delegate:UIViewController,
        title:String,
        message:String,
        buttonOk:String,
        buttonCancel:String,
        handlerOpenAlert: (() -> ())?,
        handlerCancel: (() -> ())?,
        handlerOk: (() -> ())?) {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: buttonCancel, style: .Cancel) { (action) in
                handlerCancel?()
            }
            
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: buttonOk, style: .Default) { (action) in
                handlerOk?()
            }
            alertController.addAction(OKAction)
            
            delegate.presentViewController(alertController, animated: true) {
                handlerOpenAlert?()
            }
    }
    
}
@available(*, deprecated=8.0, deprecated=9.0, message="Because !")
public extension UIAlertView {
    /**
    Open Standard Alert on iOS 7
    
    - parameter title:            Title
    - parameter message:          Message
    - parameter buttonOk:         Title button OK
    - parameter buttonCancel:     Title button Cancel
    
    - handler handler :
    func alertView(View: UIAlertView!, buttonIndex: Int){
    switch buttonIndex {
    case 1:
    // OK
    break
    case 0:
    // Cancel
    break
    default:
    // Other
    break
    }
    }
    */
    class func openStandardAlert(
        title title:String,
        message:String,
        buttonOk:String,
        buttonCancel:String) {
            
            let alert: UIAlertView = UIAlertView()
            alert.delegate = self
            alert.title = title
            alert.message = message
            alert.addButtonWithTitle(buttonOk)
            alert.addButtonWithTitle(buttonCancel)
            alert.addButtonWithTitle(title)
            alert.show()
    }
}