//
//  paddle2.swift
//  TitleScreen2
//
//  Created by Ashley Bowman on 2018-01-08.
//  Copyright © 2018 Bowman A. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Paddle2Scene: SKScene {
    
    var isFingerOnPaddle2 = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view) //need
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        
        let ball = childNode(withName: "ball") as? SKSpriteNode
        ball!.physicsBody!.applyImpulse(CGVector(dx: 70.0, dy: 70.0))
        
    }
    
    func touchDown(atPoint pos : CGPoint) {}
    
    func touchMoved(toPoint pos : CGPoint) {}
    
    func touchUp(atPoint pos : CGPoint) {}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //remember to set the paddles to bounding rectangles with no dynamic, unaffected by gravity with no friction
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if let body = physicsWorld.body(at: touchLocation) {
            if body.node!.name == "paddle2" {
                print("Began touch on paddle2")
                isFingerOnPaddle2 = true
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        
        if isFingerOnPaddle2 {
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            //if yes then move the paddle depending on where player touches
            let paddle2 = childNode(withName: "paddle2") as! SKSpriteNode
            
            //get spriteKit node for paddle
            let paddleX = paddle2.position.x + (touchLocation.x - previousLocation.x)
            
            //set position of paddle to new calculated point
            paddle2.position = CGPoint(x: paddleX, y: paddle2.position.y)
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        
        isFingerOnPaddle2 = false
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
