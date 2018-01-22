//
//  scoreViewController.swift - MC
//  End of game view that displays the final score, resets the unversial variables and plays music.
//  Copyright © 2017 NFB. All rights reserved.
//

import UIKit
import AVFoundation

class scoreViewController: UIViewController {
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // Sound Effects - MC and CH
    var deathMusic: AVAudioPlayer?
    var completeLevelMusic: AVAudioPlayer?
    var music: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        playMusic()
        showScore()
    }
    
    //Reset button - MC
    //Resets the game and stops the music when button is pressed
    @IBAction func buttonPressed(_ sender: Any) {
        resetGame()
//        stopMusic()
    }
    
    //Show Score - MC
    //Determines if the player won or lost and shows their ending score
    func showScore() {
        if didWin {
            resultsLabel.text = "You Won!!"
        } else {
            scoreValue -= 50
        }
        scoreLabel.text = "Score: \(scoreValue)"
        timeLabel.text = "Time: \(winTime) s"
    }
    
    //Reset Game - MC
    //Resets game variables to start a new game
    func resetGame() {
        scoreValue = 0
        health = 5
        seconds = 100
        winTime = 100
        ghostHealth = [Int](repeating: 2, count: 5)
        didWin = false
        hasKey = false
        moveCharacter = true
    }
    
    //Play Music - MC
    //Determines which music to play (victory or death) and plays it
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
//        }
//        music?.volume = 2.0
//        music?.numberOfLoops = 5
//        music?.play()
//    }
    
    //Stop Music - MC
    //Stops the music from playing when moving to another view
//    func stopMusic() {
//        music?.stop()
//    }
}
