//
//  AudioPlayer.swift
//  Restart
//
//  Created by saeem  on 19/02/22.
//

import Foundation
// In order to create a sound player first we need to import audio and video foundation framework
import AVFoundation // This is a full featured framework for working with time based audio video media on ios, MacOs, WatchOS and tvOS We can easily play, create and edit movies sound files and build powerful media funcitonality into any apps using this framework.
var audioPlayer : AVAudioPlayer?

func playSound(sound : String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file.")
        }
    }
}
