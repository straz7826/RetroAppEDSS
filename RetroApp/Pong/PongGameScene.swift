//
//  GameScene.swift
//  TitleScreen2
//
//  Created by Ashley Bowman on 2017-12-15.
//  Copyright © 2017 Bowman A. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation

let BallCategoryName = "ball"
let GameMessageName = "gameMessage"
let BallCategory   : UInt32 = 0x1 << 0
let BottomCategory : UInt32 = 0x1 << 2
let PaddleCategory : UInt32 = 0x1 << 3
let BorderCategory : UInt32 = 0x1 << 4
let topCategory : UInt32 = 0x1 << 5
var topLbl = SKLabelNode()
var btmLbl = SKLabelNode()

class PongGameScene: SKScene {
    
    var isFingerOnPaddle1 = false
    var isFingerOnPaddle2 = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view) //need
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        self.physicsBody = border
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        
        let ball = childNode(withName: BallCategoryName) as! SKSpriteNode

        ball.physicsBody?.categoryBitMask = BallCategory
        ball.position = CGPoint(x: 512, y: 384)
        ball.physicsBody?.applyImpulse(CGVector(dx: 15.0, dy: -15.0))
        
        //setting top and bottom
        let hopeful = CGRect(x: frame.origin.x , y: frame.origin.y , width: 1 , height: 800)
        let hopeful2 = CGRect(x: 1024 , y: frame.origin.y , width: -1 , height:800)
        let bottom = SKNode()
        let top = SKNode()
        bottom.physicsBody = SKPhysicsBody(edgeLoopFrom: hopeful)
        top.physicsBody = SKPhysicsBody(edgeLoopFrom: hopeful2)
        addChild(top)
        addChild(bottom)
        
        //bitmasks
        ball.physicsBody?.categoryBitMask = BallCategory
        bottom.physicsBody!.categoryBitMask = BottomCategory
        border.categoryBitMask = BorderCategory
        top.physicsBody!.categoryBitMask = topCategory
        ball.physicsBody?.contactTestBitMask = top.physicsBody!.collisionBitMask
        ball.physicsBody?.contactTestBitMask = bottom.physicsBody!.collisionBitMask
        
    }
    
    func touchDown(atPoint pos : CGPoint) {}
    
    func touchMoved(toPoint pos : CGPoint) {}
    
    func touchUp(atPoint pos : CGPoint) {} 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //remember to set the paddles to bounding rectangles with no dynamic, unaffected by gravity with no friction
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if let body = physicsWorld.body(at: touchLocation) {
            if body.node!.name == "paddle1" {
                print("Began touch on paddle1")
                isFingerOnPaddle1 = true
            }
            if body.node!.name == "paddle2" {
                print("Began touch on paddle2")
                isFingerOnPaddle2 = true
            }
        }
    }
    
    //contacts
    func didBegin(_ contact: SKPhysicsContact) {
        print("AHHHHHH")
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask == BallCategory {
            print("Ball is body A")
            
        }else if contact.bodyB.categoryBitMask == BallCategory{
            print("Ball is body B")
        }
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            print("First body is lowest")
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
            print("Second Body is lowest")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == PaddleCategory{
            print("Collision with paddle")
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == BottomCategory{
            print("Fault on P1, P2 ball")
            //            let ball = scene?.childNode(withName: BallCategoryName) as! SKSpriteNode
            //            didMove(to: self.view!)
            
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == topCategory{
            print("Fault on P2, P1 ball")
            //            let ball = scene?.childNode(withName: BallCategoryName) as! SKSpriteNode
            //            didMove(to: self.view!)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        
        if isFingerOnPaddle1 {
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            
            //if yes then move the paddle depending on where player touches
            let paddle1 = childNode(withName: "paddle1") as! SKSpriteNode
            
            //get spriteKit node for paddle
            let paddleX = paddle1.position.x + (touchLocation.x - previousLocation.x)
            
            
            //set position of paddle to new calculated point
            paddle1.position = CGPoint(x: paddleX, y: paddle1.position.y)
        }
        
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
        
        isFingerOnPaddle1 = false
        isFingerOnPaddle2 = false
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
