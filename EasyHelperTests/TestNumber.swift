//
//  TestNumber.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 30/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import XCTest

class TestNumber: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumbers() {
        let a:Int = 1234567890
        
        XCTAssertEqual(a.toString, "1234567890")
        
        let b:Float = 1234.12
        
        XCTAssertEqual(b.toString, "1234.12")
        
        let c:Double = 1234567890.1234
        
        XCTAssertEqual(c.toString, "1234567890.1234")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
