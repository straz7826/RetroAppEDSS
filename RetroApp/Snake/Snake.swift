//
//  Snake.swift
//  Snake
//
//  Created by Matt T on 2017-12-07.
//  Copyright © 2017 Matthew Temniuk, Hunter Heibein, Aaron Herschberger. All rights reserved.Not Jimmy Lu
//

import Foundation
import UIKit

struct Coordinates{
    var x: Int
    var y: Int
}
enum Direction{
    case up,down,left,right
}

class Snake{
    
    var isAlive:Bool = true
    var length:UInt = 0
    var oldBodyCoords: Coordinates
    var direction = Direction.up
    var speed:Double
    var bodyCoordinates: [Coordinates]
    var foodCordinate: Coordinates
    var wallSnake: [Coordinates]
    var score = 0
    
    
    
    
    
    
    
    init(speed:Double) {
        
        
        self.speed = speed
        foodCordinate = Coordinates(x: 0, y: 0)
        bodyCoordinates = [Coordinates(x: 0, y: 0)]
        oldBodyCoords = Coordinates(x: 0, y: 0)
        wallSnake = [Coordinates(x: 0, y: 0)]
        
    }
    
    
    func move(Image: UIView, Body1: UIView,start: UIView) {
        var headPoint = bodyCoordinates[0]
        if direction==Direction.up{
            
            headPoint.y+=1
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                Image.center.y -= 32
            }, completion: nil)
            
            
        }else if direction==Direction.down{
            
            headPoint.y-=1
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                Image.center.y += 32
            }, completion: nil)
            
            
        }else if direction==Direction.right{
            
            headPoint.x+=1
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                Image.center.x += 32
            }, completion: nil)
            
            
            
        }else {
            
            headPoint.x-=1
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                Image.center.x -= 32
            }, completion: nil)
        }
        let startX = Int(start.center.x)
        let startY = Int(start.center.y)
        Body1.center.x = CGFloat(startX + 32 * (bodyCoordinates[Int(length)].x-1))
        Body1.center.y = CGFloat(startY - 32 * (bodyCoordinates[Int(length)].y - 1))
        
        oldBodyCoords = bodyCoordinates.removeLast()
        bodyCoordinates.insert(headPoint, at: 0)
        
        
        
        
    }
    
    func spawn(){
        
        bodyCoordinates.removeAll()
        let cord1 = Coordinates(x: 7, y: 10)
        bodyCoordinates.insert(cord1, at: 0)
    }
    
    func spawnImage(Image: UIView, length: Int, start: UIView){
        let startX = Int(start.center.x)
        let startY = Int(start.center.y)
        Image.center.x = CGFloat(startX + 32 * (bodyCoordinates[Int(length)].x-1))
        Image.center.y = CGFloat(startY - 32 * (bodyCoordinates[Int(length)].y - 1))
    }
    
    func foodAte(Image: UIView, start: UIView, body: UIView){
        let startX = Int(start.center.x)
        let startY = Int(start.center.y)
        
        print("\(bodyCoordinates), and more....")
        length+=1
        score+=100
        genFood(Image: Image, start:start)
        bodyCoordinates.insert(oldBodyCoords, at: bodyCoordinates.endIndex)
    }
    func genFood(Image: UIView,start: UIView){
        var x: Int = 0
        var y: Int = 0
        let startX = Int(start.center.x)
        let startY = Int(start.center.y)
        var canGen: Bool = false
        Image.isHidden = false
        while canGen != true   {
            x = Int(arc4random_uniform(20)+1)
            y = Int(arc4random_uniform(20)+1)
            for index in bodyCoordinates[0..<bodyCoordinates.count]    {
                if x != index.x  &&  y != index.y {
                    canGen = true
                    foodCordinate.x = Int(x)
                    Image.center.x = CGFloat(startX + 32*(x-1))
                    foodCordinate.y = Int(y)
                    Image.center.y = CGFloat(startY - 32*(y-1))
                } else{
                    
                    canGen = false
                    
                }
            }
            
            
        }
        
    }
    
    func changeDirection(_ newDirection: Direction)  {
        if (direction == Direction.down || direction == Direction.up) && (newDirection == Direction.down || newDirection == Direction.up){
            
            
        }
        else if (direction == Direction.left || direction == Direction.right) && (newDirection == Direction.left || newDirection == Direction.right){
            
        }
        else{
            direction = newDirection
        }
        
    }
    
    func headHitBody() -> Bool{
        let headPoint = bodyCoordinates[0]
        for bodyPoint in bodyCoordinates[1..<bodyCoordinates.count]   {
            if bodyPoint.x == headPoint.x && bodyPoint.y == headPoint.y {
                isAlive = false
                return true
            }
        }
        return false
    }
    
    func headHitWall(Image: UIView) -> Bool{
        
        if Image.center.x < 64 || Image.center.x > 702 {
            return true
        }
        if Image.center.y < 92 || Image.center.y > 732 {
            return true
        }
        return false
        
        //        for wallPoint in wallSnake[1..<wallSnake.count]   {
        //            if wallPoint.x == headPoint.x && wallPoint.y == headPoint.y {
        //                isAlive = false
        //                return true
        //            }
        //        }
        //        return false
    }
    func returnImage(Image: UIView){
        Image.center.x = 0
        Image.center.y = 0
    }
    func generateWallSnake(){
        var wallSnake = [Coordinates](repeating: Coordinates(x: 0, y: 0), count: 75)
        for z in 0...18{
            var n = 0
            wallSnake[z] = Coordinates(x: Int(21), y: Int(n))
            n += 1
        }
        for z in 19...37{
            var n = 0
            wallSnake[z] = Coordinates(x: Int(0), y: Int(n))
            n += 1
        }
        for z in 38...56{
            var n = 0
            wallSnake[z] = Coordinates(x: Int(n), y: Int(0))
            n += 1
        }
        for z in 57...75{
            var n = 0
            wallSnake[z] = Coordinates(x: Int(n), y: Int(21))
            n += 1
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

