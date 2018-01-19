//
//  Move.swift
//  Pacman
//
//  Created by MattK on 2017-12-20.
//  Copyright © 2017 Robit-Team  +1. All rights reserved.
//Matthew helped fix superarray

import SpriteKit
import GameplayKit
// Matt k, movement system. Takes in the character direction and a few other variables and make that character move.
//James helped with super array
// Super array, contains all tilest that pacman is allowed to move in. done by all
var allowedTiles: [CGPoint] = [CGPoint(x: 1 ,y: 1), CGPoint(x: 2 ,y: 1), CGPoint(x: 3 ,y: 1), CGPoint(x: 4 ,y: 1), CGPoint(x: 5 ,y: 1), CGPoint(x: 6 ,y: 1), CGPoint(x: 7 ,y: 1), CGPoint(x: 8 ,y: 1), CGPoint(x: 9 ,y: 1), CGPoint(x: 10 ,y: 1), CGPoint(x: 11 ,y: 1), CGPoint(x: 12 ,y: 1),  CGPoint(x: 15 ,y: 1), CGPoint(x: 16 ,y: 1), CGPoint(x: 17 ,y: 1), CGPoint(x: 18 ,y: 1), CGPoint(x: 19 ,y: 1), CGPoint(x: 20 ,y: 1), CGPoint(x: 21 ,y: 1), CGPoint(x: 22 ,y: 1), CGPoint(x: 23 ,y: 1), CGPoint(x: 24 ,y: 1), CGPoint(x: 25 ,y: 1), CGPoint(x: 26 ,y: 1), CGPoint(x: 1 ,y: 2), CGPoint(x: 6 ,y: 2), CGPoint(x: 12 ,y: 2), CGPoint(x: 15 ,y: 2), CGPoint(x: 21 ,y: 2), CGPoint(x: 26 ,y: 2), CGPoint(x: 1 ,y: 3), CGPoint(x: 6 ,y: 3), CGPoint(x: 12 ,y: 3), CGPoint(x: 15 ,y: 3), CGPoint(x: 21 ,y: 3), CGPoint(x: 26 ,y: 3), CGPoint(x: 1 ,y: 4), CGPoint(x: 6 ,y: 4), CGPoint(x: 12 ,y: 4), CGPoint(x: 15 ,y: 4), CGPoint(x: 21 ,y: 4), CGPoint(x:  26 ,y: 4), CGPoint(x: 1 ,y: 5), CGPoint(x: 2 ,y: 5), CGPoint(x: 3 ,y: 5), CGPoint(x: 4 ,y: 5), CGPoint(x: 5 ,y: 5), CGPoint(x: 6 ,y: 5), CGPoint(x: 7 ,y: 5), CGPoint(x: 8 ,y: 5), CGPoint(x: 9 ,y: 5), CGPoint(x: 10 ,y: 5), CGPoint(x: 11 ,y: 5), CGPoint(x: 12 ,y: 5), CGPoint(x: 13 ,y: 5), CGPoint(x: 14 ,y: 5), CGPoint(x: 15 ,y: 5), CGPoint(x: 16 ,y: 5), CGPoint(x: 17 ,y: 5), CGPoint(x: 18 ,y: 5), CGPoint(x: 19 ,y: 5), CGPoint(x: 20 ,y: 5), CGPoint(x: 21 ,y: 5), CGPoint(x: 22 ,y: 5), CGPoint(x: 23 ,y: 5), CGPoint(x: 24 ,y: 5), CGPoint(x: 25 ,y: 5), CGPoint(x: 26 ,y: 5), CGPoint(x: 1 ,y: 6), CGPoint(x: 6 ,y: 6), CGPoint(x: 9 ,y: 6), CGPoint(x: 18 ,y: 6), CGPoint(x: 21 ,y: 6), CGPoint(x:  26 ,y: 6), CGPoint(x: 1 ,y: 7), CGPoint(x: 6 ,y: 7), CGPoint(x: 9 ,y: 7), CGPoint(x: 18 ,y: 7), CGPoint(x: 21 ,y: 7), CGPoint(x:  26 ,y: 7), CGPoint(x: 1 ,y: 8), CGPoint(x: 2 ,y: 8), CGPoint(x: 3 ,y: 8), CGPoint(x: 4 ,y: 8), CGPoint(x: 5 ,y: 8), CGPoint(x: 6 ,y: 8), CGPoint(x: 9 ,y: 8), CGPoint(x: 10 ,y: 8), CGPoint(x: 11 ,y: 8), CGPoint(x: 12 ,y: 8),  CGPoint(x: 15 ,y: 8), CGPoint(x: 16 ,y: 8), CGPoint(x: 17 ,y: 8), CGPoint(x: 18 ,y: 8), CGPoint(x: 21 ,y: 8), CGPoint(x: 22 ,y: 8), CGPoint(x: 23 ,y: 8), CGPoint(x: 24 ,y: 8),  CGPoint(x: 25 ,y: 8), CGPoint(x: 26 ,y: 8), CGPoint(x: 6 ,y: 9), CGPoint(x: 12 ,y: 9), CGPoint(x: 15 ,y: 9), CGPoint(x: 21 ,y: 9), CGPoint(x: 6 ,y: 10), CGPoint(x: 12 ,y: 10), CGPoint(x: 15 ,y: 10), CGPoint(x:  21 ,y: 10), CGPoint(x: 6 ,y: 11), CGPoint(x: 9 ,y: 11), CGPoint(x: 10 ,y: 11), CGPoint(x: 11 ,y: 11), CGPoint(x: 12 ,y: 11), CGPoint(x: 13 ,y: 11), CGPoint(x: 14 ,y: 11), CGPoint(x: 15 ,y: 11), CGPoint(x: 16 ,y: 11), CGPoint(x: 17 ,y: 11), CGPoint(x: 18 ,y: 11), CGPoint(x: 21 ,y: 11), CGPoint(x: 6 ,y: 12), CGPoint(x: 9 ,y: 12), CGPoint(x: 18 ,y: 12), CGPoint(x: 21 ,y: 12), CGPoint(x: 6 ,y: 13), CGPoint(x: 9 ,y: 13), CGPoint(x: 18 ,y: 13), CGPoint(x: 21 ,y: 13), CGPoint(x: 0 ,y: 14), CGPoint(x: 1 ,y: 14), CGPoint(x: 2 ,y: 14), CGPoint(x: 3 ,y: 14), CGPoint(x: 4 ,y: 14), CGPoint(x: 5 ,y: 14), CGPoint(x: 6 ,y: 14), CGPoint(x: 7 ,y: 14), CGPoint(x: 8 ,y: 14), CGPoint(x: 9 ,y: 14), CGPoint(x: 18 ,y: 14), CGPoint(x: 19 ,y: 14), CGPoint(x: 20 ,y: 14), CGPoint(x: 21 ,y: 14), CGPoint(x: 22 ,y: 14), CGPoint(x: 23 ,y: 14), CGPoint(x: 24 ,y: 14), CGPoint(x: 25 ,y: 14), CGPoint(x: 26 ,y: 14), CGPoint(x: 27 ,y: 14), CGPoint(x: 6, y: 15), CGPoint(x: 9 ,y: 15), CGPoint(x: 18 ,y: 15), CGPoint(x: 21 ,y: 15), CGPoint(x: 6 ,y: 16), CGPoint(x: 9 ,y: 16), CGPoint(x: 18 ,y: 16), CGPoint(x:  21 ,y: 16), CGPoint(x: 6 ,y: 17), CGPoint(x: 9 ,y: 17), CGPoint(x: 10 ,y: 17), CGPoint(x: 11 ,y: 17), CGPoint(x: 12 ,y: 17), CGPoint(x: 13 ,y: 17), CGPoint(x: 14 ,y: 17), CGPoint(x: 15 ,y: 17), CGPoint(x: 16 ,y: 17), CGPoint(x: 17 ,y: 17), CGPoint(x: 18 ,y: 17), CGPoint(x: 21 ,y: 17), CGPoint(x: 6 ,y: 18), CGPoint(x: 9 ,y: 18), CGPoint(x: 18 ,y: 18), CGPoint(x: 21 ,y: 18), CGPoint(x: 6 ,y: 19), CGPoint(x: 9 ,y: 19), CGPoint(x: 18,y: 19), CGPoint(x: 21 ,y: 19), CGPoint(x: 1 ,y: 20), CGPoint(x: 2 ,y: 20), CGPoint(x: 3 ,y: 20), CGPoint(x: 4 ,y: 20), CGPoint(x: 5 ,y: 20), CGPoint(x: 6 ,y: 20), CGPoint(x: 7 ,y: 20), CGPoint(x: 8 ,y: 20), CGPoint(x: 9 ,y: 20), CGPoint(x: 10 ,y: 20), CGPoint(x: 11 ,y: 20), CGPoint(x: 12 ,y: 20),  CGPoint(x: 15 ,y: 20), CGPoint(x: 16 ,y: 20), CGPoint(x: 17 ,y: 20), CGPoint(x: 18 ,y: 20), CGPoint(x: 19 ,y: 20), CGPoint(x: 20 ,y: 20), CGPoint(x: 21 ,y: 20), CGPoint(x: 22 ,y: 20), CGPoint(x: 23 ,y: 20), CGPoint(x: 24 ,y: 20), CGPoint(x: 25 ,y: 20), CGPoint(x: 26  ,y: 20), CGPoint(x: 1 ,y: 21 ), CGPoint(x: 6 ,y: 21), CGPoint(x: 12 ,y: 21), CGPoint(x: 15 ,y: 21), CGPoint(x: 21 ,y: 21), CGPoint(x: 26 ,y: 21), CGPoint(x: 1 ,y: 22), CGPoint(x: 6 ,y: 22), CGPoint(x: 12 ,y: 22), CGPoint(x: 15 ,y: 22), CGPoint(x: 21 ,y: 22), CGPoint(x: 26 ,y: 22), CGPoint(x: 1 ,y: 23), CGPoint(x: 2 ,y: 23), CGPoint(x: 3 ,y: 23), CGPoint(x: 6 ,y: 23), CGPoint(x: 7 ,y: 23), CGPoint(x: 8 ,y: 23), CGPoint(x: 9 ,y: 23), CGPoint(x: 10 ,y: 23), CGPoint(x: 11 ,y: 23), CGPoint(x: 12 ,y: 23), CGPoint(x: 13 ,y: 23), CGPoint(x: 14 ,y: 23), CGPoint(x: 15 ,y: 23), CGPoint(x: 16 ,y: 23), CGPoint(x: 17 ,y: 23), CGPoint(x:18 ,y: 23), CGPoint(x: 19 ,y: 23), CGPoint(x: 20 ,y: 23), CGPoint(x: 21 ,y: 23), CGPoint(x: 24 ,y: 23), CGPoint(x: 25 ,y: 23), CGPoint(x: 26 ,y: 23), CGPoint(x: 3 ,y: 24), CGPoint(x: 6 ,y: 24), CGPoint(x: 9 ,y: 24), CGPoint(x: 18 ,y: 24), CGPoint(x: 21 ,y: 24), CGPoint(x: 24 ,y: 24), CGPoint(x: 3 ,y: 25), CGPoint(x: 6 ,y: 25), CGPoint(x: 9 ,y: 25), CGPoint(x: 18 ,y: 25), CGPoint(x: 21 ,y: 25), CGPoint(x: 24 ,y: 25), CGPoint(x: 1 ,y: 26), CGPoint(x: 2 ,y: 26), CGPoint(x: 3 ,y: 26), CGPoint(x: 4 ,y: 26), CGPoint(x: 5 ,y: 26), CGPoint(x: 6 ,y: 26), CGPoint(x: 9 ,y: 26), CGPoint(x: 10 ,y: 26), CGPoint(x: 11 ,y: 26), CGPoint(x: 12 ,y: 26),  CGPoint(x: 15 ,y: 26), CGPoint(x: 16 ,y: 26), CGPoint(x: 17 ,y: 26), CGPoint(x: 18 ,y: 26), CGPoint(x: 21 ,y: 26), CGPoint(x: 22 ,y: 26), CGPoint(x: 23 ,y: 26), CGPoint(x: 24 ,y: 26),  CGPoint(x: 25 ,y: 26), CGPoint(x: 26 ,y: 26), CGPoint(x: 1 ,y: 27), CGPoint(x: 12 ,y: 27), CGPoint(x: 15 ,y: 27), CGPoint(x: 26 ,y: 27), CGPoint(x: 1 ,y: 28), CGPoint(x: 12 ,y: 28), CGPoint(x: 15 ,y: 28), CGPoint(x: 26 ,y: 28), CGPoint(x: 1 ,y: 29), CGPoint(x: 2 ,y: 29), CGPoint(x: 3 ,y: 29), CGPoint(x: 4 ,y: 29), CGPoint(x: 5 ,y: 29), CGPoint(x: 6 ,y: 29), CGPoint(x: 7 ,y: 29), CGPoint(x: 8 ,y: 29), CGPoint(x: 9 ,y: 29), CGPoint(x: 10 ,y: 29), CGPoint(x: 11 ,y: 29), CGPoint(x: 12 ,y: 29), CGPoint(x: 13 ,y: 29), CGPoint(x: 14 ,y: 29), CGPoint(x: 15 ,y: 29), CGPoint(x: 16 ,y: 29), CGPoint(x: 17 ,y: 29), CGPoint(x: 18 ,y: 29), CGPoint(x: 19 ,y: 29), CGPoint(x: 20 ,y: 29), CGPoint(x: 21 ,y: 29), CGPoint(x: 22 ,y: 29), CGPoint(x: 23 ,y: 29), CGPoint(x: 24 ,y: 29), CGPoint(x: 25 ,y: 29), CGPoint(x: 26 ,y: 29),]
var UpperCounterLimit: Int = 0
var LowerCounterLimit: Int = 0
var temp:CGPoint = CGPoint(x: 0 , y: 0)
var counter: Int = 0
//Matt k, actual movement
func moveUp(character: inout SKSpriteNode, texture: String, tile: CGPoint, superArrayPosition: inout Int) -> CGPoint{
    temp = tile
    if superArrayPosition + 30 <= allowedTiles.capacity - 1 && superArrayPosition  - 30 >= 0 {
        UpperCounterLimit = superArrayPosition + 30
        LowerCounterLimit = superArrayPosition - 30
    } else {
        UpperCounterLimit = allowedTiles.capacity - 1
        LowerCounterLimit = 0
    }
    for Check1 in LowerCounterLimit...UpperCounterLimit {
        if CGPoint(x: allowedTiles[Check1].x ,y: allowedTiles[Check1].y) == CGPoint(x: temp.x ,y: temp.y - 1) {
            if 0 == counter % 4 {
                temp.y -= 1
                superArrayPosition = Check1
                character.texture = SKTexture(imageNamed: texture)
                character.position = CenterOfTile(tile: CGPoint(x: temp.x ,y: temp.y))
                return temp
            }
        }
    }
    return CGPoint(x: 100,y: 100)
}
func moveDown(character: inout SKSpriteNode, texture: String, tile: CGPoint, superArrayPosition: inout Int) -> CGPoint{
    temp = tile
    if superArrayPosition + 30 <= allowedTiles.capacity - 1 && superArrayPosition  - 30 >= 0 {
        UpperCounterLimit = superArrayPosition + 30
        LowerCounterLimit = superArrayPosition - 30
    } else {
        UpperCounterLimit = allowedTiles.capacity - 1
        LowerCounterLimit = 0
    }
    for Check2 in LowerCounterLimit...UpperCounterLimit {
        if CGPoint(x: allowedTiles[Check2].x ,y: allowedTiles[Check2].y) == CGPoint(x: temp.x ,y: temp.y + 1) {
            if 0 == counter % 4 {
                temp.y += 1
                superArrayPosition = Check2
                character.texture = SKTexture(imageNamed: texture)
                character.position = CenterOfTile(tile: CGPoint(x: temp.x ,y: temp.y))
                return temp
            }
        }
    }
    return CGPoint(x: 100,y: 100)
}
func moveLeft(character: inout SKSpriteNode, texture: String, tile: CGPoint, superArrayPosition: inout Int) -> CGPoint{
    temp = tile
    if superArrayPosition - 1 < 0 {
        LowerCounterLimit = 0
    } else {
        LowerCounterLimit = superArrayPosition - 1
    }
    if CGPoint(x: allowedTiles[LowerCounterLimit].x ,y: allowedTiles[LowerCounterLimit].y) == CGPoint(x: temp.x - 1 ,y: temp.y) {
        if 0 == counter % 4 {
            temp.x -= 1
            superArrayPosition -= 1
            character.texture = SKTexture(imageNamed: texture)
            character.position = CenterOfTile(tile: CGPoint(x: temp.x ,y: temp.y))
            return temp
        }
    }
    return CGPoint(x: 100,y: 100)
}
func moveRight(character: inout SKSpriteNode, texture: String, tile: CGPoint, superArrayPosition: inout Int) -> CGPoint{
    temp = tile
    if superArrayPosition + 1 >= allowedTiles.capacity - 1  {
        UpperCounterLimit =  allowedTiles.capacity - 1
    } else if superArrayPosition < allowedTiles.capacity - 1 {
        UpperCounterLimit = superArrayPosition + 1
    }
    if CGPoint(x: allowedTiles[UpperCounterLimit].x ,y: allowedTiles[UpperCounterLimit].y) == CGPoint(x: temp.x + 1 ,y: temp.y) {
        if 0 == counter % 4 {
            temp.x += 1
            superArrayPosition += 1
            character.texture = SKTexture(imageNamed: texture)
            character.position = CenterOfTile(tile: CGPoint(x: temp.x ,y: temp.y))
            return temp
        }
    }
    return CGPoint(x: 100,y: 100)
}

