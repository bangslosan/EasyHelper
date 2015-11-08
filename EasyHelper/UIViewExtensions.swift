//
//  UIViewExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import UIKit

// Todo So if you want to change the position of your cell within it’s superview (the tableview in this case), use the frame. But if you want to shrink or move an element within the view, use the bounds!

/// ############################################################ ///
///                       Initilizers                            ///
/// ############################################################ ///
// MARK: - Initilizers
public extension UIView {
        public convenience init (
           
            x: CGFloat,
            y: CGFloat,
            width: CGFloat,
            height: CGFloat) {
                self.init (frame: CGRect (x: x, y: y, width: width, height: height))
        }
        
        convenience init (superView: UIView) {
            self.init (frame: CGRect (origin: CGPointZero, size: superView.size))
        }
}

/// ############################################################ ///
///                       Classical                              ///
/// ############################################################ ///

// MARK: - UIView Extension Classical
public extension UIView {
    /// X position
    public var x:CGFloat {
        get {
           return self.frame.origin.x
        }
        set {
            self.frame = CGRect (x: newValue, y: self.y, width: self.width, height: self.height)
        }
    }
    
    /// Y position
    public var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame = CGRect (x: self.x, y: newValue, width: self.width, height: self.height)
        }
        
    }
    /// With size
    public var width:CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    /// Height size
    public var height:CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    /// Size
    public var size: CGSize {
        get {
            
            return self.frame.size
        }
        set {
            self.frame = CGRect (origin: self.frame.origin, size: newValue)
        }
    }
    /// Position
    public var position: CGPoint {
        get {
            return self.frame.origin
        } set (value) {
            self.frame = CGRect (origin: value, size: self.frame.size)
        }
    }
    /// Position Center
    public var positionCenter: CGPoint {
        return CGPoint(x: width/2, y: height/2)
    }
    /**
     Set Anchor position
     
     - parameter anchorPosition: AnchorPosition
     */
    public func setAnchorPosition (anchorPosition: AnchorPosition) {
        self.layer.anchorPoint = anchorPosition.rawValue
    }
    
}
/// ############################################################ ///
///                         Other                               ///
/// ############################################################ ///
extension UIView {
    /**
    Remove allSubView
    */
    public func removeAllSubViews() {
        for subView :AnyObject in self.subviews { subView.removeFromSuperview() }
    }

