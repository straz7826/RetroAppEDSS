//
//  Map.swift
//  Pacman
//
//  Created by MattK on 2017-12-01.
//  Copyright © 2017 Robit-Team  +1. All rights reserved.
//Matthew helped get right maze texture going

import Foundation
import UIKit
import SpriteKit
// Matt k, adds maze onto the screen
class MapNode: SKSpriteNode {
    class func Map() -> MapNode {
        let sprite = MapNode(imageNamed: "blue+maze+fixed")
        
        sprite.xScale = 0.3918367347
        sprite.yScale = 0.3918367347
        sprite.position = CGPoint(x: 0, y: 86.857142855)
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "blue+maze+fixed"), size: sprite.size)
        sprite.physicsBody?.usesPreciseCollisionDetection = true
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = false
            physics.isDynamic = false
            physics.linearDamping = 1
            physics.angularDamping = 1
        }
        return sprite
    }
}
