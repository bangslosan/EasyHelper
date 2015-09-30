//
//  EasyHelperTests.swift
//  EasyHelperTests
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import UIKit
import XCTest
import EasyHelper

class TestStringExtensions: XCTestCase {
    
    func testToIntDoubleFloat() {
        var t = "12 ABC"
        
        XCTAssertNil(t.toDouble)
        XCTAssertNil(t.toFloat)
        XCTAssertNil(t.toInt)
        
        t = "ABC 12"
        
        XCTAssertNil(t.toDouble)
        XCTAssertNil(t.toFloat)
        XCTAssertNil(t.toInt)
        
        t = "12ABC12"
        
        XCTAssertNil(t.toDouble)
        XCTAssertNil(t.toFloat)
        XCTAssertNil(t.toInt)
        
        t = "12.034"
        XCTAssertEqual(t.toDouble,12.034)
        XCTAssertEqual(t.toFloat,12.034)
        XCTAssertNil(t.toInt) // Because is float
        
        t = "12.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999"
        XCTAssertEqual(t.toDouble,12.9999999999999999999999999999999999999999)
        XCTAssertEqual(t.toFloat,12.9999999999999999999999999999999999999999)
        XCTAssertNil(t.toInt) // Because is float
        
        t = "12.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999"
        XCTAssertEqual(t.toDouble,13.0)
        XCTAssertEqual(t.toFloat,13.0)
        XCTAssertNil(t.toInt) // Because is float
        
        t = "12"
        XCTAssertEqual(t.toDouble,12.0)
        XCTAssertEqual(t.toFloat,12.0)
        XCTAssertEqual(t.toInt,12) // Because is float
        
        t = "12.03403000000000000000"
        XCTAssertEqual(t.toDouble,12.0340300000)
        XCTAssertEqual(t.toFloat,12.03403000000000000)
        XCTAssertNil(t.toInt) // Because is float or Double
        
        t = "100"
        XCTAssertEqual(t.toDouble,100)
        XCTAssertEqual(t.toFloat,100)
        XCTAssertEqual(t.toInt,100) // Because is float or Double

    }
    
    func testToDate() {
        let t = "22-11-1988"

        let nsDate = t.toDate("dd-MM-yyyy")
        XCTAssertNotNil(nsDate)
        
    }
    // String
    func testGetSubString() {
        
        let t = "YannickStephan"
        
        
        // Equal = 8
      /*  let val1 = t[6]
        XCTAssertEqual(val1, "k")
        
        let val2 = t[0]
        XCTAssertEqual(val2, "Y")*/
        
        
        let val3 = t[0...3]
        XCTAssertEqual(val3, "Yann")
        
        
        let val4 = t[5...8]
        XCTAssertEqual(val4, "ckSt")
        
        // Equal = Nil
        //XCTAssertNil(t.indexOf("0"))
        
        
    }

    
    
    func testIndexOfFunction() {

        let t = "YannickStephan"
        
        // Equal = 6
        XCTAssertEqual(t.indexOf("kS"), 6)
        
        // Equal = 0
        XCTAssertEqual(t.indexOf("Y"), 0)
        
        // Equal = 10
        XCTAssertEqual(t.indexOf("phan"),10)

        // Equal = Nil
        XCTAssertNil(t.indexOf("0"))

        
    }
    func testLastIndexOfFunction() {
        
        let t = "YannickStephan"
        
        // Equal = 8
        XCTAssertEqual(t.lastIndexOf("kS"), 7)
        
        // Equal = 14
        XCTAssertEqual(t.lastIndexOf("Y"), 13)
        
        // Equal = 0
        XCTAssertEqual(t.lastIndexOf("n"), 0)
        
        // Equal = 4
        XCTAssertEqual(t.lastIndexOf("phan"), 3)
        
        // Equal = Nil
        XCTAssertNil(t.indexOf("0"))
        
        
    }
    
    func testCurrentIndexOfRemoveString() {
        
        let t = "YannickStephan"
        
        // Equal = 8
        let val1 = t.currentIndexOfRemoveString("S",remplaceString: "")
        
        XCTAssertNotNil(val1)
        
        XCTAssertEqual(val1!.result, "Yannicktephan")
        
        XCTAssertEqual(val1!.index, 6)
        
        
        let val2 = t.currentIndexOfRemoveString("Stephan",remplaceString: "")
        
        XCTAssertNotNil(val2)
        
        XCTAssertEqual(val2!.result, "Yannick")
        
        XCTAssertEqual(val2!.index, 6)
        
        
        let val3 = t.currentIndexOfRemoveString("ckSte",remplaceString: "")
        
        XCTAssertNotNil(val3)
        
        XCTAssertEqual(val3!.result, "Yanniphan")
        
        XCTAssertEqual(val3!.index, 4)
        
        // Equal = Nil
        //XCTAssertNil(t.indexOf("0"))
        let t2 = "if <#C> {\n    \n}"
        let val4 =	t2.currentIndexOfRemoveString("<#C>",remplaceString: "")
        XCTAssertEqual(val4!.result, "if  {\n    \n}")
        XCTAssertEqual(val4!.index, 2)
    }
    func testContainsPrefixString() {
        let a:Array = ["abcde","b","c","d","a"]
        
        let item1 = a.containsPrefix(false, target: "a")
        XCTAssertEqual(item1.count, 2)
        
        let item2 = a.containsPrefix(false, target: "c")
        XCTAssertEqual(item2.count, 1)
    }
    func testCountArray() {
        
        let a = ["abcde","b","c","d","a"]
        
        let item1 = a.countByCharactersInArray()[0]
        XCTAssertEqual(item1, 5)
        
        let item2 = a.countByCharactersInArray()[1]
        XCTAssertEqual(item2, 1)
    }
    
    func testApprendAll() {
        
        let a = ["abcde","b","c","d","a"]
        
        let item1 = a.appendAll()
        XCTAssertEqual(item1, "abcdebcda")

    }
}