    func toImage () -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        drawViewHierarchyInRect(bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
}
/// ############################################################ ///
///                         Animate                              ///
/// ############################################################ ///
// MARK: - UIView Extension Animate
public extension UIView {
    /* --------------------------------------------------------------------------- */
    /*                          Start and Stop Animate                             */
    /* --------------------------------------------------------------------------- */
    public func stopAnimation() {
        CATransaction.begin()
        self.layer.removeAllAnimations()
        CATransaction.commit()
        CATransaction.flush()
    }
    public func isBeingAnimated() -> Bool {
        return self.layer.animationKeys()?.count > 0
    }
    /* --------------------------------------------------------------------------- */
    /*                              Fad In & Out                                   */
    /* --------------------------------------------------------------------------- */
    /**
    Fade In
    
    - parameter duration:      NSTimeInterval ( default = 1.0 )
    - parameter delay:         NSTimeInterval ( default = 0 )
    - parameter alpha:         CGFloat ( default = 1.0 )
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    public func applyFadeIn(
        duration duration: NSTimeInterval = 1.0,
        delay: NSTimeInterval = 0.0,
        toAlpha: CGFloat = 1,
        completionEnd: ((Bool) -> ())? = nil) {

            UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                
                self.alpha = toAlpha
                
                }, completion: completionEnd)
            /*
            let animation = CABasicAnimation(keyPath:"opacity")
            animation.beginTime = CACurrentMediaTime() + delay;
            animation.duration = duration
            animation.fromValue = 0
            animation.toValue = alpha
            animation.fillMode = kCAFillModeBoth
            
            CATransaction.setCompletionBlock(completionEnd)
            
            self.layer.addAnimation(animation, forKey:"animateOpacity")*/
    }
    /**
    Fade Out
    
    - parameter duration:      NSTimeInterval   ( default = 1.0 )
    - parameter delay:         NSTimeInterval   ( default = 0.0 )
    - parameter alpha:         CGFloat          ( default = 0 )
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    public func applyFadeOut(
        
        duration duration: NSTimeInterval = 1.0,
        delay: NSTimeInterval = 0.0,
        toAlpha: CGFloat = 0,
        completionEnd: ((Bool) -> ())? = nil) {
            UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                
                self.alpha = toAlpha
                
                }, completion: completionEnd)
            
           /* let animation = CABasicAnimation(keyPath:"opacity")
            animation.beginTime = CACurrentMediaTime() + delay;
            animation.duration = duration
            animation.fromValue = 1
            animation.toValue = alpha
            animation.fillMode = kCAFillModeBoth
            
            CATransaction.setCompletionBlock(completionEnd)
            
            self.layer.addAnimation(animation, forKey:"animateOpacity")*/
    }
    /* --------------------------------------------------------------------------- */
    /*                                  Shake                                      */
    /* --------------------------------------------------------------------------- */
    /**
    Shake Horizontally
    
    - parameter duration:      duration     ( default = 0.5 )
    - parameter moveValues:    moveValues   ( default = [-12, 12, -8, 8, -4, 4, 0] )
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    public func applyShakeHorizontally(
        duration duration:CFTimeInterval = 0.5,
        moveValues:[Float] = [-12, 12, -8, 8, -4, 4, 0],
        completionEnd: dispatch_block_t? = nil) {
        
        let animation:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.values = moveValues
            
        CATransaction.setCompletionBlock(completionEnd)
            
        self.layer.addAnimation(animation, forKey: "shake")
    }
    public func applyShakeVertically(
        duration duration:CFTimeInterval = 0.5,
        moveValues:[Float] = [(-12), (12), (-8), (8), (-4), (4), (0) ],
        completionEnd: (() -> ())) {
            
        let animation:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
            
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.values = moveValues
        
        CATransaction.setCompletionBlock(completionEnd)
            
        self.layer.addAnimation(animation, forKey: "shake")
    }
    /* --------------------------------------------------------------------------- */
    /*                              Animates                                       */
    /* --------------------------------------------------------------------------- */
    /**
     Set Animation Rotation on View
    
    - parameter angle:         CGFloat ( example 360 = 360 degrees)
    - parameter duration:      NSTimeInterval
    - parameter direction:     UIViewContentMode ( .Left, .Right )
    - parameter repeatCount:   Float
    - parameter autoReverse:   Bool
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    public func applyRotateToAngle(
        angle:CGFloat,
        duration:NSTimeInterval,
        direction:UIViewContentMode,
        repeatCount:Float = 0,
        autoReverse:Bool = false,
        completionEnd: dispatch_block_t? = nil
        ) {
            
            
            
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = (direction == UIViewContentMode.Right ? angle.toDegreesToRadians : -angle.toDegreesToRadians)
            rotationAnimation.duration = duration
            rotationAnimation.autoreverses = autoReverse
            rotationAnimation.repeatCount = repeatCount
            rotationAnimation.removedOnCompletion = false
            rotationAnimation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear)
            
            CATransaction.setCompletionBlock(completionEnd)
            
            self.layer.addAnimation(rotationAnimation,forKey:"transform.rotation.z")
    }
    
    /**
    Set animation Pulse on View
    
    - parameter toScale:       CGFloat
    - parameter duration:      NSTimeInterval
    - parameter repeatAnimate: Bool
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    public func applyPulseToSize(
        duration duration:NSTimeInterval,
        toScale:CGFloat,
        repeatAnimate:Bool,
        completionEnd: dispatch_block_t? = nil
        ) {
            
            let pulseAnimate = CABasicAnimation(keyPath: "transform.scale")
            
            
            pulseAnimate.duration = duration
            pulseAnimate.toValue =  toScale
            pulseAnimate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            pulseAnimate.autoreverses = true
            pulseAnimate.repeatCount = repeatAnimate ? Float.infinity : 0
            
            CATransaction.setCompletionBlock(completionEnd)
            
            self.layer.addAnimation(pulseAnimate, forKey:"pulse")
    }
    

    @available(iOS 7,*)
    /**
    Motion Effects
    
    - parameter minimumRelativeValueX: Min Relative Value X ( default = -10.00 )
    - parameter maximumRelativeValueX: Max Relative Value X ( default = 10.00 )
    - parameter minimumRelativeValueY: Min Relative Value Y ( default = -10.00 )
    - parameter maximumRelativeValueY: Max Relative Value Y ( default = 10.00 )
    */
    public func applyMotionEffects(
        minimumRelativeValueX:Float = -10.00,
        maximumRelativeValueX:Float = 10.00,
        minimumRelativeValueY:Float = -10.00,
        maximumRelativeValueY:Float = 10.00
        ) {
            
            let horizontalEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type:.TiltAlongHorizontalAxis)
            horizontalEffect.minimumRelativeValue = minimumRelativeValueX
            horizontalEffect.maximumRelativeValue = maximumRelativeValueX
            
            let verticalEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
            verticalEffect.minimumRelativeValue = minimumRelativeValueY
            verticalEffect.maximumRelativeValue = maximumRelativeValueY
            
            let motionEffectGroup = UIMotionEffectGroup()
            motionEffectGroup.motionEffects = [horizontalEffect, verticalEffect]
            
            
            
            self.addMotionEffect(motionEffectGroup)
            
    }
}
/// ############################################################ ///
///                         Aspect                               ///
/// ############################################################ ///

