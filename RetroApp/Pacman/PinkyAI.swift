//
//  PinkyAI.swift
//  Pacman
//
//  Created by Matthew Murray on 2017-12-08.
//  Copyright © 2017 Robit-Team  +1. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class pinkyNode: SKSpriteNode {
    class func pinky(pacmanPosition: CGPoint, pacmanDirection: Int) -> SKSpriteNode {
        var pinky = SKSpriteNode(imageNamed: "pinky+left")
       var pinkyTile = CGPoint(x: 13, y: 14)
        pinky.position = CenterOfTile(tile: pinkyTile )
       // variables
        var PinkySuperArrayPosition: Int = 137
        var target = CenterOfTile(tile: CGPoint(x: 3, y: -3))
        let upDistance = sqrt(pow(Double(target.x - pinky.position.x), 2)) + pow(Double(target.y - pinky.position.y - 1), 2)
        let downDistance = sqrt(pow(Double(target.x - pinky.position.x), 2)) + pow(Double(target.y - pinky.position.y + 1), 2)
        let leftDistance = sqrt(pow(Double(target.x - pinky.position.x - 1), 2)) + pow(Double(target.y - pinky.position.y), 2)
       let rightDistance = sqrt(pow(Double(target.x - pinky.position.x + 1), 2)) + pow(Double(target.y - pinky.position.y), 2)
       var upPriority = 0
        var downPriority = 0
        var rightPriority = 0
        var leftPriority = 0
        pinky.xScale = 0.3
        pinky.yScale = 0.3
        
        // targeting
        if pacmanDirection == 1 {
            target = CenterOfTile(tile: CGPoint(x:pacmanPosition.x - 4 , y: pacmanPosition.y - 4))
        
        }else if pacmanDirection == 2 {
           target = CenterOfTile(tile: CGPoint(x:pacmanPosition.x, y: pacmanPosition.y + 4))
        }else if pacmanDirection == 3 {
             target = CenterOfTile(tile: CGPoint(x:pacmanPosition.x - 4, y: pacmanPosition.y))
        }else if pacmanDirection == 4 {
             target = CenterOfTile(tile: CGPoint(x: pacmanPosition.x + 4, y: pacmanPosition.y))
        }
        // pathing logic
        if pinky.position != target {
            if upDistance < downDistance || upDistance < leftDistance || upDistance < rightDistance {
              pinky.position.y -= 1
                upPriority = 1
                if upPriority == 1 {
                    if downDistance  < leftDistance || downDistance  < rightDistance {
                        pinky.position.y += 1
                        downPriority = 2
                        if leftDistance < rightDistance && downPriority == 2 {
                            leftPriority = 3
                            rightPriority = 4
                        }else{
                           rightPriority = 3
                            leftPriority = 4
                        }
                    }
                    if  leftDistance  < downDistance || leftDistance  < rightDistance {
                        pinky.position.y += 1
                        leftPriority = 2
                        if downDistance < rightDistance && leftPriority == 2 {
                            downPriority = 3
                            rightPriority = 4
                        }else{
                            rightPriority = 3
                            downPriority = 4
                        }
                    }
                    if  rightDistance  < downDistance || rightDistance < leftDistance   {
                        pinky.position.y += 1
                        rightPriority = 2
                        if downDistance < leftDistance && rightPriority == 2 {
                            downPriority = 3
                            leftPriority = 4
                        }else{
                            leftPriority = 3
                            downPriority = 4
                        }
                    }
                }
            if downDistance  < upDistance || downDistance  < leftDistance || downDistance  < rightDistance {
                pinky.position.y += 1
                downPriority = 1
                if downPriority == 1 {
                    if upDistance  < leftDistance || upDistance  < rightDistance {
                        pinky.position.y += 1
                        upPriority = 2
                        if leftDistance < rightDistance && downPriority == 2 {
                            leftPriority = 3
                            rightPriority = 4
                        }else{
                            rightPriority = 3
                            leftPriority = 4
                        }
                    }
                    if  leftDistance  < upDistance || leftDistance  < rightDistance {
                        pinky.position.y += 1
                        leftPriority = 2
                        if upDistance < rightDistance && leftPriority == 2 {
                            upPriority = 3
                            rightPriority = 4
                        }else{
                            rightPriority = 3
                            upPriority = 4
                        }
                    }
                    if  rightDistance  < upDistance || rightDistance < leftDistance   {
                        pinky.position.y += 1
                        rightPriority = 2
                        if upDistance < leftDistance && rightPriority == 2 {
                            upPriority = 3
                            leftPriority = 4
                        }else{
                            upPriority = 3
                            downPriority = 4
                        }
                    }
                }
                }
            if leftDistance < upDistance || leftDistance < downDistance || leftDistance < rightDistance {
                pinky.position.y -= 1
                leftPriority = 1
                if leftPriority == 1 {
                    if downDistance  < upDistance || downDistance  < rightDistance {
                        pinky.position.y += 1
                        downPriority = 2
                        if upDistance < rightDistance && downPriority == 2 {
                            upPriority = 3
                            rightPriority = 4
                        }else{
                            rightPriority = 3
                            upPriority = 4
                        }
                    }
                    if  upDistance  < downDistance || upDistance  < rightDistance {
                        pinky.position.y += 1
                        upPriority = 2
                        if downDistance < rightDistance && upPriority == 2 {
                            downPriority = 3
                            rightPriority = 4
                        }else{
                            rightPriority = 3
                            downPriority = 4
                        }
                    }
                    if  rightDistance  < downDistance || rightDistance < upDistance   {
                        pinky.position.y += 1
                        rightPriority = 2
                        if downDistance < upDistance && rightPriority == 2 {
                            downPriority = 3
                            upPriority = 4
                        }else{
                            upPriority = 3
                            downPriority = 4
                        }
                    }
                }
                }
            if rightDistance < downDistance || rightDistance < leftDistance || rightDistance < upDistance {
                pinky.position.y += 1
                rightPriority = 1
                if rightPriority == 1 {
                    if downDistance  < leftDistance || downDistance  < upDistance {
                        pinky.position.y += 1
                        downPriority = 2
                        if leftDistance < upDistance && downPriority == 2 {
                            leftPriority = 3
                            upPriority = 4
                        }else{
                            upPriority = 3
                            leftPriority = 4
                        }
                    }
                    if  leftDistance  < downDistance || leftDistance  < upDistance {
                        pinky.position.y += 1
                        leftPriority = 2
                        if downDistance < upDistance && leftPriority == 2 {
                            downPriority = 3
                            upPriority = 4
                        }else{
                            upPriority = 3
                            downPriority = 4
                        }
                    }
                    if  upDistance  < downDistance || upDistance < leftDistance   {
                        pinky.position.y += 1
                        upPriority = 2
                        if downDistance < leftDistance && upPriority == 2 {
                            downPriority = 3
                            leftPriority = 4
                        }else{
                            leftPriority = 3
                            downPriority = 4
                        }
                    }
                }
                }
            }
            // movement
            if upPriority == 1 {
                pinkyTile = moveUp(character: &pinky, texture: "Pinky+up", tile: pinkyTile, superArrayPosition: &PinkySuperArrayPosition)
            }
            
        }
        return pinky
    }
}

