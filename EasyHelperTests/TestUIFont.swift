//
//  Test.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 26/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import XCTest
import EasyHelper

class TestUIFont: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        UIFont.printAllUIFont()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
