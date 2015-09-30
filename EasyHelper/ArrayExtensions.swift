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