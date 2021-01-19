//
//  AudioManager.swift
//  Stupid Test
//
//  Created by Chris Park on 1/16/21.
//

import AVFoundation
import Foundation

class AudioManager {
    static var shared = AudioManager()
    
    private var bgmPlayer = AVAudioPlayer()
    
    func musicSetup() {
        guard let bgmPath = Bundle.main.path(forResource: "bgm", ofType: "mp3") else { return }
        
        do {
            bgmPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bgmPath))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func playBGM() {
        bgmPlayer.play()
        if UserDefaults.standard.string(forKey: "sound") == "off" {
           muteBGM()
        }
    }
    
    func unmuteBGM() {
        bgmPlayer.volume = 1
    }
    
    func muteBGM() {
        bgmPlayer.volume = 0
    }
}
