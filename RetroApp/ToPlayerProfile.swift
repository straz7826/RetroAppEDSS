//
//  ToWheel.swift
//  RetroApp
//
//  Created by ICS 4 on 2017-12-15.
//  Copyright © 2017 EDSS. All rights reserved.
//

import Foundation
import UIKit

class ToPlayerProfile: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        let nextScene: UIViewController = UIStoryboard(name: "PlayerProfile", bundle: nil).instantiateViewController(withIdentifier: "PlayerProfileVC") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
    }
    
    
}
