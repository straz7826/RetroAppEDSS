//
//  grid detection.swift
//  Pacman
//
//  Created by MattK on 2017-12-05.
//  Copyright © 2017 Robit-Team  +1. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

func GridDetection(coordinates: CGPoint) -> CGPoint {
    
    var tile: CGPoint = CGPoint(x:0,y:0)
    let gridX = 27.4285714286
    let gridY = 27.4285714284
    var XUpperLimit:CGFloat = 0
    var XLowerLimit:CGFloat = 0
    var YUpperLimit:CGFloat = 0
    var YLowerLimit:CGFloat = 0
    var XCounter:Double = 0
    var YCounter:Double = 0
    var XValue:Double = 0
    var YValue:Double = 0
    
    while XCounter <= 27 {
        XLowerLimit = CGFloat(-384 + (gridX * XCounter))
        XUpperLimit = CGFloat(-384 + (gridX * (XCounter + 1)))
        if coordinates.x >= 0 {
            if coordinates.x > XLowerLimit && coordinates.x < XUpperLimit {
                XValue = XCounter
            }
        }
        if coordinates.x <= 0 {
            if coordinates.x < XLowerLimit && coordinates.x > XUpperLimit {
                XValue = XCounter
            }
        }
        XCounter += 1
    }
    while YCounter <= 30 {
        YLowerLimit = CGFloat(512 - (gridY * YCounter))
        YUpperLimit = CGFloat(512 -  (gridY * (YCounter + 1)))
        if coordinates.y >= 0 {
            if coordinates.y > YLowerLimit && coordinates.y < YUpperLimit {
                YValue = YCounter
            }
        }
        if coordinates.y <= 0 {
            if coordinates.y < YLowerLimit && coordinates.y > YUpperLimit {
                YValue = YCounter
            }
        }
        YCounter += 1
    }
    
    tile = CGPoint(x: XValue, y: YValue)
    
    return tile
}
