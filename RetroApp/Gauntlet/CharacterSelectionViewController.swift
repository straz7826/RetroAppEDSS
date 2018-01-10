//
//  CharacterSelectionViewController.swift
//  Test Gauntlet
//
//  Created by Melissa Chinnick on 2018-01-08.
//  Copyright © 2018 NFB. All rights reserved.
//

import UIKit

class CharacterSelectionViewController: UIViewController {
     
    @IBAction func selectWarrior(_ sender: Any) {
        selectedPlayer = "warrior"
    }
    
    @IBAction func selectWizard(_ sender: Any) {
        selectedPlayer = "wizard"
    }
    
    @IBAction func selectElf(_ sender: Any) {
        selectedPlayer = "elf"
    }
    
    @IBAction func selectValkyrie(_ sender: Any) {
        selectedPlayer = "valkyrie"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
