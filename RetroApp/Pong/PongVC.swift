//
//  PongVC.swift
//  RetroApp
//
//  Created by ICS 4 on 2017-12-13.
//  Copyright © 2017 EDSS. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import Foundation
import AVFoundation

class PongVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "TitleScene") {
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
    
    @IBAction func back(_ sender: UIButton) {
        let nextScene: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Menu") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
