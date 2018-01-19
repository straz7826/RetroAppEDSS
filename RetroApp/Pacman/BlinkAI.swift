//
//  InkyAI.swift
//  Pacman
//
//  Created by Matthew Murray on 2017-12-08.
//  Copyright © 2017 Robit-Team  +1. All rights reserved.
//Matthew helped troubeshoot this

import Foundation
import SpriteKit
import GameplayKit
//James started here + helped
//Matt k, Blinkys ghost AI
class BlinkyNode: PacmanGameScene  {
    class func BlinkyAI(PacmanPosition: CGPoint, pacmanDirection: Int, Blinky: inout SKSpriteNode) -> CGPoint {
        //Blinky's starting tile
        var BlinkyTile = CGPoint(x: 14, y: 11)
        var BlinkyTarget: CGPoint
        var upDistance: Double = 0
        var downDistance: Double = 0
        var leftDistance: Double = 0
        var rightDistance: Double = 0
        var direction: Double
        var temp: CGPoint
        var BlinkysuperArrayPosition: Int = 114
        var priority: Array<Double> = [upDistance, downDistance, leftDistance, rightDistance]
        var counter1: Int = 0
        
        BlinkyTarget = CGPoint(x: PacmanPosition.x ,y: PacmanPosition.y)
        // priority setting
        // up
        upDistance = sqrt(pow(Double(BlinkyTarget.x - BlinkyTile.x), 2 ) + pow(Double(BlinkyTarget.y - BlinkyTile.y - 1), 2))
        
        // down
        downDistance = sqrt(pow(Double(BlinkyTarget.x - BlinkyTile.x), 2 ) + pow(Double(BlinkyTarget.y - BlinkyTile.y + 1), 2))
        
        // left
        leftDistance = sqrt(pow(Double(BlinkyTarget.x - BlinkyTile.x - 1), 2 ) + pow(Double(BlinkyTarget.y - BlinkyTile.y), 2))
        
        // right
        rightDistance = sqrt(pow(Double(BlinkyTarget.x - BlinkyTile.x + 1), 2 ) + pow(Double(BlinkyTarget.y - BlinkyTile.y), 2))
        
        priority[0] = upDistance
        priority[1] = downDistance
        priority[2] = leftDistance
        priority[3] = rightDistance
        // Figure which distance is the shortest
        func sort (array: inout Array<Double>) {
            let first: Int = 0
            let second: Int = 1
            if array != array.sorted() {
                for i in 0..<array.capacity-1 {
                    if array[first+i] > array[second+i] {
                        array.swapAt(first+i, second+i)
                    }
                }
            }
        }
        sort(array: &priority)
        // Matt K, ghost movment system
        if upDistance == priority[counter1] {
            temp = BlinkyTile
            BlinkyTile = moveUp(character: &Blinky, texture: "blinky+up", tile: BlinkyTile, superArrayPosition: &BlinkysuperArrayPosition)
            print("up1")
            if BlinkyTile == CGPoint(x: 100, y: 100) {
                BlinkyTile = temp
                counter1 += 1
            } else {
                counter1 = 0
            }
        }
        if downDistance == priority[counter1] {
            temp = BlinkyTile
            BlinkyTile = moveDown(character: &Blinky, texture: "blinky+down", tile: BlinkyTile, superArrayPosition: &BlinkysuperArrayPosition)
            print("Down1")
            if BlinkyTile == CGPoint(x: 100, y: 100) {
                BlinkyTile = temp
                counter1 += 1
            } else {
                counter1 = 0
            }
        }
        if leftDistance == priority[counter1] {
            temp = BlinkyTile
            BlinkyTile = moveLeft(character: &Blinky, texture: "blinky+left", tile: BlinkyTile, superArrayPosition: &BlinkysuperArrayPosition)
            print("left1")
            if BlinkyTile == CGPoint(x: 100, y: 100) {
                BlinkyTile = temp
                counter1 += 1
            } else {
                counter1 = 0
            }
        }
        if rightDistance == priority[counter1] {
            temp = BlinkyTile
            BlinkyTile = moveRight(character: &Blinky, texture: "blinky+right", tile: BlinkyTile, superArrayPosition: &BlinkysuperArrayPosition)
            print("right1")
            if BlinkyTile == CGPoint(x: 100, y: 100) {
                BlinkyTile = temp
                counter1 += 1
            } else {
                counter1 = 0
            }
        }
        
        return BlinkyTile
        
    }
}

