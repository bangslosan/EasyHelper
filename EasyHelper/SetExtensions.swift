//
//  SetExtensions.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 24/07/2015.
//  Copyright (c) 2015 DaRk-_-D0G. All rights reserved.
//



extension Set {

    /**
    Remove Element pass in param
    
    :param: newElements Element deletes to Set
    */
    mutating func removeElements(elements: Element...) {
        
        for el in elements {
            self.remove(el)
        }
    }
    /**
    Add Elements
    
    :param: newElements Element deletes to Set
    */
    mutating func insertElements(newElements: Element...) {
        for el in newElements {
            self.insert(el)
        }
    }
    /**
    Add Set of Elements
    
    :param: Set of Elements
    */
    mutating func addSet(setElements: Set<Element>) {
        for el in setElements {
            self.insert(el)
        }
    }
    /**
    If Set contains Set of Elements
    
    :param: Set of Elements
    */
    mutating func containsElements(setElements: Set<Element>) -> Bool {
        for el in setElements {
            if self.contains(el) {
                return true
            }
        }
        return false
    }
    
    
    
    
    
    
    
}