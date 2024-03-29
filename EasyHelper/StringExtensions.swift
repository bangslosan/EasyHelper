//
//  String_Extensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation

/// ############################################################ ///
///                        Subscript                             ///
/// ############################################################ ///

// MARK: - Subscript
public extension String {
    ////// Character //////
    /**
    Subscript by index / Character
    
    - parameter i: Int
    
    - returns: Character
    */
    public subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    ////// String //////
    /**
    Subscript by index / String
    
    - parameter i: Int
    
    - returns: String
    */
    public subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    /**
    Subscript by Range
    
    - parameter r: Range (0...1 / 0..<1)
    
    - returns: String
    */
    public subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
    }
}
/// ############################################################ ///
///                        Classical                             ///
/// ############################################################ ///

// MARK: - Classical func
public extension String {
    /// Lenght of the String
    var length:Int {
        get {
            return self.characters.count
        }
    }
    /**
    Index Of String, gives the index of the String find
    
    - parameter target: String
    
    - returns: Int, Index
    */
    public func indexOf(target: String) -> Int? {
        
        let range = (self as NSString).rangeOfString(target)
        
        guard range.toRange() != nil else {
            return nil
        }
        
        return range.location
        
    }
    /**
    Last Index Of String, gives the index of the String find
    
    - parameter target: String
    
    - returns: Int, Index
    */
    public func lastIndexOf(target: String) -> Int? {
        
        let range = (self as NSString).rangeOfString(target, options: NSStringCompareOptions.BackwardsSearch)
        
        guard range.toRange() != nil else {
            return nil
        }
        
        return self.length - range.location - 1
        
    }
    /**
    Contains String in String
    
    - parameter s: String
    
    - returns: Bool
    */
    public func contains(s: String) -> Bool {
        return (self.rangeOfString(s) != nil) ? true : false
    }
    /**
    Occurence of String in String
    
    - parameter s: String
    
    - returns: Int, Number has
    */
    public func occurence(s:String) -> Int {
        return self.componentsSeparatedByString(s).count - 1
    }
    
    /**
    Replace String by other
    
    - parameter target:     String
    - parameter withString: String
    
    - returns: String
    */
    public func replace(target: String, withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: withString, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    /**
    Explode String, Split a string by segments
    
    - parameter delimiter: delimiter, default = " "
    
    - returns: [String]
    */
    public func explode(delimiter:String = " ") -> [String] {
        return self.componentsSeparatedByString(delimiter)
    }
    
    func getSizeWithFont (width: CGFloat = .max, height: CGFloat = .max, font: UIFont) -> CGSize {
        return (self as NSString).getSizeWithFont(
            width,
            height: height,
            font: font)
    }

}

/// ############################################################ ///
///                        To Numbers                            ///
/// ############################################################ ///

// MARK: - Extensions String / Numbers
public extension String {
    /**
    String to Int
    
    if String has only Int ( "12" ) return ( "12" )
    
    if has ( "12nor", "not12", "not 12") return nil
    
    */
    public var toInt:Int? {
        get {
            return Int(self)
        }
        
    }
    /**
    String to Double
    
    if String has only Double
    
    ( "12.83", "12" ) return ( "12.83", "12.00" )
    
    if has ( "12.00nor", "not12.34", "not 12.3'") return nil
    
    */
    public var toDouble: Double? {
        get {
            return Double(self)
        }
        
    }
    /**
    String to Double
    
    if String has only Double ( "12.83", "12" ) return ( "12.83", "12.00" )
    
    if has ( "12.00nor", "not12.34", "not 12.3'") return nil
    
    */
    public var toFloat: Float? {
        get {
            return Float(self)
        }
    }
}
/// ############################################################ ///
///                        More function                         ///
/// ############################################################ ///

// MARK: - Extensions String / More function
public extension String {
    /**
    Remove the "remplaceString" by "Target", And give the result + index where the String was deleted
    
    - parameter target:         String
    - parameter remplaceString: String
    
    - returns: (String,Int), Tupple of result + index
    */
    public func currentIndexOfRemoveString(target:String, remplaceString:String) -> (result:String,index:Int)? {
        
        guard let lastIndexOfValue = self.indexOf(target), let range = self.rangeOfString(target) else {
            return nil
        }
        var stringReturn = self
        stringReturn.replaceRange(range, with: remplaceString)
        return (stringReturn,lastIndexOfValue - 1)
        
    }
}
/// ############################################################ ///
///                         NSDate                               ///
/// ############################################################ ///

// MARK: - Extensions String / NSDate
public extension String {
    /**
    Parses a string containing a date into an optional NSDate if the string is a well formed.
    The default format is yyyy-MM-dd, but can be overriden.
    :returns: A NSDate parsed from the string or nil if it cannot be parsed as a date.
    */
    public func toDate(format : String? = "yyyy-MM-dd") -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(self)
    }
}
/// ############################################################ ///
///                         Font                               ///
/// ############################################################ ///



