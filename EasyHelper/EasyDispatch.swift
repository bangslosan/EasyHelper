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
    public static var mainQueue: dispatch_queue_t {
        get {
            return dispatch_get_main_queue()
        }
    }
    /// GlobalUserInteractiveQueue Dispatch
    public static var userInteractive: dispatch_queue_t {
        get {
            if #available(iOS 8.0, *) {
                return dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)
            } else {
                return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
            }
        }
    }
    /// GlobalUserInitiatedQueue Dispatch
    public static var userInitiated: dispatch_queue_t {
        get {
            if #available(iOS 8.0, *) {
                return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
            } else {
                return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
            }
        }
    }
    /// GlobalUtilityQueue Dispatch
    public static var utility: dispatch_queue_t {
        get {
            if #available(iOS 8.0, *) {
                return dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
            } else {
                return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
            }
        }
    }
    /// GlobalBackgroundQueue Dispatch
    public static var background: dispatch_queue_t {
        get {
            if #available(iOS 8.0, *) {
                return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
            } else {
                return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
            }
        }
    }
}
/**
*  Struc for Async Call
*/
public typealias EasyHelperAsync = EHAsync

    public struct EHAsync {
    private let block: dispatch_block_t
    
    private init(_ block: dispatch_block_t) {
        self.block = block
    }
}
public extension EHAsync {
        


