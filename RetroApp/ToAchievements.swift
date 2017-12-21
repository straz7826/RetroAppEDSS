//
//  ToWheel.swift
//  RetroApp
//
//  Created by ICS 4 on 2017-12-15.
//  Copyright © 2017 EDSS. All rights reserved.
//

import Foundation
import UIKit

class ToAchievements: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        let nextScene: UIViewController = UIStoryboard(name: "Achievements", bundle: nil).instantiateViewController(withIdentifier: "AchievementsVC") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
    }
    
    
}
