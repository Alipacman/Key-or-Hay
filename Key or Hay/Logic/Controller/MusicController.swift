//
//  MusicController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 19.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation
import AVKit

class MusicController {
    
    init() {
    }
    
    let engine = AVAudioEngine()
    let speedControl = AVAudioUnitVarispeed()
    let pitchControl = AVAudioUnitTimePitch()
    var audioPlayer : AVAudioPlayer?
    
    func play(_ url: String) throws {
        do{
            try audioPlayer = AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: url))
        }
        catch{
            print(error)
        }
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
    
    func playSound(songName : String){
        let url = Bundle.main.path(forResource: songName, ofType: "mp3")
        do{
            try play(url!)
        }
        catch{
            print("error With Music")
        }
    }
    
    func fadeOut(){
        audioPlayer?.setVolume(0, fadeDuration: 0.5)
    }
    
}
