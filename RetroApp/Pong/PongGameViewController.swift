//
//  GameViewController.swift
//  TitleScreen2
//
//  Created by Ashley Bowman on 2017-12-15.
//  Copyright © 2017 Bowman A. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class PongGameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view2 = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "PongGameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view2.presentScene(scene)
            }
            
            view2.ignoresSiblingOrder = true
            
            view2.showsFPS = true
            view2.showsNodeCount = true
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
}
