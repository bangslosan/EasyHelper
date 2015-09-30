//
//  DictionaryExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//
import Foundation


extension Dictionary {
    
    // Loads a JSON file from the app bundle into a new dictionary
    static func loadJSONFromBundle(filename: String) throws ->  Dictionary<String, AnyObject>? {
        
        guard let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json")  else {
            throw EasyError.PathForResource("[EasyHelper][loadJSONFromBundle] (pathForResource) File : '\(filename).json'")
        }
        
        guard let data = try? NSData(contentsOfFile: path, options: NSDataReadingOptions()) else {
            throw EasyError.NSData("[EasyHelper][loadJSONFromBundle] (NSData) Could not load file : '\(filename)'")
        }

        guard let jsonDict = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String : AnyObject] else {
            throw EasyError.JSON("[EasyHelper][loadJSONFromBundle] (NSJSONSerialization) Level file '\(filename)' is not valid JSON")
        }
        
        return jsonDict

    }
}
