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
        convenience init (
            x: CGFloat,
            y: CGFloat,
            w: CGFloat,
            h: CGFloat) {
                self.init (frame: CGRect (x: x, y: y, width: w, height: h))
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
    public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame = CGRect (origin: self.frame.origin, size: newValue)
        }
    }
    var applyCenter: CGPoint {
        return CGPoint(x: width/2, y: height/2)
    }
    /**
    Remove allSubView
    */
    public func removeAllSubViews() {
        for subView :AnyObject in self.subviews { subView.removeFromSuperview() }
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
    
    - parameter duration:      NSTimeInterval
    - parameter delay:         NSTimeInterval
    - parameter alpha:         CGFloat
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    public func applyFadeIn(
        
        duration: NSTimeInterval = 1.0,
        delay: NSTimeInterval = 0.0,
        alpha: CGFloat = 1,
        completionEnd: ((Bool) -> ())? = nil) {
            
            UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                
                self.alpha = alpha
                
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
    
    - parameter duration:      NSTimeInterval
    - parameter delay:         NSTimeInterval
    - parameter alpha:         CGFloat
    - parameter completionEnd: (() -> ())? When animation is finished
    */
    public func applyFadeOut(
        
        duration: NSTimeInterval = 1.0,
        delay: NSTimeInterval = 0.0,
        alpha: CGFloat = 0,
        completionEnd: ((Bool) -> ())? = nil) {
            UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                
                self.alpha = alpha
                
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
    public func applyShakeHorizontally(
        duration:CFTimeInterval = 0.5,
        moveValues:[Float] = [(-12), (12), (-8), (8), (-4), (4), (0) ],
        completionEnd: (() -> ())) {
            
        let animation:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.values = moveValues
            
        CATransaction.setCompletionBlock(completionEnd)
            
        self.layer.addAnimation(animation, forKey: "shake")
    }
    public func applyShakeVertically(
        duration:CFTimeInterval = 0.5,
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
    Set Rotation 360 on View
    
    :param: duration   Duration
    :param: completion When If Completed
    */
    public func applyRotateToAngle(
        angle:CGFloat,
        duration:NSTimeInterval,
        direction:UIViewContentMode,
        repeatCount:Float = 0,
        autoReverse:Bool = false,
        completionEnd: (() -> ())
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
    
    
    public func applyPulseToSize(
        scale:CGFloat,
        duration:NSTimeInterval,
        repeatAnimate:Bool,
        completionEnd: (() -> ())) {
            
            let pulseAnimate = CABasicAnimation(keyPath: "transform.scale")
            
            
            pulseAnimate.duration = duration
            pulseAnimate.toValue =  scale
            pulseAnimate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            pulseAnimate.autoreverses = true
            pulseAnimate.repeatCount = repeatAnimate ? Float.infinity : 0
            
            CATransaction.setCompletionBlock(completionEnd)
            
            self.layer.addAnimation(pulseAnimate, forKey:"pulse")
    }
    
    @available(iOS 7,*)
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
// MARK: - The aspect
extension UIView {
    func applyBorder(borderColor:UIColor = UIColor.blackColor(),borderWidth:CGFloat = 1) {
        self.layer.borderColor = borderColor.CGColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }
    func applyRounder(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    func applyRound() {
        self.layer.cornerRadius = self.width / 2
        self.clipsToBounds = true
    }
}
// MARK: - Shadow
extension UIView {
    /**
    Plain Shadow
    
    <img src="http://yannickstephan.com/easyhelper/shadow1.png" height="200" width="200"/>
    
    - parameter shadowColor:   UIColor
    - parameter shadowOpacity: Float
    - parameter shadowRadius:  CGFloat
    - parameter shadowOffset:  CGSize
    */
    func applyPlainShadow(
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
    
    - parameter shadowOpacity: Float
    - parameter shadowOffset:  CGSize
    - parameter shadowColor:   UIColor
    - parameter depth:         CGFloat
    - parameter lessDepth:     CGFloat
    - parameter curviness:     CGFloat
    - parameter radius:        CGFloatb
    */
    func applyCurvedShadow(
        shadowOpacity:Float = 0.3,
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
    func applyHoverShadow() {

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
    func applyFlatShadow(){
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
    }
    
}

// MARK: - Render Extensions

extension UIView {
    
    func toImage () -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        drawViewHierarchyInRect(bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
}