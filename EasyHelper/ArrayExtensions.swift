//
//  Array_Extensions.swift
//  TastyImitationKeyboard
//
//  Created by DaRk-_-D0G on 17/07/2015.
//  Copyright (c) 2015 Apple. All rights reserved.
//

import Foundation
// MARK: - Classical
public extension Array {
 /**
    Creates an array with the elements at indexes in the given list of integers.
    
    :param: first First index
    :param: second Second index
    :param: rest Rest of indexes
    :returns: Array with the items at the specified indexes
    */
    public subscript (first: Int, second: Int, rest: Int...) -> Array {
        return ([first, second] + rest).map { self[$0] }
    }
    /**
    Gets the object at the specified index, if it exists.
    
    :param: index
    :returns: Object at index in self
    */
    func get (index: Int) -> Element? {
        
        return index >= 0 && index < count ? self[index] : nil
        
    }
    /**
    Contains an objet in array
    
    :param: obj T Obj research
    
    :returns: Bool
    */
    func contains<T where T : Equatable>(obj: T) -> Bool {        
        return self.filter({$0 as? T == obj}).count > 0
    }
    /**
    Contains an objet in array
    
    :param: obj T Obj research
    
    :returns: Array T Obj research
    */
    func containsValues<T where T : Equatable>(obj: T) -> Array? {
        let values =  self.filter({$0 as? T == obj})
        return (values.count > 0) ? values : nil
    }
    /**
    Checks if test returns true for all the elements in self
    
    :param: test Function to call for each element
    :returns: True if test returns true for all the elements in self
    */
    func forEachBySorts (test: (Element) -> Bool) -> Bool {
        for item in self {
            if test(item) {
                return false
            }
        }
        return true
    }
    /**
    Opposite of filter.
    
    :param: exclude Function invoked to test elements for the exclusion from the array
    :returns: Filtered array
    */
    func forEachByReject (exclude: (Element -> Bool)) -> Array {
        
        return filter {
            return !exclude($0)
        }
    }
    /**
    Converts the array to a dictionary with the keys supplied via the keySelector.
    
    :param: keySelector
    :returns: A dictionary
    */
    func toDictionary <U> (keySelector:(Element) -> U) -> [U: Element] {
        var result: [U: Element] = [:]
        for item in self {
            result[keySelector(item)] = item
        }
        return result
    }
    
    /**
    Converts the array to a dictionary with keys and values supplied via the transform function.
    
    :param: transform
    :returns: A dictionary
    */
    func toDictionary <K, V> (transform: (Element) -> (key: K, value: V)?) -> [K: V] {
        var result: [K: V] = [:]
        for item in self {
            if let entry = transform(item) {
                result[entry.key] = entry.value
            }
        }
        
        return result
    }
}


// MARK: - File
public extension Array {
    /**
    Loads a JSON file from the app bundle into a new dictionary
    
    - parameter filename: File name
    
    - throws: EHError : PathForResource / NSData / JSON
    
    - returns: [String : AnyObject]
    */
    static func loadJSONFromBundle(filename: String, nameJson:String) throws ->  [String : AnyObject] {
        
        guard let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json")  else {
            throw EHError.Nil("[EasyHelper][loadJSONFromBundle][->pathForResource] The file could not be located\nFile : '\(filename).json'")
        }
        
        guard let data = try? NSData(contentsOfFile: path, options:.DataReadingUncached)   else {
            throw EHError.NSData("[EasyHelper][loadJSONFromBundle][->NSData] The absolute path of the file not find\nFile : '\(filename)'")
        }
        
        guard let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String : AnyObject] else {
            throw EHError.JSON("[EasyHelper][loadJSONFromBundle][->NSJSONSerialization] Invalid JSON\n nameJson '\(nameJson)'\nFile '\(filename)'")
        }
        
        return jsonDict
        
    }
    
    /**
    Load a Plist file from the app bundle into a new dictionary
    
    :param: File name
    :return: Dictionary<String, AnyObject>?
    */
    /**
    Load a Plist file from the app bundle into a new dictionary
    
    - parameter filename: File name
    
    - throws: EHError : Nil
    
    - returns: [String : AnyObject]
    */
    static func loadPlistFromBundle(filename: String) throws -> [String : AnyObject] {
        
        guard let path = NSBundle.mainBundle().pathForResource(filename, ofType: "plist")  else {
            throw EHError.Nil("[EasyHelper][loadPlistFromBundle] (pathForResource) The file could not be located\nFile : '\(filename).plist'")
        }
        guard let plistDict = NSDictionary(contentsOfFile: path) as? [String : AnyObject] else {
            throw EHError.Nil("[EasyHelper][loadPlistFromBundle] (NSDictionary) There is a file error or if the contents of the file are an invalid representation of a dictionary. File : '\(filename)'.plist")
        }
        
        return plistDict
    }
}