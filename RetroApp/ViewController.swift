//
//  ViewController.swift
//  RetroApp
//
//  Created by ICS 4 on 2017-12-13.
//  Copyright © 2017 EDSS. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
   
    @IBAction func toPongVC(_ sender: UIButton) {
        let nextScene: UIViewController = UIStoryboard(name: "Pong", bundle: nil).instantiateViewController(withIdentifier: "Pong") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
    }
    
    @IBAction func toPacmanVC(_ sender: UIButton) {
        let nextScene: UIViewController = UIStoryboard(name: "Pacman", bundle: nil).instantiateViewController(withIdentifier: "PacmanVC") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
    }
    
    @IBAction func toSnakeVC(_ sender: UIButton) {
        let nextScene: UIViewController = UIStoryboard(name: "Snake", bundle: nil).instantiateViewController(withIdentifier: "SnakeVC") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
    }
    
    @IBAction func toGauntletVC(_ sender: UIButton) {
        let nextScene: UIViewController = UIStoryboard(name: "Gauntlet", bundle: nil).instantiateViewController(withIdentifier: "GauntletVC") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
        
    }
    
    
    
    @IBAction func toSpaceInvadersVC(_ sender: UIButton) {
        let nextScene: UIViewController = UIStoryboard(name: "SpaceInvaders", bundle: nil).instantiateViewController(withIdentifier: "SpaceInvadersVC") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
    }
   
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

