//
//  Sound.swift
//  Prototope
//
//  Created by Andy Matuschak on 11/19/14.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import AVFoundation
import Foundation

/** Provides a simple way to play sound files. Supports .aif, .aiff, .wav, and .caf files. */
public struct EasySound: CustomStringConvertible {
    
    private let player: AVAudioPlayer
    private let name: String!
    
    /** Creates a sound from a filename. No need to include the file extension: Prototope will
    try all the valid extensions. */
    public init?(name: String, type:String) {
        
        guard let patch = NSBundle.getPath(name: name, type: type) else {
            EasyError.PathForResource("Can't find the patch").printError()
            return nil
        }
       
        guard let data = NSData(contentsOfFile: patch) else {
            EasyError.NSData("Can't find data by the patch").printError()
            return nil
        }

        do {
            self.player = try AVAudioPlayer(data: data)
            self.player.prepareToPlay()
            self.name = name
        } catch {
            EasyError.Error("\(error)").printError()
            return nil
        }
        
        

    }
    
    public init?(url:NSURL) {
        
        guard let data = NSData(contentsOfURL: url) else {
            EasyError.NSData("Can't find data by the patch").printError()
            return nil
        }
        
        do {
            self.player = try AVAudioPlayer(data: data)
            self.player.prepareToPlay()
            self.name = ""
        } catch {
            EasyError.Error("\(error)").printError()
            return nil
        }
    }
    
    public var description: String {
        return self.name
    }
    
    /// From 0.0 to 1.0
    public var volume: Double {
        get {
            return Double(player.volume)
        }
        set {
            player.volume = Float(newValue)
        }
    }
    
    public func play() {
        player.currentTime = 0
        if player.delegate == nil {
            let delegate = AVAudioPlayerDelegate()
            player.delegate = delegate
            playingAVAudioPlayerDelegates.insert(delegate)
        }
        playingAVAudioPlayers.insert(player)
        player.play()
    }
    
    public func stop() {
        player.stop()
        if let delegate = (player.delegate as? EasySound.AVAudioPlayerDelegate) {
            playingAVAudioPlayerDelegates.remove(delegate)
            player.delegate = nil
        }
        playingAVAudioPlayers.remove(player)
    }
    
    public static let supportedExtensions = ["caf", "aif", "aiff", "wav"]
    
    // Fancy scheme to keep playing AVAudioPlayers from deallocating while they're playing.
    @objc private class AVAudioPlayerDelegate: NSObject, AVFoundation.AVAudioPlayerDelegate {
        @objc func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
            player.delegate = nil
            playingAVAudioPlayers.remove(player)
            playingAVAudioPlayerDelegates.remove(self)
        }
        
        @objc func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer, error: NSError?) {
            player.delegate = nil
            playingAVAudioPlayers.remove(player)
            playingAVAudioPlayerDelegates.remove(self)
        }
    }
}

private var playingAVAudioPlayers = Set<AVAudioPlayer>()
private var playingAVAudioPlayerDelegates = Set<EasySound.AVAudioPlayerDelegate>()