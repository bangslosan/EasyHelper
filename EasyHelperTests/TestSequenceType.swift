//
//  TestSequenceType.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 02/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import XCTest
import EasyHelper

class TestSequenceType: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {

        func add(n:String) -> Bool {
            return n == "jj"
        }
        let a = ["jj","jj"]
        //XCTAssert(a.forEachBySorts(add))
        
        XCTAssert(a.forEachByReject(add).count == 0)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testSubscript() {
        let arrayTest = [11,22,33,44,55,66,77,88,99,0]
        
        XCTAssertEqual(arrayTest[1,2,0],[22,33,11])
  
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
