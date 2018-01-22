//
//  GameViewController.swift - AC
//  Schedules a timer that shows the in game time every second.
//  Copyright © 2017 NFB. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import Foundation

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var endGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Game timer
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.counter), userInfo: nil, repeats: true)
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GauntletGameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //Counter - AC
    //Counts down seconds for the timer. Stops the timer when seconds == 0.
    @objc func counter() {
        seconds -= 1
        
        if seconds <= 0 {
            moveCharacter = false
            gameTimer.invalidate()
            endGameButton.isHidden = false
        }
        
        timerLabel.text = ("Time: \(seconds)")
    }
    
}

