//
//  ClydeAI.swift
//  Pacman
//
//  Created by Matthew Murray on 2017-12-08.
//  Copyright © 2017 Robit-Team  +1. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class clydeNode: SKSpriteNode {
    class func clyde() -> SKSpriteNode {
        var clyde = SKSpriteNode(imageNamed: "clyde+left")
        
        clyde.position = CenterOfTile(tile: CGPoint(x: 16, y: 14))
        clyde.xScale = 0.3
        clyde.yScale = 0.3
        return clyde
    }
}
