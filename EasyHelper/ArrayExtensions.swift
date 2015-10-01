//
//  Array_Extensions.swift
//  TastyImitationKeyboard
//
//  Created by DaRk-_-D0G on 17/07/2015.
//  Copyright (c) 2015 Apple. All rights reserved.
//

import Foundation
public extension SequenceType where Generator.Element == String {
    /**
    Count characters each cell of the array
    
    - returns: [Int] Array of count characters by cell in the array
    */
    public func countByCharactersInArray() -> [Int] {
        return self.map{$0.characters.count}
    }
    /**
    Apprend all string after by after
    
    - returns: String
    */
    public func appendAll() -> String  {
        return String( self.map{$0.characters}.reduce(String.CharacterView(), combine: {$0 + $1}))
    }
    /**
    Array of String, find in array if has prefix String
    
    :param: ignoreCase True find lowercaseString
    :param: target        String find
    
    :returns: Array of String find
    */
    public func containsPrefix(ignoreCase:Bool,var target: String) -> [String] {
        
        let values = self.filter({
                var val = $0
            
                if ignoreCase {
                    val = val.lowercaseString
                    target = target.lowercaseString
                }
                
            return val.hasPrefix(target) ?  true :  false
            
        })
        
        return values
    }
    /**
    Array of String, find in array if has suffix String
    
    :param: ignoreCase True find lowercaseString
    :param: target        String find
    
    :returns: Array of String find
    */
    public func containsSuffix(ignoreCase:Bool,var target: String) -> [String] {
        
        let values = self.filter({
            var val = $0
            
            if ignoreCase {
                val = val.lowercaseString
                target = target.lowercaseString
            }
            
            return val.hasSuffix(target) ?  true :  false
            
        })
        
        return values
    }
}

public extension Array {
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