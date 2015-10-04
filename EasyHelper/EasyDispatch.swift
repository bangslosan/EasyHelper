//
//  EasyDispatch.swift
//  EasyHelper
//
//  Created by DaRk-_-D0G on 22/09/2015.
//  Copyright © 2015 DaRk-_-D0G. All rights reserved.
//
import Foundation
/**
*  Struct Dispath
*/
public typealias EasyDispath = EHDispath
public struct EHDispath {
    /// GlobalMainQueue Dispatch
    public static var GlobalMainQueue: dispatch_queue_t {
        get {
            return dispatch_get_main_queue()
        }
    }
    /// GlobalUserInteractiveQueue Dispatch
    public static var GlobalUserInteractiveQueue: dispatch_queue_t {
        get {
            if #available(iOS 8.0, *) {
                return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
            } else {
                return dispatch_get_global_queue(Int(DISPATCH_QUEUE_PRIORITY_HIGH.value), 0)
            }
        }
    }
    /// GlobalUserInitiatedQueue Dispatch
    public static var GlobalUserInitiatedQueue: dispatch_queue_t {
        get {
            if #available(iOS 8.0, *) {
                return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
            } else {
                return dispatch_get_global_queue(Int(DISPATCH_QUEUE_PRIORITY_HIGH.value), 0)
            }
        }
    }
    /// GlobalUtilityQueue Dispatch
    public static var GlobalUtilityQueue: dispatch_queue_t {
        get {
            if #available(iOS 8.0, *) {
                return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
            } else {
                return dispatch_get_global_queue(Int(DISPATCH_QUEUE_PRIORITY_LOW.value), 0)
            }
        }
    }
    /// GlobalBackgroundQueue Dispatch
    public static var GlobalBackgroundQueue: dispatch_queue_t {
        get {
            if #available(iOS 8.0, *) {
                return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
            } else {
                return dispatch_get_global_queue(Int(DISPATCH_QUEUE_PRIORITY_DEFAULT.value), 0)
            }
        }
    }
}
/**
*  Struc for Async Call
*/
public typealias EasyAsync = EHAsync
public struct EHAsync {
    
    /**
    Async Background
    
    - parameter delay:   After start
    - parameter closure: Closure in async
    
    Description : Représente des tâches que utilisateur n'est pas directement au courant.
    
    Utilisez quand aucune interaction utilisateur et ne sont pas sensibles au facteur temps.
    */
    public static func GlobalBackgroundQueue(delay:Double,closure: () -> Void) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, EHDispath.GlobalBackgroundQueue, closure)
    }
    /**
    Async backgound
    
    - parameter closure: Closure in async
    
    Description : Représente des tâches que utilisateur n'est pas directement au courant.
    
    Utilisez quand aucune interaction utilisateur et ne sont pas sensibles au facteur temps.
    */
    public static func GlobalBackgroundQueue(closure: () -> Void) {
        dispatch_async(EHDispath.GlobalBackgroundQueue,closure)
    }
    /**
    Async UserInteractiveQueue
    
    - parameter delay:   After start
    - parameter closure: Closure in async
    
    Description : Représente tâches qui doivent être fait immédiatement afin de fournir une expérience utilisateur agréable.
    
    Utilisez pour les mises à jour de l'interface utilisateur, la gestion des événements et des petites charges de travail qui nécessitent une faible latence.
    
    Le montant total des travaux effectués dans cette classe lors de l'exécution doit être petite.
    */
    public static func GlobalUserInteractiveQueue(delay:Double,closure: () -> Void) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, EHDispath.GlobalUserInteractiveQueue, closure)
    }
    /**
    Async UserInteractiveQueue
    
    - parameter closure: Closure in async
    
    Description : Représente tâches qui doivent être fait immédiatement afin de fournir une expérience utilisateur agréable.
    
    Utilisez pour les mises à jour de l'interface utilisateur, la gestion des événements et des petites charges de travail qui nécessitent une faible latence.
    
    Le montant total des travaux effectués dans cette classe lors de l'exécution doit être petite.
    */
    public static func GlobalUserInteractiveQueue(closure: () -> Void) {
        dispatch_async(EHDispath.GlobalUserInteractiveQueue,closure)
    }
    
    /**
    Async MainQueue
    
    - parameter delay:   After start
    - parameter closure: Closure in async
    
    Description : Queue principal
    */
    public static func GlobalMainQueue(delay:Double,closure: () -> Void) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, EHDispath.GlobalMainQueue, closure)
    }
    /**
    Async GlobalMainQueue
    
    - parameter closure: Closure in async
    
    Description : Queue principal
    */
    public static func GlobalMainQueue(closure: () -> Void) {
        dispatch_async(EHDispath.GlobalMainQueue,closure)
    }
    /**
    Async UserInitiatedQueue
    
    - parameter delay:   After start
    - parameter closure: Closure in async
    
    Description : La classe initiée par l'utilisateur représente tâches qui sont lancées à partir de linterface utilisateur et peuvent être effectuées de manière asynchrone.
    
    Utilisé lorsque l'utilisateur est en attente de résultats immédiats,
    Pour des tâches requises pour poursuivre l'interaction de l'utilisateur.
    */
    public static func GlobalUserInitiatedQueue(delay:Double,closure: () -> Void) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, EHDispath.GlobalUserInitiatedQueue, closure)
    }
    /**
    Async GlobalUserInitiatedQueue
    
    - parameter closure: Closure in async
    
    Description : La classe initiée par l'utilisateur représente tâches qui sont lancées à partir de linterface utilisateur et peuvent être effectuées de manière asynchrone.
    
    Utilisé lorsque l'utilisateur est en attente de résultats immédiats,
    Pour des tâches requises pour poursuivre l'interaction de l'utilisateur.
    */
    public static func GlobalUserInitiatedQueue(closure: () -> Void) {
        dispatch_async(EHDispath.GlobalUserInitiatedQueue,closure)
    }
    
    /**
    Async GlobalUtilityQueue
    
    - parameter delay:   After start
    - parameter closure: Closure in async
    
    Description : La classe d'utilitaires représente tâches longues, généralement avec un indicateur de progression visible par l'utilisateur.
    
    Utilisez pour les calculs, I/O, les réseaux, les flux de données continues et des tâches similaires.
    Cette classe est conçu pour être économe en énergie
    */
    public static func GlobalUtilityQueue(delay:Double,closure: () -> Void) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, EHDispath.GlobalUtilityQueue, closure)
    }
    /**
    Async GlobalUtilityQueue
    
    - parameter closure: Closure in async
    
    Description : La classe d'utilitaires représente tâches longues, généralement avec un indicateur de progression visible par l'utilisateur.
    
    Utilisez pour les calculs, I/O, les réseaux, les flux de données continues et des tâches similaires.
    Cette classe est conçu pour être économe en énergie
    */
    public static func GlobalUtilityQueue(closure: () -> Void) {
        dispatch_async(EHDispath.GlobalUtilityQueue,closure)
    }
    
}