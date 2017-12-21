//
//  ToWheel.swift
//  RetroApp
//
//  Created by ICS 4 on 2017-12-15.
//  Copyright © 2017 EDSS. All rights reserved.
//

import Foundation
import UIKit

class ToLeaderboard: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        let nextScene: UIViewController = UIStoryboard(name: "LeaderBoard", bundle: nil).instantiateViewController(withIdentifier: "LeaderboardVC") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
    }
    
    
}
