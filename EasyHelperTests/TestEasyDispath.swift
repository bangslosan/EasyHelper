//
//  TestEasyDispath.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 17/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import XCTest
import EasyHelper

class TestEasyDispath: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBackgroundToMain() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        EasyAsync.GlobalMainQueue {
            //printLog("[Test] Async : B")
        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            // do your task
             //printLog("[Test] Async : Ahhi")
            dispatch_async(dispatch_get_main_queue()) {
               //printLog("[Test] Async : Ahhi")
            }
        }
        
        EasyAsync.GlobalBackgroundQueue {
            //printLog("[Test] Async : A")
            EasyAsync.GlobalMainQueue {
                //printLog("[Test] Async : B")
            }
        }
    }
    
    func testPerformanceBackgroundToMain() {
        // This is an example of a performance test case.
        self.measureBlock {
            EasyAsync.GlobalBackgroundQueue {
                //printLog("[Test] Async : A")
                var i = 0
                for _ in 0...10000 {
                    i++
                }
                EasyAsync.GlobalMainQueue {
                    //printLog("[Test] Async : B")
                    //printLog("[Test] Async : \(i)")
                }
            }
            // Put the code you want to measure the time of here.
        }
    }
    
}
