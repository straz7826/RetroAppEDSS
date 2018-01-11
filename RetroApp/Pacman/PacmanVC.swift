//
//  PacmanVC.swift
//  RetroApp
//
//  Created by ICS 4 on 2017-12-13.
//  Copyright © 2017 EDSS. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class PacmanVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        if let scene = SKScene(fileNamed: "PacmanGameScene") {
            scene.scaleMode = .resizeFill
            skView.presentScene(scene)
        // Do any additional setup after loading the view, typically from a nib.
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
    
    
}
