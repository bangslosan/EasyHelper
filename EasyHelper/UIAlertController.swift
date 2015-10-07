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
    
    - parameter delegate:              Delegate UIViewController
    - parameter title:                 Title
    - parameter message:               Message
    - parameter buttonOk:              Title button OK
    - parameter buttonCancel:          Title button Cancel
    - parameter completionOpenedAlert: Completion when Alert is opened
    - parameter completionCancel:      Completion click button Cancel
    - parameter completionOk:          Completion click button OK
    */
    class func openStandardAlert(
        delegate delegate:UIViewController,
        title:String?,
        message:String?,
        buttonOk:String,
        buttonCancel:String,
        completionOpenedAlert: (() -> ())?,
        completionCancel: ((action:UIAlertAction) -> ())?,
        completionOk: ((action:UIAlertAction) -> ())?) {


            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: buttonCancel, style: .Cancel, handler: completionCancel)
            
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: buttonOk, style: .Default, handler: completionOk)
            alertController.addAction(OKAction)
            
            delegate.presentViewController(alertController, animated: true) {
                completionOpenedAlert?()
            }
    }
    /**
    Open Sheet Alert
    
    - parameter dg:                       Delegate UIViewController
    - parameter title:                    Title
    - parameter message:                  Message
    - parameter buttonOk:                 Title button OK
    - parameter buttonCancel:             Title button Cancel
    - parameter buttonDestructive:        Title button Destructive
    - parameter completionOpenSheetAlert: Completion when Alert is opened
    - parameter completionCancel:         Completion click button Cancel
    - parameter completionOk:             Completion click button Ok
    - parameter completionDestructive:    Completion click button Destructive
    */
    class func openSheetAlert(
        delegate dg:UIViewController,
        title:String?,
        message:String?,
        buttonOk:String?,
        buttonCancel:String?,
        buttonDestructive:String?,
        completionOpenSheetAlert: (() -> ())?,
        completionCancel: ((action:UIAlertAction) -> ())?,
        completionOk: ((action:UIAlertAction) -> ())?,
        completionDestructive: ((action:UIAlertAction) -> ())?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: buttonCancel, style: .Cancel,handler: completionCancel)
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: buttonOk, style: .Default, handler: completionOk)
        alertController.addAction(OKAction)
        
        let destroyAction = UIAlertAction(title: buttonDestructive, style: .Destructive, handler: completionDestructive)
        alertController.addAction(destroyAction)
        
        dg.presentViewController(alertController, animated: true, completion: completionOpenSheetAlert)
    }
    /**
    Open Standard Alert with more buttons on iOS 8+
    
    - parameter delegate:         Delegate UIViewController
    - parameter title:            Title
    - parameter message:          Message
    - parameter buttonOk:         Title button OK
    - parameter buttonCancel:     Title button Cancel
    - parameter handlerOpenAlert: Completion when Alert is opened
    - parameter handlerCancel:    Completion click button Cancel
    - parameter handlerOk:        Completion click button OK
    */
    class func openStandardAlertMoreButtons(
        delegate dg:UIViewController,
        title:String?,
        message:String?,
        buttons:String...,
        buttonCancel:String,
        handlerOpenAlert: (() -> ())?,
        handlerCancel: (() -> ())?,
        handlerButtons: ((UIAlertAction) -> ())?) {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            for oneButton in buttons {
                
                let buttonAction = UIAlertAction(title: oneButton, style: .Default, handler: handlerButtons)
                alertController.addAction(buttonAction)
                
            }
            
            let cancelAction = UIAlertAction(title: buttonCancel, style: .Cancel) { (action) in
                handlerCancel?()
            }
            alertController.addAction(cancelAction)
            
            dg.presentViewController(alertController, animated: true) {
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
        delegate dg : UIViewController,
        title:String,
        message:String?,
        buttonOk:String,
        buttonCancel:String) {
            
            let alert: UIAlertView = UIAlertView()
            alert.delegate = dg
            alert.title = title
            alert.message = message
            alert.addButtonWithTitle(buttonOk)
            alert.addButtonWithTitle(buttonCancel)
            alert.addButtonWithTitle(title)
            alert.show()
    }
    /**
    Open Sheet Alert
    
    - parameter dg:                    UIActionSheetDelegate
    - parameter inView:                UIView
    - parameter title:                  Title
    - parameter message:                Message
    - parameter buttonOk:               Title button OK
    - parameter buttonCancel:           Title button Cancel
    - parameter buttonDestructive:      Title button Destructive
    - parameter handlerOpenSheetAlert:  Completion when Alert is opened
    - parameter handlerCancel:          Completion click button Cancel
    - parameter handlerOk:              Completion click button Ok
    - parameter handleDestructive:      Completion click button Destructive
    
    - handlerSheetDelegate : func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) { switch buttonIndex { } }
    */
    class func openSheetAlert(
        delegateSheet dg:UIActionSheetDelegate,
        inView: UIView,
        title:String?,
        message:String?,
        buttonOk:String,
        buttonCancel:String?,
        buttonDestructive:String?) {

        let actionSheet = UIActionSheet(title: title, delegate: dg, cancelButtonTitle: buttonCancel, destructiveButtonTitle: buttonDestructive, otherButtonTitles: buttonOk)
        actionSheet.actionSheetStyle = .Default
        actionSheet.showInView(inView)
    }

}