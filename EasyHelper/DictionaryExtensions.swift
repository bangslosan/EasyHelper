//
//  DictionaryExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//
import Foundation


// MARK: - Classical
public extension Dictionary {
    /**
    Contains an objet in array
    
    :param: obj T Obj research
    
    :returns: Bool
    */
    func contains<T where T : Equatable>(obj: T) -> Bool {
        
        return self.filter({$0 as? T == obj}).count > 0
    }
    
}
// MARK: - File
extension Dictionary {
    /**
    Loads a JSON file from the app bundle into a new dictionary
    
    - parameter filename: File name
    
    - throws: EHError : PathForResource / NSData / JSON
    
    - returns: Dictionary<String, AnyObject>
    */
    static func loadJSONFromBundle(filename: String) throws ->  Dictionary<String, AnyObject> {
        
        guard let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json")  else {
            throw EHError.Nil(whereIs: "extension Dictionnay",funcIs: "loadJSONFromBundle",errorIs: "[->pathForResource] The file could not be located\nFile : '\(filename).json'")
        }

        guard let data = try? NSData(contentsOfFile: path, options:.DataReadingUncached)   else {
           throw EHError.NSData(whereIs: "extension Dictionary",funcIs: "loadJSONFromBundle",errorIs:"[->NSData] The absolute path of the file not find\nFile : '\(filename)'")
        }

        guard let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? Dictionary<String, AnyObject> else {
            throw EHError.JSON(whereIs: "extension Dictionnay",funcIs: "loadJSONFromBundle",errorIs: "[->NSJSONSerialization]Error.InvalidJSON Level file '\(filename)' is not valid JSON")
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
    
    - returns: Dictionary<String, AnyObject>
    */
    static func loadPlistFromBundle(filename: String) throws -> Dictionary<String, AnyObject> {
        
        guard let path = NSBundle.mainBundle().pathForResource(filename, ofType: "plist")  else {
            throw EHError.Nil(whereIs: "extension Dictionary",funcIs: "loadPlistFromBundle",errorIs: "(pathForResource) The file could not be located\nFile : '\(filename).plist'")
        }
        guard let plistDict = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject> else {
           throw EHError.Nil(whereIs: "extension Dictionary",funcIs: "loadPlistFromBundle",errorIs: "(There is a file error or if the contents of the file are an invalid representation of a dictionary. File : '\(filename)'.plist")
        }
        
        return plistDict
    }
}