/// ############################################################ ///
///                     Hexadecimal                              ///
/// ############################################################ ///

// MARK: - Extensions String / Hexadecimal
public extension String {

    /**
    Create NSData from hexadecimal string representation
    
    This takes a hexadecimal representation and creates a NSData object. Note, if the string has any spaces, those are removed. Also if the string started with a '<' or ended with a '>', those are removed, too. This does no validation of the string to ensure it's a valid hexadecimal string
    
    The use of `strtoul` inspired by Martin R at http://stackoverflow.com/a/26284562/1271826
    
    - throws: Error / Error of NSRegularExpression
    
    - returns: NSData represented by this hexadecimal string. Returns nil if string contains characters outside the 0-9 and a-f range.
    */
    func dataFromHexadecimalString() throws -> NSData? {
        let trimmedString = self.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "<> ")).stringByReplacingOccurrencesOfString(" ", withString: "")
        
        // make sure the cleaned up string consists solely of hex digits, and that we have even number of them
        

        do {
           let regex = try NSRegularExpression(pattern: "^[0-9a-f]*$", options: NSRegularExpressionOptions.CaseInsensitive)
            
            // revoir option
            let found = regex.firstMatchInString(trimmedString, options: [], range: NSMakeRange(0, trimmedString.length))
            if found == nil || found?.range.location == NSNotFound || trimmedString.length % 2 != 0 {
                return nil
            }
            let data = NSMutableData(capacity: trimmedString.length / 2)
            
            for var index = trimmedString.startIndex; index < trimmedString.endIndex; index = index.successor().successor() {
                let byteString = trimmedString.substringWithRange(Range<String.Index>(start: index, end: index.successor().successor()))
                let num = UInt8(byteString.withCString { strtoul($0, nil, 16) })
                data?.appendBytes([num] as [UInt8], length: 1)
            }
            
            return data
        } catch {
            throw EHError.Error(whereIs: "extension String",funcIs: "dataFromHexadecimalString",errorIs: "NSRegularExpression error : '\(error)'")
        }
    }
    /**
     Create NSData from hexadecimal string representation
     
     This takes a hexadecimal representation and creates a String object from taht. Note, if the string has any spaces, those are removed. Also if the string started with a '<' or ended with a '>', those are removed, too.
     
     - parameter encoding: encoding The NSStringCoding that indicates how the binary data represented by the hex string should be converted to a String.
     
     - returns: String represented by this hexadecimal string. Returns nil if string contains characters outside the 0-9 and a-f range or if a string cannot be created using the provided encoding
     */
    public func stringFromHexadecimalStringUsingEncoding(encoding: NSStringEncoding) -> String? {
        do {
            let data = try dataFromHexadecimalString()
            return NSString(data: data!, encoding: encoding) as? String
        } catch {
            EHError.Error(whereIs: "Extension String", funcIs: "stringFromHexadecimalStringUsingEncoding", errorIs: "Error : '\(error)'").printError()
            return nil
        }
        
    }
    
    /**
     Create hexadecimal string representation of String object. By encoding NSUTF8StringEncoding
     
     - returns: String represented by this hexadecimal string. Returns nil if string contains characters outside the 0-9 and a-f range or if a string cannot be created using the provided encoding
     */
    public func hexadecimalStringUsingEncoding() -> String? {
        let data = dataUsingEncoding(NSUTF8StringEncoding)
        return data?.hexadecimalString()
    }
}
