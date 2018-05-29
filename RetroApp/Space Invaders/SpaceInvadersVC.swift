//
//  SpaceInvadersVC.swift
//  RetroApp
//
//  Created by ICS 4 on 2017-12-13.
//  Copyright © 2017 EDSS. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class SpaceInvadersVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        // Create and configure the scene.
    let scene = SpaceGameScene(size: skView.frame.size)
        skView.presentScene(scene)
        
        // Pause the view (and thus the game) when the app is interrupted or backgrounded
        NotificationCenter.default.addObserver(self, selector: #selector(SpaceInvadersVC.handleApplicationWillResignActive(_:)), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(SpaceInvadersVC.handleApplicationDidBecomeActive(_:)), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    @objc func handleApplicationWillResignActive (_ note: Notification) {
        let skView = self.view as! SKView
        skView.isPaused = true
    }
    
    @objc func handleApplicationDidBecomeActive (_ note: Notification) {
        let skView = self.view as! SKView
        skView.isPaused = false
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        let skView = self.view as! SKView
        skView.isPaused = true
        
        let nextScene: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Menu") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
    }
    
    

    
    
}
