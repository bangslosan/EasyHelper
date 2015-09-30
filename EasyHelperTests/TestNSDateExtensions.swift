//
//  TestNSDateExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 26/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import XCTest

import EasyHelper

class TestNSDateExtensions: XCTestCase {

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllNSDate() {

        /// Test Create Date
        let a = NSDate.date(year: 1988, month: 11, day: 22)
        
        XCTAssertEqual(a.day, 22)
        XCTAssertEqual(a.month, 11)
        XCTAssertEqual(a.year, 1988)
        XCTAssertEqual(a.hour, NSDate.today().hour)
        XCTAssertEqual(a.minute, NSDate.today().minute)
        
        /// Test tomorrow
        let b = NSDate.today()
        let c = NSDate.tomorrow()
        
        XCTAssertEqual(b.day+1, c.day)
        
        /// Test yesterday
        let d = NSDate.yesterday()
        
        XCTAssertEqual(b.day-1, d.day)
        
        // OPERATIONS WITH DATES (-,-=,+,+=) & (==,!=,<,>,<=,>=)
        let e = a-22.day
        XCTAssertEqual(e.day, 31)
        XCTAssertEqual(e.month, 10)
        
        
        XCTAssertTrue(e == NSDate.date(year: 1988, month: 10, day: 31))
       
    }
    

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
}
