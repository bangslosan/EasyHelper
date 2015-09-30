//
//  UIViewExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import UIKit
// MARK: - UIView Extension Classical
public extension UIView {
    /// X position
    public var x:CGFloat {
        get {
           return self.frame.origin.x
        }
        set {
            var frame:CGRect = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    /// Y position
    public var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame:CGRect = self.frame
            frame.origin.y = newValue
            self.frame = frame
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
    /**
    Remove allSubView
    */
    public func removeAllSubViews() {
        for subView :AnyObject in self.subviews { subView.removeFromSuperview() }
    }
    
}

// MARK: - UIView Extension Animate
public extension UIView {
    /**
    Set Rotation 360 on View
    
    :param: duration   Duration
    :param: completion When If Completed
    */
    public func rotate360Degrees(duration: CFTimeInterval = 1.0, completion: (() -> ())) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.delegate = self
        CATransaction.setCompletionBlock { () -> Void in
            completion()
        }
        
        self.layer.addAnimation(rotateAnimation, forKey: nil)
    }
    /**
    Fade In
    
    :returns: Completion when finished
    */
    public func fadeIn(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, alpha: CGFloat = 1.0, completion: ((Bool) -> Void)) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)
    }
    /**
    Fade Out
    
    :returns: Completion when finished
    */
    public func fadeOut(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, alpha: CGFloat = 1.0, completion: (Bool) -> Void) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = alpha
            }, completion: completion)
    }
    /**
    Scrool to page
    
    - parameter scrollView: UIScrollView
    - parameter page:       Int
    - parameter animated:   Bool
    */
    func scrollToPage(scrollView: UIScrollView, page: Int, animated: Bool) {
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(page);
        frame.origin.y = 0;
        scrollView.scrollRectToVisible(frame, animated: animated)
        
    }
}

// MARK: - UIView Extension Other
public extension UIView {

}