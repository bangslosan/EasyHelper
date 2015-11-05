//
//  WCSessionDelegateExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 15/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//


import WatchConnectivity

public extension WCSessionDelegate {
    
    @available(iOS 9.0, *)
    @available(iOSApplicationExtension 9.0, *)
    public var sessions:WCSession? {
        get {
            return  WCSession.isSupported() ? WCSession.defaultSession() : nil
        }
    }
    
    @available(iOS 9.0, *)
    @available(iOSApplicationExtension 9.0, *)
    public func  configureSessions(delegate:WCSessionDelegate) {
        
        self.sessions?.delegate = delegate
        self.sessions?.activateSession()
    }
    
}