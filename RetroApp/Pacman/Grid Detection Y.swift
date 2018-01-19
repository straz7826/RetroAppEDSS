//
//  Grid Detection Y.swift
//  Pacman
//
//  Created and coded by Matthew Murray on 2017-12-07.
//determines which part of the y axis in the grid pacman is in
//  Copyright © 2017 Robit-Team  +1. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

// Matt k, same as grid detection but in y-axis

func GridDetectionY(Y: CGFloat) -> CGFloat {
    
    let gridY: CGFloat = 27.4285714284
    var YUpperLimit:CGFloat = 0
    var YLowerLimit:CGFloat = 0
    var YCounter:CGFloat = 0
    var YValue:CGFloat = 0
    
    while YCounter <= 30 {
        YLowerLimit = CGFloat(512 - (gridY * YCounter))
        YUpperLimit = CGFloat(512 - (gridY * (YCounter + 1)))
        //positive
        if Y < YLowerLimit && Y > YUpperLimit {
            YValue = YCounter
        }
        //transitional
        if Y < YLowerLimit && Y < YUpperLimit {
            YValue = YCounter
        }
        //negative
        if Y > YLowerLimit && Y < YUpperLimit {
            YValue = YCounter
        }
        
        YCounter += 1
    }
    return YValue
}

