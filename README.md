<h2 align="center">
    EasyHelper
</h2>
<h4 align="center">
    EasyHelper is a simple library for quick prototyping and rapid development.
</h4>
```ruby
pod 'EasyHelper', :git => 'https://github.com/DaRkD0G/EasyHelper.git'
```
-------

[![Twitter: @YannickSteph](https://img.shields.io/badge/contact-@YannickSteph-blue.svg?style=flat)](https://twitter.com/YannickSteph)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/DaRkD0G/EasyHelper/blob/master/LICENSE)

Get in contact with the developer on Twitter: [YannickSteph](https://twitter.com/YannickSteph)

-------

## Most of this library 👍 :
- Light library ( all the variables are slight statement )
- Very convenient to use ( only one line call Dispath, IsIphone etc...)


##Todo ☕️ :

☑️ Message UI


## Installation 📲 :

- Download EasyHelper
- Import in your projet targe EasyHelper

## Usage :

- Add in your file.swift at the header "import EasyHelper"

-------

## Features :

# There is a lot of documentation make it appear to progressively  😎

-------

## Table of Contents

* [Installation](#Installation)
* [UIKit](#UIKit)
* [UIView](#UIView)
	* [Init](#UIView-Init)
	* [Frame](#UIView-Frame)
	* [Helper](#UIView-Helper)
	* [Border](#UIView-Border)
	* [Shadow](#UIView-Shadow)
	* [Animation](#UIView-Animation)
* [UIAlertController / UIAlertView](#UIAlertController)



## Installation <a id="Installation"></a>

#### Manual
Copy & Paste  into your project

#### Cocoapods




## Documentation

## UIKit extension <a id="UIKit"></a>

### UIView extension <a id="UIView"></a>

#### Init <a id="UIView-Init"></a>

###### Quick init method for views
``` swift
    let view = (x: 10, y: 10, width: 100, height: 100)
```
###### Quick init from superView
``` swift
    let view = (superView: mySuperView)
```

#### Frame <a id="UIView-Frame"></a>

##### Get/Set frame values  

###### X / Y 
``` swift
    let positionX: CGFloat = view.x
    view.x = 10
    
```

``` swift
    let positionY: CGFloat = view.y
    view.y = 10
```

###### Width / Height
``` swift
    let positionY: CGFloat = view.width
    view.width = 100
```

``` swift
    let positionY: CGFloat = view.height
    view.height = 100
```

###### Position 
``` swift
    let position: CGPoint = view.position
    view.position = CGPointMake(100, 100)
``` 

###### Get Position in Center
``` swift
    let position: CGPoint = view.applyCenter
```

###### Size 
``` swift
    let size: CGSize = view.size
    view.size = CGSizeMake(100, 100)
```

#### Helper <a id="UIView-Helper"></a>

###### Remove all SubView
``` swift
    view.removeAllSubViews()
```

###### View to image
``` swift
    view.toImage()
```

#### Border <a id="UIView-Border"></a>

###### Border
<img src="http://yannickstephan.com/easyhelper/border.png" height="200" width="200"/>
``` swift
    /**
    Set Border
    
    - parameter borderColor: UIColor    ( default = UIColor.blackColor() )
    - parameter borderWidth: CGFloat    ( default = 1.0 )
    */
    /// Example
    view.applyBorder()
    
    view.applyBorder(UIColor.yellowColor(), borderWidth: 10)
``` 

###### Rounder
<img src="http://yannickstephan.com/easyhelper/rounder.png" height="200" width="200"/>
``` swift
    /**
    Set Rounder
    
    - parameter radius: CGFloat
    */
    /// Example
    view.applyRounder(10)
``` 

###### Round
<img src="http://yannickstephan.com/easyhelper/round.png" height="200" width="200"/>
``` swift
    /**
    Set Round
    
    */
    /// Example
    view.applyRound()
``` 

#### Shadow <a id="UIView-Shadow"></a>
<img src="http://yannickstephan.com/easyhelper/plainshadows.png" height="200" width="200"/>

###### Plain Shadow

``` swift
   
    /**
    Plain Shadow

    - parameter shadowColor:   UIColor  ( default = UIColor.blackColor() )
    - parameter shadowOpacity: Float    ( default = 0.4 )
    - parameter shadowRadius:  CGFloat  ( default = 0.5 )
    - parameter shadowOffset:  CGSize   ( default = CGSize(width: 0, height: 10) )
    */
    /// Example
    view.applyPlainShadow()
            
    view.applyPlainShadow(shadowColor: UIColor.yellowColor(), shadowOpacity: 0.8, shadowRadius: 3) 
```

###### Adding Curved Shadow
<img src="http://yannickstephan.com/easyhelper/curveshadows.png" height="200" width="200"/>
``` swift
    
    /**
    Curved Shadow
    
    - parameter shadowOpacity: Float    ( default = 0.3 )
    - parameter shadowOffset:  CGSize   ( default = CGSize(width: 0, height: -3) )
    - parameter shadowColor:   UIColor  ( default = UIColor.blackColor() )
    - parameter depth:         CGFloat  ( default = 11.0 )
    - parameter lessDepth:     CGFloat  ( default = 0.8 )
    - parameter curviness:     CGFloat  ( default = 5 )
    - parameter radius:        CGFloat  ( default = 1 )
    */
    /// Example
    
    view.applyCurvedShadow()
        
    view.applyCurvedShadow(shadowOpacity: 0.8, shadowColor: UIColor.yellowColor(), radius: 3) 
```

###### Adding Hover Shadow
<img src="http://yannickstephan.com/easyhelper/hovershadows.png" height="200" width="200"/>
``` swift
    /**
    Hover Shadow

    */
    view.applyHoverShadow()  
```
###### Adding Flat shadow
<img src="http://yannickstephan.com/easyhelper/flatshadow.png" height="100" width="110"/>
``` swift
    /**
    Flat shadow
    
    <img src="http://yannickstephan.com/easyhelper/flatshadow.png" height="100" width="100"/>
    */
    view.applyFlatShadow()
```

#### Animation <a id="UIView-Animation"></a>

###### Stop animation

``` swift
	view.stopAnimation()
``` 

###### Is being animated

``` swift
    view.isBeingAnimated()
``` 

###### Apply Fade In
<img src="http://zippy.gfycat.com/FrailTiredHusky.gif" height="200" width="200"/>

``` swift
    /**
    Fade In
    
    - parameter duration:      NSTimeInterval ( default = 1.0 )
    - parameter delay:         NSTimeInterval ( default = 0 )
    - parameter alpha:         CGFloat ( default = 1.0 )
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    // Example
	
    view.applyFadeIn()
    	
    view.applyFadeIn(duration: 10)
    	
    view.applyFadeIn(duration: 10, delay: 10, toAlpha: 0.8) { 
    	(bool) -> () in
    	print("Is finish")
    }
``` 

###### Apply Fade Out
<img src="http://zippy.gfycat.com/DeadFickleFlatcoatretriever.gif" height="200" width="200"/>
``` swift
    /**
    Fade In
    
    - parameter duration:      NSTimeInterval   ( default = 1.0 )
    - parameter delay:         NSTimeInterval   ( default = 0.0 )
    - parameter alpha:         CGFloat          ( default = 0 )
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    /// Example
	
    view.applyFadeOut()
    	
    view.applyFadeOut(duration: 10)
    	
    view.applyFadeOut(duration: 10, delay: 10) { 
        (bool) -> () in
        print("Is finish")
    }
``` 

###### Shake Horizontally
<img src="http://zippy.gfycat.com/EnlightenedForcefulGallowaycow.gif" height="200" width="200"/>

``` swift
    /**
    Shake Horizontally
    
    - parameter duration:      duration     ( default = 0.5 )
    - parameter moveValues:    moveValues   ( default = [-12, 12, -8, 8, -4, 4, 0] )
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    /// Example
	
    view.applyShakeHorizontally()
    
    view.applyShakeHorizontally { 
     	// When animation is finished
    }
    
    view.applyShakeHorizontally(duration: 10)

``` 

###### Shake Horizontally
<img src="http://zippy.gfycat.com/EqualEnchantingHarborporpoise.gif" height="255" width="183"/>
``` swift
    /**
    Shake Horizontally
    
    - parameter duration:      duration     ( default = 0.5 )
    - parameter moveValues:    moveValues   ( default = [-12, 12, -8, 8, -4, 4, 0] )
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    /// Example
	
    view.applyShakeVertically()
    
    view.applyShakeVertically { 
     	// When animation is finished
    }
    
    view.applyShakeVertically(duration: 10)

``` 

###### Rotate To Angle
<img src="http://zippy.gfycat.com/HoarseSnoopyArizonaalligatorlizard.gif" height="200" width="200"/>
``` swift
    /**
     Set Rotation on View
    
    - parameter angle:         CGFloat ( example 360 = 360 degrees)
    - parameter duration:      NSTimeInterval
    - parameter direction:     UIViewContentMode ( .Left, .Right )
    - parameter repeatCount:   Float
    - parameter autoReverse:   Bool
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    /// Example
    view.applyRotateToAngle(360, duration: 3, direction: UIViewContentMode.Left)
    
    view.applyRotateToAngle(360, duration: 3, direction: UIViewContentMode.Left) {
        /// When animation is finished
    }


``` 

###### Pulse 
<img src="http://zippy.gfycat.com/PotableRemorsefulIndianglassfish.gif" height="200" width="200"/>
``` swift
    /**
    Set animation Scale on View
    - parameter duration:      NSTimeInterval
    - parameter toScale:       CGFloat
    - parameter repeatAnimate: Bool
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    /// Example
    view.applyPulseToSize(duration: 5, toScale: 1.5, repeatAnimate: false)
    
    view.applyPulseToSize(duration: 5, toScale: 1.5, repeatAnimate: false) {
        /// When animation is finished        
    }

``` 

###### Motion Effects 
<img src="http://static.ashfurrow.com/teehanlax/motionEffects.gif" height="100" width="200"/>
``` swift
    /**
    Motion Effects
    
    - parameter minimumRelativeValueX: Min Relative Value X ( default = -10.00 )
    - parameter maximumRelativeValueX: Max Relative Value X ( default = 10.00 )
    - parameter minimumRelativeValueY: Min Relative Value Y ( default = -10.00 )
    - parameter maximumRelativeValueY: Max Relative Value Y ( default = 10.00 )
    */
    /// Example
    view.applyMotionEffects()
    
    view.applyMotionEffects(-30, maximumRelativeValueX: 30, minimumRelativeValueY: -30, maximumRelativeValueY: 30)

``` 

#### UIAlertController <a id="UIAlertController"></a>
###### Open Standard Alert
<img src="http://nshipster.s3.amazonaws.com/uialertcontroller-alert-defautl-style.png" height="100" width="200"/>
iOS 8
``` swift
    @available(iOS 8.0, *)
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
    UIAlertController.openStandardAlert(
    	delegate: uiviewcontroller, 
    	title: "Title", 
    	message: "Message", 
    	buttonOk: "Ok", 
    	buttonCancel: "No", 
    	completionOpenedAlert: { 
                
        }, completionCancel: { 
            (action) -> () in
                    
        }) { 
            (action) -> () in
                    
    }
    
    ///	Func pass in parameter
    /// func funcOpend () { }
    /// func funcCancel (action:UIAlertAction) { }
    /// func funcOk (action:UIAlertAction) { }
    UIAlertController.openStandardAlert(
    	delegate: uiviewcontroller, 
    	title: "Title", 
    	message: "Message", 
    	buttonOk: "Ok", 
    	buttonCancel: "No", 
    	completionOpenedAlert: funcOpend, completionCancel: funcCancel, completionOk: funcOk)
```
iOS 7
``` swift
    @available(iOS 7.0, *)
    /**
    Open Standard Alert on iOS 7
    
    - parameter title:            Title
    - parameter message:          Message
    - parameter buttonOk:         Title button OK
    - parameter buttonCancel:     Title button Cancel
    
    - handler handler Add :
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
    UIAlertView.openStandardAlert(
        delegate dg : uiviewcontroller,
        title:"Title",
        message:"message",
        buttonOk:"ok",
        buttonCancel:"no")
```
###### Open Sheet Alert
iOS 8
<img src="http://nshipster.s3.amazonaws.com/uialertcontroller-action-sheet-automatic-style.png" height="100" width="200"/>
``` swift
    @available(iOS 8.0, *)
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
    UIAlertController.openSheetAlert(
    delegate: uiviewcontroller, 
    title: "Titre", 
    message: "message", 
    buttonOk: "Ok", 
    buttonCancel: "Cancel",
    buttonDestructive: "Destroy", 
    	completionOpenSheetAlert: { 
                
        }, completionCancel: { 
        	(action) -> () in
                    
        }, completionOk: { 
        	(action) -> () in
                    
        }) { 
        	(action) -> () in
                    
    }
    
    
    ///	Func pass in parameter
    /// func funcOpend () { }
    /// func funcCancel (action:UIAlertAction) { }
    /// func funcOk (action:UIAlertAction) { }
    /// func funcDestroy (action:UIAlertAction) { }
    UIAlertController.openSheetAlert(
    delegate: uiviewcontroller, 
    title: "Titre", 
    message: "message", 
    buttonOk: "Ok", 
    buttonCancel: "Cancel",
    buttonDestructive: "Destroy", 
    completionOpenSheetAlert: funcOpend, completionCancel: funcCancel, completionOk: funcOk,completionDestructive: funcDestroy)
```
iOS 7
``` swift
     @available(iOS 7.0, *)
    /**
    Open Sheet Alert
    
    - parameter delegateSheet:          UIActionSheetDelegate
    - parameter inView:                 UIView
    - parameter title:                  Title
    - parameter message:                Message
    - parameter buttonOk:               Title button OK
    - parameter buttonCancel:           Title button Cancel
    - parameter buttonDestructive:      Title button Destructive
    
    - handlerSheetDelegate : 
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) { 
    	switch buttonIndex { } 
    }
    */
    UIAlertView.openSheetAlert(delegateSheet: uiactionsheetdelegate, inView: view, title: "Titre", message: "message", buttonOk: "ok", buttonCancel: "No", buttonDestructive: "Destroy")
```
###### Open Standard Alert With More Buttons
<img src="http://nshipster.s3.amazonaws.com/uialertcontroller-alert-one-two-three-cancel.png" height="100" width="200"/>
iOS 8
``` swift
     @available(iOS 7.0, *)
    /**
    Open Sheet Alert
    
    - parameter delegateSheet:          UIActionSheetDelegate
    - parameter inView:                 UIView
    - parameter title:                  Title
    - parameter message:                Message
    - parameter buttonOk:               Title button OK
    - parameter buttonCancel:           Title button Cancel
    - parameter buttonDestructive:      Title button Destructive
    
    - handlerSheetDelegate : 
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) { 
    	switch buttonIndex { } 
    }
    */
    UIAlertView.openSheetAlert(delegateSheet: uiactionsheetdelegate, inView: view, title: "Titre", message: "message", buttonOk: "ok", buttonCancel: "No", buttonDestructive: "Destroy")
```
