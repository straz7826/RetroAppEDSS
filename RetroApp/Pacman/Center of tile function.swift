//
//  Center of tile function.swift
//  Pacman
//
//  Created by MattK on 2017-12-07.
//  Copyright © 2017 Robit-Team  +1. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

//Matt k, takes in tile and finds the center of it as a pixel coordinate

func CenterOfTile(tile: CGPoint) -> CGPoint {
    
    var tileCenter: CGPoint = CGPoint(x:0,y:0)
    let gridX: CGFloat = 27.4285714286
    let gridY: CGFloat = 27.4285714284
    var XUpperLimit: CGFloat = 0
    var XLowerLimit: CGFloat = 0
    var YUpperLimit: CGFloat = 0
    var YLowerLimit: CGFloat = 0
    var XCounter: CGFloat = 0
    var YCounter: CGFloat = 0
    var XValue: CGFloat = 0
    var YValue: CGFloat = 0
    
    XCounter = tile.x
    YCounter = tile.y
    
    XLowerLimit = CGFloat(-384 + (gridX * XCounter))
    XUpperLimit = CGFloat(-384 + (gridX * (XCounter + 1)))
    XValue = (XLowerLimit + XUpperLimit) / 2
    
    YLowerLimit = CGFloat(512 - (gridY * YCounter))
    YUpperLimit = CGFloat(512 - (gridY * (YCounter + 1)))
    YValue = (YLowerLimit + YUpperLimit) / 2
    
    tileCenter = CGPoint(x: XValue, y: YValue)
    
    return tileCenter
}

