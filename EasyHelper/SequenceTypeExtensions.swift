//
//  SequenceTypeExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 02/10/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//

import Foundation
public extension AnySequence {
    /**
    Returns each element of the sequence in an array
    
    :returns: Each element of the sequence in an array
    */
    public func toArray () -> [Element] {
        var result: [Element] = []
        for item in self {
            result.append(item)
        }
        return result
    }

}
public extension SequenceType {
    
}
// MARK: - String
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