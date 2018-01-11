//
//  scoreViewController.swift
//  Test Gauntlet
//
//  Created by Corinne H on 2017-12-13.
//  Copyright © 2017 NFB. All rights reserved.
//

import UIKit
import AVFoundation

class scoreViewController: UIViewController {
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // Sound Effects
    var deathMusic: AVAudioPlayer?
    var completeLevelMusic: AVAudioPlayer?
    var music: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        playMusic()
        showScore()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        resetGame()
//        stopMusic()
    }
    
    func showScore() {
        if didWin {
            resultsLabel.text = "You Won!!"
        } else {
            scoreValue -= 50
        }
        
        scoreLabel.text = "Score: \(scoreValue)"
        timeLabel.text = "Time: \(winTime) s"
    }
    
    func resetGame() {
        scoreValue = 0
        health = 5
        seconds = 100
        winTime = 100
        didWin = false
        hasKey = false
    }
    
//    func playMusic() {
//        let deathPath = Bundle.main.path(forResource: "DeathMusic.mp3", ofType:nil)!
//        let deathUrl = URL(fileURLWithPath: deathPath)
//        do {
//            deathMusic = try AVAudioPlayer(contentsOf: deathUrl)
//        } catch {
//            print("did not work")
//        }
//        let winPath = Bundle.main.path(forResource: "CompletedLevelMusic.mp3", ofType:nil)!
//        let winUrl = URL(fileURLWithPath: winPath)
//        do {
//            completeLevelMusic = try AVAudioPlayer(contentsOf: winUrl)
//        } catch {
//            print("did not work")
//        }
//
//        if didWin {
//            music = completeLevelMusic
//        } else {
//            music = deathMusic
//            music?.volume = 2.0
//            music?.numberOfLoops = 5
//        }
//        music?.play()
//    }
//
//    func stopMusic() {
//        music?.stop()
//    }
}

