//
//  ToWheel.swift
//  RetroApp
//
//  Created by ICS 4 on 2017-12-15.
//  Copyright © 2017 EDSS. All rights reserved.
//

import Foundation
import UIKit

class ToWheel: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        let nextScene: UIViewController = UIStoryboard(name: "Wheel", bundle: nil).instantiateViewController(withIdentifier: "WheelVC") as UIViewController
        self.present(nextScene, animated: false, completion: nil)
    }
    
    
}
