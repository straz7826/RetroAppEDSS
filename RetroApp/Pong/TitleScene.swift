//
//  GameScene.swift
//  TitleScreen2
//
//  Created by Ashley Bowman on 2017-12-15.
//  Copyright © 2017 Bowman A. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

//Ashley's. For the moving paddles in title screen. Makes sure they don't bounce off screen
//Ashley also did everything on the main story board. 
class TitleScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        }
    
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
