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

# Is Coming ! Wait  😎

-------

## Table of Contents

* [Installation](#Installation)
* [UIView](#UIView)
	* [Init](#UIView-Init)
	* [Frame](#UIView-Frame)
	* [Helper](#UIView-Helper)
	* [Shadow](#UIView-Shadow)
	* [Animation](#UIView-Animation)
	* [Rendering](#UIView-Rendering)
	* [Gestures](#UIView-Gestures)
* [UIViewController](#UIViewController)
* [UIScrollView](#UIScrollView)
* [UILabel](#UILabel)
	* [AttributedString](#UILabel-NSAttributedString)
	* [Self sizing](#UILabel-Frame)
	* [Initilizers](#UILabel-Init)
* [NSAttributedString](#NSAttributedString)
* [String](#String)
* [UIFont](#UIFont)
* [UIImageView](#UIImageView)
* [UIColor](#UIColor)
* [UIImage](#UIImage)
* [NSDate](#NSDate)
* [Array](#Array)
* [Dictionary](#Dictionary)
* [Dispatch](#Dispatch)
* [Download Task](#Download)
* [UIScreen](#UIScreen)
* [CGSize](#CGSize)
* [CGPoint](#CGPoint)
* [CGFloat](#CGFloat)
* [UIAlertController](#UIAlertController)
* [UIBarButtonItem](#UIBarButtonItem)
* [BlockButton](#BlockButton)
* [BlockWebView](#BlockWebView)
* [BlockTap](#BlockTap)
* [BlockPan](#BlockPan)
* [BlockSwipe](#BlockSwipe)
* [BlockPinch](#BlockPinch)
* [BlockLongPress](#BlockLongPress)
* [BlockPicker](#BlockPicker)
* [BlockPicker](#BlockPicker)


## Installation <a id="Installation"></a>

#### Manual
Copy & Paste  into your project

#### Cocoapods




## Documentation

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
###### width / height
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
    self.applyPlainShadow()
            
    self.applyPlainShadow(shadowColor: UIColor.yellowColor(), shadowOpacity: 0.8, shadowRadius: 3) 
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
    
    self.applyCurvedShadow()
        
    self.applyCurvedShadow(shadowOpacity: 0.8, shadowColor: UIColor.yellowColor(), radius: 3) 
```

###### Adding Hover Shadow
<img src="http://yannickstephan.com/easyhelper/hovershadows.png" height="200" width="200"/>
``` swift
    /**
    Hover Shadow

    */
    func applyHoverShadow()  
```
###### Adding Flat shadow
<img src="http://yannickstephan.com/easyhelper/flatshadow.png" height="100" width="110"/>
``` swift
    /**
    Flat shadow
    
    <img src="http://yannickstephan.com/easyhelper/flatshadow.png" height="100" width="100"/>
    */
    func applyFlatShadow()
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
#### Animation <a id="UIView-a"></a>

##### Animating view with constant values

Constants

``` swift
	let UIViewAnimationDuration: NSTimeInterval = 1
	let UIViewAnimationSpringDamping: CGFloat = 0.5
	let UIViewAnimationSpringVelocity: CGFloat = 0.5
``` 

Animation Mehtods

``` swift
    func animate (animations: (()->Void)!,
        completion: ((Bool)->Void)? = nil) 
        
    func spring (animations: (()->Void)!,
        completion: ((Bool)->Void)? = nil)
```

#### Rendering <a id="UIView-Rendering"></a>

Get UIImage form view

``` swift
	func toImage () -> UIImage
```

#### Gestures <a id="UIView-Gestures"></a>

#### Adding gestures single line

Tap 

``` swift
    func addTapGesture (tapNumber: NSInteger,
        target: AnyObject, action: Selector)
```

``` swift
	func addTapGesture (tapNumber: Int,
	        action: ((UITapGestureRecognizer)->())?)
```

Swipe

``` swift
    func addSwipeGesture (
    	direction: UISwipeGestureRecognizerDirection,  
        numberOfTouches: Int,  
        target: AnyObject,  
        action: Selector)  
```

``` swift
	func addSwipeGesture (direction: UISwipeGestureRecognizerDirection,
	        numberOfTouches: Int,
	        action: ((UISwipeGestureRecognizer)->())?)
```

Pan

``` swift
    func addPanGesture (target: AnyObject,
        action: Selector)
```

``` swift
	func addPanGesture (action: ((UIPanGestureRecognizer)->())?)
```

Pinch


``` swift
	func addPinchGesture (target: AnyObject,
	        action: Selector)
```

``` swift
	func addPinchGesture (action: ((UIPinchGestureRecognizer)->())?)
```

Long Press

``` swift
	func addLongPressGesture (target: AnyObject,
	        action: Selector)
```

``` swift
	func addLongPressGesture (action: ((UILongPressGestureRecognizer)->())?)
```


### UIViewController extension <a id="UIViewController"></a>

##### Get top layout and bottom layout

Top

``` swift
    var top: CGFloat {
        get {
            if let nav = self.navigationController {
                if nav.navigationBarHidden {
                    return view.top
                } else {
                    return nav.navigationBar.bottom
                }
            } else {
                return view.top
            }
        }
    }
```

Bottom

``` swift
    var bottom: CGFloat {
        get {
            if let tab = tabBarController {
                if tab.tabBar.hidden {
                    return view.bottom
                } else {
                    return tab.tabBar.top
                }
            } else {
                return view.bottom
            }
        }
    }
```
##### Calculate app area exluding NavigationBar and TabBar


``` swift
    var applicationFrame: CGRect {
        get {
            return CGRect (x: view.x, y: top, width: view.w, height: bottom - top)
        }
    }
```

##### Quick access tab bar properties
  
``` swift
    var tabBarHeight: CGFloat {
        get {
            if let tab = self.tabBarController {
                return tab.tabBar.frame.size.height
            }
            
            return 0
        }
    }
```
  
##### Quick access navigation bar properties

``` swift
	 var navBar: UINavigationBar? {
        get {
            return navigationController?.navigationBar
        }
    }
```

Get Navigation bar height of device

``` swift
    var navigationBarHeight: CGFloat {
        get {
            if let nav = self.navigationController {
                return nav.navigationBar.h
            }
            
            return 0
        }
    }
```

Get or set navigation bar color

``` swift
    var navigationBarColor: UIColor? {
        get {
            return navigationController?.navigationBar.tintColor
        } set (value) {
            navigationController?.navigationBar.barTintColor = value
        }
    }
```

Push view controller

``` swift
    func push (vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
```

Pop view controller
   
``` swift 
    func pop () {
        navigationController?.popViewControllerAnimated(true)
    }
```
  
Present view controller

``` swift
	func present (vc: UIViewController)
```

Dismiss view controller 

``` swift
	func dismiss (completion: (()->Void)?) 
```
  
### UIScrollView extension <a id="UIScrollView"></a>

##### Get/Set ContentSize Properties

``` swift
    var contentHeight: CGFloat {
        get {
            return contentSize.height
        } set (value) {
            contentSize = CGSize (width: contentSize.width, height: value)
        }
    }
```

``` swift
    var contentWidth: CGFloat {
        get {
            return contentSize.height
        } set (value) {
            contentSize = CGSize (width: value, height: contentSize.height)
        }
    }

```

##### Get/Set ContentOffset Properties

``` swift
    var offsetX: CGFloat {
        get {
            return contentOffset.x
        } set (value) {
            contentOffset = CGPoint (x: value, y: contentOffset.y)
        }
    }
```

``` swift
    var offsetY: CGFloat {
        get {
            return contentOffset.y
        } set (value) {
            contentOffset = CGPoint (x: contentOffset.x, y: value)
        }
    }
```


### UILabel extension <a id="UILabel"></a>

#### NSAttributedString <a id="UILabel-NSAttributedString"></a>

##### `AttributedStrings` property for accessing, adding or updating attributedText of label


``` swift
	private var UILabelAttributedStringArray: UInt8 = 0
    var attributedStrings: [NSAttributedString]? {
        get {
            return objc_getAssociatedObject(self, &UILabelAttributedStringArray) as? [NSAttributedString]
        } set (value) {
            objc_setAssociatedObject(self, &UILabelAttributedStringArray, value, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }

```

Adding

``` swift
    func addAttributedString (text: String,
        color: UIColor,
        font: UIFont)
```

``` swift
    func addAttributedString (attributedString: NSAttributedString)
```

Updating

``` swift
    func updateAttributedStringAtIndex (index: Int,
        attributedString: NSAttributedString)
    func updateAttributedStringAtIndex (index: Int,
        newText: String)
```

#### Self sizing <a id="UILabel-Frame"></a>

##### Get estimated frame values for current state

``` swift
	 func getEstimatedRect (width: CGFloat = CGFloat.max, height: CGFloat = CGFloat.max) -> CGRect
	 func getEstimatedHeight () -> CGFloat
	 func getEstimatedWidth () -> CGFloat
```
  
##### Fix frame for current state

``` swift
	func fitHeight ()
	func fitWidth ()
	func fitSize ()
```
  
#### Initilizers <a id="UILabel-Init"></a>

##### Init with Text, TextColor, TextAlignment & Font

``` swift
	    convenience init (
        frame: CGRect,
        text: String,
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        font: UIFont)
```

``` swift
	convenience init (
	        x: CGFloat,
	        y: CGFloat,
	        width: CGFloat,
	        height: CGFloat,
	        text: String,
	        textColor: UIColor,
	        textAlignment: NSTextAlignment,
	        font: UIFont)
```

Auto calculates height

``` swift
	convenience init (
	        x: CGFloat,
	        y: CGFloat,
	        width: CGFloat,
	        text: String,
	        textColor: UIColor,
	        textAlignment: NSTextAlignment,
	        font: UIFont)
```

Auto calculates height with giving padding

``` swift
	convenience init (
	        x: CGFloat,
	        y: CGFloat,
	        width: CGFloat,
	        padding: CGFloat,
	        text: String,
	        textColor: UIColor,
	        textAlignment: NSTextAlignment,
	        font: UIFont)
```

Auto calculates frame

``` swift
	convenience init (
	        x: CGFloat,
	        y: CGFloat,
	        text: String,
	        textColor: UIColor,
	        textAlignment: NSTextAlignment,
	        font: UIFont)
```

##### Init with AttributedText

``` swift
    convenience init (
        frame: CGRect,
        attributedText: NSAttributedString,
        textAlignment: NSTextAlignment)
```

``` swift
	convenience init (
	        x: CGFloat,
	        y: CGFloat,
	        width: CGFloat,
	        height: CGFloat,
	        attributedText: NSAttributedString,
	        textAlignment: NSTextAlignment) 
```

Auto calculates height

``` swift
	convenience init (
	        x: CGFloat,
	        y: CGFloat,
	        width: CGFloat,
	        attributedText: NSAttributedString,
	        textAlignment: NSTextAlignment)
```

Auto calculates frame

``` swift
	convenience init (
	        x: CGFloat,
	        y: CGFloat,
	        attributedText: NSAttributedString,
	        textAlignment: NSTextAlignment)
```


### NSAttributedString <a id="NSAttributedString"></a>

#### `NSAttributedStringStyle` enum

Easy styling 

``` swift
    enum NSAttributedStringStyle {
        case plain
        case underline (NSUnderlineStyle, UIColor)
        case strike (UIColor, CGFloat)
     }
```

``` swift
	func addAtt (attribute: [NSString: NSObject]) -> NSAttributedString
```

``` swift
	func addStyle (style: NSAttributedStringStyle) -> NSAttributedString
```

#### Easy Init 

``` swift
    convenience init (text: String,
        color: UIColor,
        font: UIFont,
        style: NSAttributedStringStyle = .plain)
```

``` swift
	convenience init (image: UIImage)
```
  
#### Create multiple NSAttributeString with closures

``` swift
	class func withAttributedStrings (mutableString: (NSMutableAttributedString)->()) -> NSAttributedString
```

Example:

``` swift
   let att = NSAttributedString.withAttributedStrings({ att in
       att.appendAttributedString (NSAttributedString(
           text: "asd",
           color: UIColor.blackColor(),
           font: UIFont.systemFontOfSize(22)))
       att.appendAttributedString (NSAttributedString(
           text: "\nasd",
           color: UIColor.blueColor(),
           font: UIFont.systemFontOfSize(15)))
       att.appendAttributedString (NSAttributedString(
           text: "\nasdjnfje",
           color: UIColor.redColor(),
           font: UIFont.systemFontOfSize(25)))
       att.appendAttributedString (NSAttributedString(
           text: "\nasd",
           color: UIColor.blackColor(),
           font: UIFont.Font(.AvenirNext,
               type: UIFont.FontType.DemiBold,
               size: 15),
           style: .underline(.StyleSingle, UIColor.blueColor())))
   })
```
  
### String extension <a id="String"></a>

##### Subscript for accessing characters at index of string

``` swift 
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
```
  
### UIFont extension <a id="UIFont"></a>

##### FontType and FontName `enum`s for easily create `UIFont`s

``` swift
	enum FontType: String
	enum FontName: String
	class func Font (name: FontName, type: FontType, size: CGFloat) -> UIFont
```

Even customise it for specific font 

``` swift
    class func HelveticaNeue (type: FontType, size: CGFloat) -> UIFont
```

Print all family of font on single line

``` swift
    class func PrintFontFamily (font: FontName)
```

### UIImageView <a id="UIImageView"></a>  

#### Init with image

``` swift
    convenience init (frame: CGRect,
        imageName: String)
``` 
  
``` swift
    convenience init (frame: CGRect,
        image: UIImage)
```

#### Init with aspected image

``` swift
    convenience init (
			x: CGFloat,
			y: CGFloat,
			width: CGFloat,
			image: UIImage)
```
  
``` swift
	convenience init (
			x: CGFloat,
	      	y: CGFloat,
	      	height: CGFloat,
	      	image: UIImage)
```

#### Download image background

``` swift
	func imageWithUrl (url: String)
```

With placeholder image

``` swift
	func imageWithUrl (url: String, placeholder: UIImage)
```

With placeholder image named

``` swift
	func imageWithUrl (url: String, placeholder: String)
```

### UIColor extension <a id="UIColor"></a>

##### Create random color or RGB/A colors easily in range of [0, 255]

``` swift
    class func randomColor () -> UIColor
```

``` swift
    class func RGBColor (r: CGFloat,
        g: CGFloat,
        b: CGFloat) -> UIColor
```

``` swift
    class func RGBAColor (r: CGFloat,
        g: CGFloat,
        b: CGFloat,
        a: CGFloat) -> UIColor
```

``` swift
	class func Gray (gray: CGFloat) -> UIColor
```

``` swift
	class func Gray (gray: CGFloat, alpha: CGFloat) -> UIColor
```

``` swift
	class func HexColor (hex: String) -> UIColor
```


### UIImage extension <a id="UIImage"></a>

##### Resize an image with keep it aspect ratio

Calculate possible aspect width for height

``` swift
    func aspectWidthForHeight (height: CGFloat) -> CGFloat
```

Calculate possible aspect height for width


``` swift
	func aspectHeightForWidth (width: CGFloat) -> CGFloat
```

Resize image based on its width (auto calculates height and keeps aspect ratio)


``` swift
    func aspectResizeWithWidth (width: CGFloat) -> UIImage
```

Resize image based on its height (auto calculates width and keeps aspect ratio)

``` swift
    func aspectResizeWithHeight (height: CGFloat) -> UIImage
```

### NSDate <a id="NSDate"></a>

##### Easy convert to string with format

``` swift
    func toString (format: String) -> String {
        let formatter = NSDateFormatter ()
        formatter.dateFormat = format
        
        return formatter.stringFromDate(self)
    }
``` 

### Array <a id="Array"></a>

##### Remove Object

``` swift
	mutating func removeObject<U: Equatable> (object: U)
```

### Dictionary <a id="Dictionary"></a>

##### Add operator

``` swift
	func += <KeyType, ValueType> (inout left: Dictionary<KeyType, ValueType>,
	    right: Dictionary<KeyType, ValueType>)
```

### Dispatch <a id="Dispatch"></a>

##### dispatch_after function

``` swift
	func delay (
	    seconds: Double,
	    queue: dispatch_queue_t = dispatch_get_main_queue(),
	    after: ()->()) {
	        
	        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
	        dispatch_after(time, queue, after)
	}
```

### Download Tasks <a id="Download"></a>

Request url string

``` swift
	func urlRequest (
	    url: String,
	    success: (NSData?)->Void,
	    error: ((NSError)->Void)? = nil)
```

Request image

``` swift
	func imageRequest (
	    url: String,
	    success: (UIImage?)->Void)
```

Request json

``` swift
	func jsonRequest (
	    url: String,
	    success: (AnyObject?->Void),
	    error: ((NSError)->Void)?) 
```
  
NSData to json serialized AnyObject?  
(could be [AnyObject], [String: AnyObject], nil)

``` swift
	func dataToJsonDict (data: NSData?) -> AnyObject? 
```

### UIScreen <a id="UIScreen"></a>

##### Access device related mesurements

Orientation

``` swift
	var Orientation: UIInterfaceOrientation {
	    get {
	        return UIApplication.sharedApplication().statusBarOrientation
	    }
	}
```
  
Screen Width

``` swift
	var ScreenWidth: CGFloat {
	    get {
	        if UIInterfaceOrientationIsPortrait(Orientation) {
	            return UIScreen.mainScreen().bounds.size.width
	        } else {
	            return UIScreen.mainScreen().bounds.size.height
	        }
	    }
	}
```

Screen Height

``` swift
	var ScreenHeight: CGFloat {
	    get {
	        if UIInterfaceOrientationIsPortrait(Orientation) {
	            return UIScreen.mainScreen().bounds.size.height
	        } else {
	            return UIScreen.mainScreen().bounds.size.width
	        }
	    }
	}
```
  
Status bar height

``` swift
	var StatusBarHeight: CGFloat {
	    get {
	        return UIApplication.sharedApplication().statusBarFrame.height
	    }
	}
```
  
### CGPoint <a id="CGPoint"></a>

##### Custom operators for `CGPoint`s

``` swift
	func + (left: CGPoint, right: CGPoint) -> CGPoint
	func - (left: CGPoint, right: CGPoint) -> CGPoint
```


##### `StringLiteralConvertable` implementation

``` swift
	public init(stringLiteral value: StringLiteralType)
	public init(extendedGraphemeClusterLiteral value: StringLiteralType)
	public init(unicodeScalarLiteral value: StringLiteralType) {
	        self = CGPointFromString(value)
```

### CGSize <a id="CGSize"></a>

##### Custom operators for `CGSize`s

``` swift
	func + (left: CGSize, right: CGSize) -> CGSize
	func - (left: CGSize, right: CGSize) -> CGSize
```
  
### CGFloat <a id="CGFloat"></a>

##### Convert degrees to radians


``` swift
	func degreesToRadians (angle: CGFloat) -> CGFloat
```

##### Normalize value to [0, 1] or vice verca

Convert [min, max] to [0, 1]

``` swift
	func normalizeValue (
		value: CGFloat,
	    min: CGFloat,
	    max: CGFloat) -> CGFloat
```

Convert [0, 1] to to [min, max]

``` swift
	func convertNormalizedValue (
		value: CGFloat,
	    min: CGFloat,
	    max: CGFloat) -> CGFloat
```

##### Clamp a value between minimum and maximum values

``` swift
	func clamp (
	    value: CGFloat,
	    minimum: CGFloat,
	    maximum: CGFloat) -> CGFloat
```



### UIAlertViewController <a id="UIAlertViewController"></a>

##### Single line, block based ios 8 alert

``` swift
	func alert (title: String,
	    message: String,
	    cancelAction: ((UIAlertAction!)->Void)? = nil,
	    okAction: ((UIAlertAction!)->Void)? = nil) -> UIAlertController
```


