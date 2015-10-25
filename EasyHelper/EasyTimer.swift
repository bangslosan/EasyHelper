//
//  EasyTimer.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 16/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

public class EasyTimer {
    
    private var startTime:CFAbsoluteTime?
    private var endTime:CFAbsoluteTime?
    public var elapsedTimeSet:Set<CFAbsoluteTime>?
    public init() {
        
    }
    deinit {
        self.startTime = nil
        self.endTime = nil
    }
    public func start() -> CFAbsoluteTime  {
        self.startTime = CFAbsoluteTimeGetCurrent()
        return self.startTime!
    }
    public func reset() {
        self.startTime = nil
        self.endTime = nil
        self.elapsedTimeSet = nil
    }
    public func stop() -> CFAbsoluteTime? {
        defer {
            self.startTime = nil
            self.endTime = nil
        }
        
        guard let hasStartTime = self.startTime else {
            EasyError.Nil("Duration haven't startTime (Start the EasyTimer)").printError()
            return nil
        }
        
        self.endTime = CFAbsoluteTimeGetCurrent()
        return self.endTime! - hasStartTime
    }
    
    public var durationElapsed:CFAbsoluteTime? {
        guard let hasStartTime = self.startTime else {
            EasyError.Nil("Duration haven't startTime (Start the EasyTimer)").printError()
            return nil
        }
        return CFAbsoluteTimeGetCurrent() - hasStartTime
    }
    
    public func addElapsedTime() {
        defer {
            if let hasElapsed = self.durationElapsed  {
                self.elapsedTimeSet!.insert(hasElapsed)
            } else {
                EasyError.Nil("Duration haven't startTime (Start the EasyTimer)").printError()
            }
        }
        guard self.elapsedTimeSet != nil else {
            self.elapsedTimeSet = Set<CFAbsoluteTime>()
            return
        }
    }
    
    public func callByElapsedTime(completionTime:(duration:CFAbsoluteTime)->()) {

        guard let hasElapsetTime = self.elapsedTimeSet else {
            EasyError.Nil("EasyTime elapsed time (Add with addElapsedTime)").printError()
            return
        }
        for time in hasElapsetTime {
            EHAsync.mainQueue(time, block: {
                completionTime(duration: time)
            })
        }
        
        
    }
    
    public static func durationFunc <A> (@autoclosure f: () -> A) -> (result:A, duration: CFAbsoluteTime) {
        let easytimer = EasyTimer()
        easytimer.start()
        let result = f()
        let valueEnd = easytimer.stop()!
        return (result, valueEnd)
    }

}