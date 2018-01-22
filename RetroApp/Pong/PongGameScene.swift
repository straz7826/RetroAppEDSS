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
let standard = CGPoint(x: 0, y: 0)
let timetowait:TimeInterval = 2.0
var topScore = 0
//var bottomScore = 1
var label1 = -1
var label2 = 0
var label4 = 0
var label3 = "You Win!"
var next2 = "Game Over"
var next23 = "Game Over"

class PongGameScene: SKScene, SKPhysicsContactDelegate {
     let moveBall = SKAction.move(to: standard, duration: 0.0) //Palmer's action
    //ashley's variables
    var isFingerOnPaddle1 = false
    var isFingerOnPaddle2 = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view) //need
    //Devin Code Starts
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        self.physicsBody = border
        // Devin Code End
        //Palmer Code start
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        physicsWorld.contactDelegate = self
        let ball = childNode(withName: BallCategoryName) as! SKSpriteNode

        ball.physicsBody?.categoryBitMask = BallCategory
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.applyImpulse(CGVector(dx: 50.0, dy: -50.0))
        
        //setting top and bottom
        let hopeful = CGRect(x: -400 , y: 480 , width: 800 , height: -1)
        let hopeful2 = CGRect(x: -400 , y: -480 , width: 800 , height: 1)
        let bottom = SKNode()
        let top = SKNode()
        //hopeful.
        bottom.physicsBody = SKPhysicsBody(edgeLoopFrom: hopeful2)
        top.physicsBody = SKPhysicsBody(edgeLoopFrom: hopeful)
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
    //Palmer Code Ends
    func touchDown(atPoint pos : CGPoint) {}
    
    func touchMoved(toPoint pos : CGPoint) {}
    
    func touchUp(atPoint pos : CGPoint) {} 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //remember to set the paddles to bounding rectangles with no dynamic, unaffected by gravity with no friction
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        //Ashley's code to recognize when the paddles are touched
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
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
      //ashley's. Makes paddles move
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
    
   
    //contacts
    //Palmer Starts
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
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == BottomCategory{
            print("Fault on P1, P2 ball")
             scene!.childNode(withName: BallCategoryName)?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            scene!.childNode(withName: BallCategoryName)?.run(moveBall)
            //Palmer Ends
            // Devin Code Start
            label1 += 1
            let waitaction = SKAction.wait(forDuration:timetowait)
            let topLbl = SKLabelNode(fontNamed: "Helvetica")
            topLbl.text = String(label1)
            topLbl.fontSize = 65
            topLbl.fontColor = SKColor.white
            topLbl.position = CGPoint(x: frame.midX + 100, y: frame.midY + 200)
            addChild(topLbl)
            let removeNodeAction = SKAction.removeFromParent()
            let addAndRemove = SKAction.sequence([waitaction, removeNodeAction])
            topLbl.run(addAndRemove)
            
            if label1 >= 7 {
                topLbl.text = String(label3)
                let newlabel = SKLabelNode(fontNamed: "Helvatica")
                newlabel.text = String(next2)
                newlabel.fontSize = 100
                newlabel.fontColor = SKColor.white
                newlabel.position = CGPoint(x: frame.midX, y: frame.midY)
                addChild(newlabel)
            }
           
            scene!.childNode(withName: BallCategoryName)?.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20)) //Palmer's
        }
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == topCategory{
            print("Fault on P2, P1 ball")
            label2 += 1
            let waitaction = SKAction.wait(forDuration:timetowait)
            let btmLbl = SKLabelNode(fontNamed: "Helvetica")
            btmLbl.text = String(label2)
            btmLbl.fontSize = 65
            btmLbl.fontColor = SKColor.white
            btmLbl.position = CGPoint(x: frame.midX - 100, y: frame.midY - 200)
            addChild(btmLbl)
            let removeNodeAction = SKAction.removeFromParent()
            let addAndRemove = SKAction.sequence([waitaction, removeNodeAction])
                btmLbl.run(addAndRemove)
            
            if label2 >= 7 {
        btmLbl.text = String(label3)
        let newlabel2 = SKLabelNode(fontNamed: "Helvatica")
        newlabel2.text = String(next23)
        newlabel2.fontSize = 100
        newlabel2.fontColor = SKColor.white
        newlabel2.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(newlabel2)
          // Devin Code End
            }
            //Palmer's
            scene!.childNode(withName: BallCategoryName)?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            scene!.childNode(withName: BallCategoryName)?.run(moveBall)
            
        
            scene!.childNode(withName: BallCategoryName)?.physicsBody?.applyImpulse(CGVector(dx: 20, dy: -20))
    } //Palmer's end
    
        func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        //Ashley's stops movement of paddles
        isFingerOnPaddle1 = false
        isFingerOnPaddle2 = false
        
    }
    
        func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
        func update(_ currentTime: TimeInterval) {
         //Called before each frame is rendered
    }
}
}