    private static func async(block: dispatch_block_t, inQueue queue: dispatch_queue_t) -> EHAsync {
        // Create a new block (Qos Class) from block to allow adding a notification to it later (see matching regular Async methods)
        // Create block with the "inherit" type
        let _block = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block)
        // Add block to queue
        dispatch_async(queue, _block)
        // Wrap block in a struct since dispatch_block_t can't be extended
        return EHAsync(_block)
    }
    private static func after(seconds: Double, block: dispatch_block_t, inQueue queue: dispatch_queue_t) -> EHAsync {
        let nanoSeconds = Int64(seconds * Double(NSEC_PER_SEC))
        let time = dispatch_time(DISPATCH_TIME_NOW, nanoSeconds)
        return at(time, block: block, inQueue: queue)
    }
    private static func at(time: dispatch_time_t, block: dispatch_block_t, inQueue queue: dispatch_queue_t) -> EHAsync {
        // See Async.async() for comments
        let _block = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block)
        dispatch_after(time, queue, _block)
        return EHAsync(_block)
    }
    public func cancel() {
        dispatch_block_cancel(block)
    }
    public func wait(seconds: Double = 0.0) {
        if seconds != 0.0 {
            let nanoSeconds = Int64(seconds * Double(NSEC_PER_SEC))
            let time = dispatch_time(DISPATCH_TIME_NOW, nanoSeconds)
            dispatch_block_wait(block, time)
        } else {
            dispatch_block_wait(block, DISPATCH_TIME_FOREVER)
        }
    }
    /**
    Async Background
    
    - parameter delay:   After start
    - parameter closure: Closure in async
    
    Description : Représente des tâches que utilisateur n'est pas directement au courant.
    
    Utilisez quand aucune interaction utilisateur et ne sont pas sensibles au facteur temps.
    */
    public static func background(after:Double,block:dispatch_block_t) -> EHAsync {
        return EHAsync.after(after, block: block, inQueue: EHDispath.background)
    }
    
    
    /**
    Async backgound
    
    - parameter closure: Closure in async
    
    Description : Représente des tâches que utilisateur n'est pas directement au courant.
    
    Utilisez quand aucune interaction utilisateur et ne sont pas sensibles au facteur temps.
    */
    public static func background(block: dispatch_block_t) ->  EHAsync {
        return EHAsync.async(block, inQueue: EHDispath.background)
    }
    /**
    Async UserInteractiveQueue
    
    - parameter delay:   After start
    - parameter closure: Closure in async
    
    Description : Représente tâches qui doivent être fait immédiatement afin de fournir une expérience utilisateur agréable.
    
    Utilisez pour les mises à jour de l'interface utilisateur, la gestion des événements et des petites charges de travail qui nécessitent une faible latence.
    
    Le montant total des travaux effectués dans cette classe lors de l'exécution doit être petite.
    */
    public static func userInteractive(after:Double,block:dispatch_block_t) -> EHAsync {
        return EHAsync.after(after, block: block, inQueue: EHDispath.userInteractive)
    }
    /**
    Async UserInteractiveQueue
    
    - parameter closure: Closure in async
    
    Description : Représente tâches qui doivent être fait immédiatement afin de fournir une expérience utilisateur agréable.
    
    Utilisez pour les mises à jour de l'interface utilisateur, la gestion des événements et des petites charges de travail qui nécessitent une faible latence.
    
    Le montant total des travaux effectués dans cette classe lors de l'exécution doit être petite.
    */
    public static func userInteractive(block: dispatch_block_t) ->  EHAsync {
        return EHAsync.async(block, inQueue: EHDispath.userInteractive)
    }
    
    /**
    Async MainQueue
    
    - parameter delay:   After start
    - parameter closure: Closure in async
    
    Description : Queue principal
    */
    public static func mainQueue(after:Double,block:dispatch_block_t) -> EHAsync {
        return EHAsync.after(after, block: block, inQueue: EHDispath.mainQueue)
    }
    /**
    Async GlobalMainQueue
    
    - parameter closure: Closure in async
    
    Description : Queue principal
    */
    public static func mainQueue(block: dispatch_block_t) ->  EHAsync {
        return EHAsync.async(block, inQueue: EHDispath.mainQueue)
    }
    /**
    Async UserInitiatedQueue
    
    - parameter delay:   After start
    - parameter closure: Closure in async
    
    Description : La classe initiée par l'utilisateur représente tâches qui sont lancées à partir de linterface utilisateur et peuvent être effectuées de manière asynchrone.
    
    Utilisé lorsque l'utilisateur est en attente de résultats immédiats,
    Pour des tâches requises pour poursuivre l'interaction de l'utilisateur.
    */
    public static func userInitiated(after:Double,block:dispatch_block_t) -> EHAsync {
        return EHAsync.after(after, block: block, inQueue: EHDispath.userInitiated)
    }
    /**
    Async GlobalUserInitiatedQueue
    
    - parameter closure: Closure in async
    
    Description : La classe initiée par l'utilisateur représente tâches qui sont lancées à partir de linterface utilisateur et peuvent être effectuées de manière asynchrone.
    
    Utilisé lorsque l'utilisateur est en attente de résultats immédiats,
    Pour des tâches requises pour poursuivre l'interaction de l'utilisateur.
    */
    public static func userInitiated(block: dispatch_block_t) ->  EHAsync {
        return EHAsync.async(block, inQueue: EHDispath.userInitiated)
    }
    
    /**
    Async GlobalUtilityQueue
    
    - parameter delay:   After start
    - parameter closure: Closure in async
    
    Description : La classe d'utilitaires représente tâches longues, généralement avec un indicateur de progression visible par l'utilisateur.
    
    Utilisez pour les calculs, I/O, les réseaux, les flux de données continues et des tâches similaires.
    Cette classe est conçu pour être économe en énergie
    */
    public static func utility(after:Double,block:dispatch_block_t) -> EHAsync {
        return EHAsync.after(after, block: block, inQueue: EHDispath.utility)
    }
    /**
    Async GlobalUtilityQueue
    
    - parameter closure: Closure in async
    
    Description : La classe d'utilitaires représente tâches longues, généralement avec un indicateur de progression visible par l'utilisateur.
    
    Utilisez pour les calculs, I/O, les réseaux, les flux de données continues et des tâches similaires.
    Cette classe est conçu pour être économe en énergie
    */
        public static func utility(block: dispatch_block_t) ->  EHAsync {
            return EHAsync.async(block, inQueue: EHDispath.utility)
        }
    
    
    
    
}

public extension qos_class_t {
    
    // Convenience description of qos_class_t
    // Calculated property
    var description: String {
        get {
            switch self {
            case qos_class_main(): return "Main"
            case QOS_CLASS_USER_INTERACTIVE: return "User Interactive"
            case QOS_CLASS_USER_INITIATED: return "User Initiated"
            case QOS_CLASS_DEFAULT: return "Default"
            case QOS_CLASS_UTILITY: return "Utility"
            case QOS_CLASS_BACKGROUND: return "Background"
            case QOS_CLASS_UNSPECIFIED: return "Unspecified"
            default: return "Unknown"
            }
        }
    }
}

// Binary operator for qos_class_t allows for comparison in switch-statements
func ~=(lhs: qos_class_t, rhs: qos_class_t) -> Bool {
    return lhs.rawValue ~= rhs.rawValue
}

