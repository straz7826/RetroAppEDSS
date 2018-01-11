//
//  InkyAI.swift
//  Pacman
//
//  Created by Matthew Murray on 2017-12-08.
//  Copyright © 2017 Robit-Team  +1. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class InkyNode: SKSpriteNode {
    class func Inky(PacmanPosition: CGPoint, BlinkyPosition: CGPoint, pacmanDirection: Int, Inky: inout SKSpriteNode) -> CGPoint {
        var InkyTile: CGPoint = CGPoint(x: 12, y: 11)
        var blinkyTarget: CGPoint
        var InkyTarget: CGPoint
        var tempX: CGFloat
        var tempY: CGFloat
        var upDistance: Double = 0
        var downDistance: Double = 0
        var leftDistance: Double = 0
        var rightDistance: Double = 0
        var direction: Int
        var temp1: String
        var InkysuperArrayPosition: Int = 138
        var priority: Array<Double> = [upDistance , downDistance , leftDistance , rightDistance]
        Inky.position = CenterOfTile(tile: InkyTile)
        Inky.xScale = 0.3
        Inky.yScale = 0.3
        
        if pacmanDirection == 1 {
            blinkyTarget = CGPoint(x: PacmanPosition.x + 2 ,y: PacmanPosition.y - 2)
        } else if pacmanDirection == 2 {
            blinkyTarget = CGPoint(x: PacmanPosition.x ,y: PacmanPosition.y + 2)
        } else if pacmanDirection == 3 {
            blinkyTarget = CGPoint(x: PacmanPosition.x - 2 ,y: PacmanPosition.y)
        } else {
            blinkyTarget = CGPoint(x: PacmanPosition.x + 2 ,y: PacmanPosition.y)
        }
        
        tempX = blinkyTarget.x - BlinkyPosition.x
        tempY = blinkyTarget.y - BlinkyPosition.y
        
        InkyTarget = CGPoint(x: blinkyTarget.x - tempX, y: blinkyTarget.y - tempY)
        
        // priority setting
        // up
        upDistance = sqrt(pow(Double(InkyTarget.x - InkyTile.x), 2 ) + pow(Double(InkyTarget.y - InkyTile.y - 1), 2))
        // down
        downDistance = sqrt(pow(Double(InkyTarget.x - InkyTile.x), 2 ) + pow(Double(InkyTarget.y - InkyTile.y + 1), 2))
        // left
        leftDistance = sqrt(pow(Double(InkyTarget.x - InkyTile.x - 1), 2 ) + pow(Double(InkyTarget.y - InkyTile.y), 2))
        // right
        rightDistance = sqrt(pow(Double(InkyTarget.x - InkyTile.x + 1), 2 ) + pow(Double(InkyTarget.y - InkyTile.y), 2))
        
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
        
        if priority[0] == upDistance {
            temp = moveUp(character: &Inky, texture: "inky+up", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
            if temp == CGPoint(x: 100, y: 100) {
                if priority[1] == downDistance {
                    temp = moveDown(character: &Inky, texture: "inky+down", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                    if temp == CGPoint(x: 100, y: 100) {
                        if priority[2] == leftDistance {
                            temp = moveLeft(character: &Inky, texture: "inky+left", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                            if temp == CGPoint(x: 100, y: 100) {
                                    temp = moveRight(character: &Inky, texture: "inky+right", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                                    if temp != CGPoint(x: 100, y: 100) {
                                        InkyTile = temp
                                    }
                            } else {
                                InkyTile = temp
                            }
                        }
                    } else {
                        InkyTile = temp
                    }
                }
            } else {
                InkyTile = temp
            }
        }
        if priority[1] == upDistance {
            temp = moveDown(character: &Inky, texture: "inky+up", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
            if temp == CGPoint(x: 100, y: 100) {
                if priority[2] == downDistance {
                    temp = moveLeft(character: &Inky, texture: "inky+down", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                    if temp == CGPoint(x: 100, y: 100) {
                        if priority[3] == leftDistance {
                            temp = moveRight(character: &Inky, texture: "inky+left", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                            if temp == CGPoint(x: 100, y: 100) {
                                temp = moveUp(character: &Inky, texture: "inky+right", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                                if temp != CGPoint(x: 100, y: 100) {
                                    InkyTile = temp
                                }
                            } else {
                                InkyTile = temp
                            }
                        }
                    } else {
                        InkyTile = temp
                    }
                }
            } else {
                InkyTile = temp
            }
        }
        if priority[2] == upDistance {
            temp = moveLeft(character: &Inky, texture: "inky+up", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
            if temp == CGPoint(x: 100, y: 100) {
                if priority[3] == downDistance {
                    temp = moveRight(character: &Inky, texture: "inky+down", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                    if temp == CGPoint(x: 100, y: 100) {
                        if priority[0] == leftDistance {
                            temp = moveUp(character: &Inky, texture: "inky+left", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                            if temp == CGPoint(x: 100, y: 100) {
                                temp = moveDown(character: &Inky, texture: "inky+right", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                                if temp != CGPoint(x: 100, y: 100) {
                                    InkyTile = temp
                                }
                            } else {
                                InkyTile = temp
                            }
                        }
                    } else {
                        InkyTile = temp
                    }
                }
            } else {
                InkyTile = temp
            }
        }
        if priority[3] == upDistance {
            temp = moveRight(character: &Inky, texture: "inky+up", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
            if temp == CGPoint(x: 100, y: 100) {
                if priority[0] == downDistance {
                    temp = moveUp(character: &Inky, texture: "inky+down", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                    if temp == CGPoint(x: 100, y: 100) {
                        if priority[1] == leftDistance {
                            temp = moveDown(character: &Inky, texture: "inky+left", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                            if temp == CGPoint(x: 100, y: 100) {
                                temp = moveLeft(character: &Inky, texture: "inky+right", tile: InkyTile, superArrayPosition: &InkysuperArrayPosition)
                                if temp != CGPoint(x: 100, y: 100) {
                                    InkyTile = temp
                                }
                            } else {
                                InkyTile = temp
                            }
                        }
                    } else {
                        InkyTile = temp
                    }
                }
            } else {
                InkyTile = temp
            }
        }
        return InkyTile
    }
}