// MARK: - The aspect
public extension UIView {
    /**
    Set Border
    
    - parameter borderColor: UIColor    ( default = UIColor.blackColor() )
    - parameter borderWidth: CGFloat    ( default = 1.0 )
    */
    public func applyBorder(borderColor:UIColor = UIColor.blackColor(),borderWidth:CGFloat = 1) {
        self.layer.borderColor = borderColor.CGColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }
    /**
    Set Rounder
    
    - parameter radius: CGFloat
    */
    public func applyRounder(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    /**
    Set Round
    
    */
    public func applyRound() {
        self.layer.cornerRadius = self.width / 2
        self.clipsToBounds = true
    }
}
// MARK: - Shadow
public extension UIView {
    /**
    Plain Shadow
    
    <img src="http://yannickstephan.com/easyhelper/shadow1.png" height="200" width="200"/>
    
    - parameter shadowColor:   UIColor  ( default = UIColor.blackColor() )
    - parameter shadowOpacity: Float    ( default = 0.4 )
    - parameter shadowRadius:  CGFloat  ( default = 0.5 )
    - parameter shadowOffset:  CGSize   ( default = CGSize(width: 0, height: 10) )
    */
    public func applyPlainShadow(
        shadowColor:UIColor =  UIColor.blackColor(),
        shadowOpacity:Float = 0.4,
        shadowRadius:CGFloat = 5,
        shadowOffset:CGSize = CGSize(width: 0, height: 10)) {
            
        self.layer.shadowColor = shadowColor.CGColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
    /**
    Curved Shadow
    
    <img src="http://yannickstephan.com/easyhelper/shadow1.png" height="200" width="200"/>
    
    - parameter shadowOpacity: Float    ( default = 0.3 )
    - parameter shadowOffset:  CGSize   ( default = CGSize(width: 0, height: -3) )
    - parameter shadowColor:   UIColor  ( default = UIColor.blackColor() )
    - parameter depth:         CGFloat  ( default = 11.0 )
    - parameter lessDepth:     CGFloat  ( default = 0.8 )
    - parameter curviness:     CGFloat  ( default = 5 )
    - parameter radius:        CGFloat  ( default = 1 )
    */
    public func applyCurvedShadow(
        shadowOpacity shadowOpacity:Float = 0.3,
        shadowOffset:CGSize = CGSize(width: 0, height: -3),
        shadowColor:UIColor = UIColor.blackColor(),
        depth:CGFloat = 11.00 ,
        lessDepth:CGFloat = 0.8,
        curviness:CGFloat = 5,
        radius:CGFloat = 1 ) {


        let path = UIBezierPath()
        
        // top left
        path.moveToPoint(CGPoint(x: radius, y: self.height))
        
        // top right
        path.addLineToPoint(CGPoint(x: self.width - 2 * radius, y: self.height))
        
        // bottom right + a little extra
        path.addLineToPoint(CGPoint(x: self.width - 2 * radius, y: self.height + depth))
        
        // path to bottom left via curve
        path.addCurveToPoint(
            CGPoint(x: radius, y: self.height + depth),
            controlPoint1: CGPoint(
                x: self.width - curviness,
                y: self.height + (lessDepth * depth) - curviness),
            controlPoint2: CGPoint(
                x: curviness,
                y: self.height + (lessDepth * depth) - curviness))
        
        self.layer.shadowPath = path.CGPath
        self.layer.shadowColor = shadowColor.CGColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = shadowOffset
    }
    /**
    Hover Shadow
    
    <img src="http://yannickstephan.com/easyhelper/shadow1.png" height="200" width="200"/>
    */
    public func applyHoverShadow() {

        let path = UIBezierPath(roundedRect: CGRect(x: 5, y: self.height + 5, width: self.width - 10, height: 15), cornerRadius: 10)
        
        self.layer.shadowPath = path.CGPath
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    /**
    Flat shadow
    
    <img src="http://yannickstephan.com/easyhelper/flatshadow.png" height="100" width="100"/>
    */
    public func applyFlatShadow(){
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
    }
}

