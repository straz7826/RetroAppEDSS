//
//  GameScene.swift
//  RetroApp
//
//  Created by WesleyB on 2017-12-21.
//  Copyright © 2017 ZachS. All rights reserved.
//

import Foundation
import SpriteKit
import CoreMotion


var tapQueue = [Int]()

class SpaceGameScene: SKScene, SKPhysicsContactDelegate {
    
    let kMinInvaderBottomHeight: Float = 32.0
    var gameEnding: Bool = false
    
    var score: Int = 0
    var shipHealth: Float = 1.0
    
    var contactQueue = [SKPhysicsContact]()
    
    let kInvaderCategory: UInt32 = 0x1 << 0
    let kShipFiredBulletCategory: UInt32 = 0x1 << 1
    let kShipCategory: UInt32 = 0x1 << 2
    let kSceneEdgeCategory: UInt32 = 0x1 << 3
    let kInvaderFiredBulletCategory: UInt32 = 0x1 << 4
    
    enum BulletType {
        case shipFired
        case invaderFired
    }
    
    let kShipFiredBulletName = "shipFiredBullet"
    let kInvaderFiredBulletName = "invaderFiredBullet"
    let kBulletSize = CGSize(width: 4, height: 8)
    
    // Private GameScene Properties
    
    let motionManager = CMMotionManager()
    
    var contentCreated = false
    
    // 1
    var invaderMovementDirection: InvaderMovementDirection = .right
    // 2
    var timeOfLastMove: CFTimeInterval = 0.0
    // 3
    var timePerMove: CFTimeInterval = 1.0
    
    enum InvaderType {
        case a
        case b
        case c
        
        static var size: CGSize {
            return CGSize(width: 24, height: 16)
        }
        
        static var name: String {
            return "invader"
        }
    }
    
    enum InvaderMovementDirection {
        case right
        case left
        case downThenRight
        case downThenLeft
        case none
    }
    
    let kInvaderGridSpacing = CGSize(width: 12, height: 12)
    let kInvaderRowCount = 6
    let kInvaderColCount = 6
    
    let kShipSize = CGSize(width: 30, height: 16)
    let kShipName = "ship"
    
    let kScoreHudName = "scoreHud"
    let kHealthHudName = "healthHud"
    
    // Object Lifecycle Management
    
    // Scene Setup and Content Creation
    override func didMove(to view: SKView) {
        
        if (!self.contentCreated) {
            self.createContent()
            self.contentCreated = true
            motionManager.startAccelerometerUpdates()
        }
        physicsWorld.contactDelegate = self
    }
    
    func makeBullet(ofType bulletType: BulletType) -> SKNode {
        var bullet: SKNode
        
        switch bulletType.self {
        case .shipFired:
            bullet = SKSpriteNode(color: SKColor.green, size: kBulletSize)
            bullet.name = kShipFiredBulletName
            bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.frame.size)
            bullet.physicsBody!.isDynamic = true
            bullet.physicsBody!.affectedByGravity = false
            bullet.physicsBody!.categoryBitMask = kShipFiredBulletCategory
            bullet.physicsBody!.contactTestBitMask = kInvaderCategory
            bullet.physicsBody!.collisionBitMask = 0x0
        case .invaderFired:
            bullet = SKSpriteNode(color: SKColor.magenta, size: kBulletSize)
            bullet.name = kInvaderFiredBulletName
            bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.frame.size)
            bullet.physicsBody!.isDynamic = true
            bullet.physicsBody!.affectedByGravity = false
            bullet.physicsBody!.categoryBitMask = kInvaderFiredBulletCategory
            bullet.physicsBody!.contactTestBitMask = kShipCategory
            bullet.physicsBody!.collisionBitMask = 0x0
            break
        }
        return bullet
    }
    
    
    
    func createContent() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody!.categoryBitMask = kSceneEdgeCategory
        
        setupInvaders()
        setupShip()
        setupHud()
        
        
        
        
        // black space color
        self.backgroundColor = SKColor.black
    }
    
    func loadInvaderTextures(ofType invaderType: InvaderType) -> [SKTexture] {
        
        var prefix: String
        
        switch(invaderType) {
        case .a:
            prefix = "InvaderA"
        case .b:
            prefix = "InvaderB"
        case .c:
            prefix = "InvaderC"
        }
        
        // 1
        return [SKTexture(imageNamed: String(format: "%@_00.png", prefix)),
                SKTexture(imageNamed: String(format: "%@_01.png", prefix))]
    }
    
    func makeInvader(ofType invaderType: InvaderType) -> SKNode {
        let invaderTextures = loadInvaderTextures(ofType: invaderType)
        
        // 2
        let invader = SKSpriteNode(texture: invaderTextures[0])
        invader.name = InvaderType.name
        
        // 3
        invader.run(SKAction.repeatForever(SKAction.animate(with: invaderTextures, timePerFrame: timePerMove)))
        
        // invaders' bitmasks setup
        invader.physicsBody = SKPhysicsBody(rectangleOf: invader.frame.size)
        invader.physicsBody!.isDynamic = false
        invader.physicsBody!.categoryBitMask = kInvaderCategory
        invader.physicsBody!.contactTestBitMask = 0x0
        invader.physicsBody!.collisionBitMask = 0x0
        
        return invader
    }
    
    func setupInvaders() {
        // 1
        let baseOrigin = CGPoint(x: size.width / 3, y: size.height / 2)
        
        for row in 0..<kInvaderRowCount {
            // 2
            var invaderType: InvaderType
            
            if row % 3 == 0 {
                invaderType = .a
            } else if row % 3 == 1 {
                invaderType = .b
            } else {
                invaderType = .c
            }
            
            // 3
            let invaderPositionY = CGFloat(row) * (InvaderType.size.height * 2) + baseOrigin.y
            
            var invaderPosition = CGPoint(x: baseOrigin.x, y: invaderPositionY)
            
            // 4
            for _ in 1..<kInvaderRowCount {
                // 5
                let invader = makeInvader(ofType: invaderType)
                invader.position = invaderPosition
                
                addChild(invader)
                
                invaderPosition = CGPoint(
                    x: invaderPosition.x + InvaderType.size.width + kInvaderGridSpacing.width,
                    y: invaderPositionY
                )
            }
        }
    }
    
    func setupShip() {
        // 1
        let ship = makeShip()
        
        // 2
        ship.position = CGPoint(x: size.width / 2.0, y: kShipSize.height / 2.0)
        addChild(ship)
    }
    
    func makeShip() -> SKNode {
        let ship = SKSpriteNode(imageNamed: "Ship.png")
        ship.name = kShipName
        
        // 1
        ship.physicsBody = SKPhysicsBody(rectangleOf: ship.frame.size)
        
        // 2
        ship.physicsBody!.isDynamic = true
        
        // 3
        ship.physicsBody!.affectedByGravity = false
        
        // 4
        ship.physicsBody!.mass = 0.02
        
        // 1
        
        ship.physicsBody!.categoryBitMask = kShipCategory
        // 2
        
        ship.physicsBody!.contactTestBitMask = 0x0
        // 3
        
        ship.physicsBody!.collisionBitMask = kSceneEdgeCategory
        
        return ship
    }
    
    func setupHud() {
        // 1
        let scoreLabel = SKLabelNode(fontNamed: "Courier")
        scoreLabel.name = kScoreHudName
        scoreLabel.fontSize = 25
        
        // 2
        scoreLabel.fontColor = SKColor.green
        scoreLabel.text = String(format: "Score: %04u", 0)
        
        // 3
        scoreLabel.position = CGPoint(
            x: frame.size.width / 2,
            y: size.height - (40 + scoreLabel.frame.size.height/2)
        )
        addChild(scoreLabel)
        
        // 4
        let healthLabel = SKLabelNode(fontNamed: "Courier")
        healthLabel.name = kHealthHudName
        healthLabel.fontSize = 25
        
        // 5
        healthLabel.fontColor = SKColor.red
        healthLabel.text = String(format: "Health: %.1f%%", shipHealth * 100.0)
        
        // 6
        healthLabel.position = CGPoint(
            x: frame.size.width / 2,
            y: size.height - (80 + healthLabel.frame.size.height/2)
        )
        addChild(healthLabel)
    }
    func adjustScore(by points: Int) {
        score += points
        
        if let score = childNode(withName: kScoreHudName) as? SKLabelNode {
            score.text = String(format: "Score: %04u", self.score)
        }
    }
    
    func adjustShipHealth(by healthAdjustment: Float) {
        // 1
        shipHealth = max(shipHealth + healthAdjustment, 0)
        
        if let health = childNode(withName: kHealthHudName) as? SKLabelNode {
            health.text = String(format: "Health: %.1f%%", self.shipHealth * 100)
        }
    }
    
    // Scene Update
    
    func fireInvaderBullets(forUpdate currentTime: CFTimeInterval) {
        let existingBullet = childNode(withName: kInvaderFiredBulletName)
        
        // 1
        if existingBullet == nil {
            var allInvaders = [SKNode]()
            
            // 2
            enumerateChildNodes(withName: InvaderType.name) { node, stop in
                allInvaders.append(node)
            }
            
            if allInvaders.count > 0 {
                // 3
                let allInvadersIndex = Int(arc4random_uniform(UInt32(allInvaders.count)))
                
                let invader = allInvaders[allInvadersIndex]
                
                // 4
                let bullet = makeBullet(ofType: .invaderFired)
                bullet.position = CGPoint(
                    x: invader.position.x,
                    y: invader.position.y - invader.frame.size.height / 2 + bullet.frame.size.height / 2
                )
                
                // 5
                let bulletDestination = CGPoint(x: invader.position.x, y: -(bullet.frame.size.height / 2))
                
                // 6
                fireBullet(
                    bullet: bullet,
                    toDestination: bulletDestination,
                    withDuration: 2.0,
                    andSoundFileName: "InvaderBullet.wav"
                )
            }
        }
    }
    func processContacts(forUpdate currentTime: CFTimeInterval) {
        for contact in contactQueue {
            handle(contact)
            
            if let index = contactQueue.index(of: contact) {
                contactQueue.remove(at: index)
            }
        }
    }
    
    
    func moveInvaders(forUpdate currentTime: CFTimeInterval) {
        // 1
        if (currentTime - timeOfLastMove < timePerMove) {
            return
        }
        
        determineInvaderMovementDirection()
        
        // 2
        enumerateChildNodes(withName: InvaderType.name) { node, stop in
            switch self.invaderMovementDirection {
            case .right:
                node.position = CGPoint(x: node.position.x + 10, y: node.position.y)
            case .left:
                node.position = CGPoint(x: node.position.x - 10, y: node.position.y)
            case .downThenLeft, .downThenRight:
                node.position = CGPoint(x: node.position.x, y: node.position.y - 10)
            case .none:
                break
            }
            
            // 3
            self.timeOfLastMove = currentTime
        }
    }
    
    func adjustInvaderMovement(to timePerMove: CFTimeInterval) {
        // 1
        if self.timePerMove <= 0 {
            return
        }
        
        // 2
        let ratio: CGFloat = CGFloat(self.timePerMove / timePerMove)
        self.timePerMove = timePerMove
        
        // 3
        enumerateChildNodes(withName: InvaderType.name) { node, stop in
            node.speed = node.speed * ratio
        }
    }
    
    func processUserMotion(forUpdate currentTime: CFTimeInterval) {
        // 1
        if let ship = childNode(withName: kShipName) as? SKSpriteNode {
            // 2
            if let data = motionManager.accelerometerData {
                // 3
                if fabs(data.acceleration.x) > 0.2 {
                    // 4 How do you move the ship?
                    print("Acceleration: \(data.acceleration.x)")
                    ship.physicsBody!.applyForce(CGVector(dx: 40 * CGFloat(data.acceleration.x), dy: 0))
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isGameOver() {
            endGame()
        }
        processContacts(forUpdate: currentTime)
        processUserTaps(forUpdate: currentTime)
        processUserMotion(forUpdate: currentTime)
        moveInvaders(forUpdate: currentTime)
        fireInvaderBullets(forUpdate: currentTime)
    }
    
    
    // Scene Update Helpers
    
    func processUserTaps(forUpdate currentTime: CFTimeInterval) {
        // 1
        for tapCount in tapQueue {
            if tapCount == 1 {
                // 2
                fireShipBullets()
            }
            // 3
            tapQueue.remove(at: 0)
        }
    }
    
    
    
    
    // Invader Movement Helpers
    
    func determineInvaderMovementDirection() {
        // 1
        var proposedMovementDirection: InvaderMovementDirection = invaderMovementDirection
        
        // 2
        enumerateChildNodes(withName: InvaderType.name) { node, stop in
            
            switch self.invaderMovementDirection {
            case .right:
                //3
                if (node.frame.maxX >= node.scene!.size.width - 1.0) {
                    proposedMovementDirection = .downThenLeft
                    
                    self.adjustInvaderMovement(to: self.timePerMove * 0.8)
                    
                    stop.pointee = true
                }
            case .left:
                //4
                if (node.frame.minX <= 1.0) {
                    proposedMovementDirection = .downThenRight
                    
                    self.adjustInvaderMovement(to: self.timePerMove * 0.8)
                    
                    stop.pointee = true
                }
                
            case .downThenLeft:
                proposedMovementDirection = .left
                
                stop.pointee = true
                
            case .downThenRight:
                proposedMovementDirection = .right
                
                stop.pointee = true
                
            default:
                break
            }
            
        }
        
        //7
        if (proposedMovementDirection != invaderMovementDirection) {
            invaderMovementDirection = proposedMovementDirection
        }
    }
    
    // Bullet Helpers
    
    func fireBullet(bullet: SKNode, toDestination destination: CGPoint, withDuration duration: CFTimeInterval, andSoundFileName soundName: String) {
        // 1
        let bulletAction = SKAction.sequence([
            SKAction.move(to: destination, duration: duration),
            SKAction.wait(forDuration: 3.0 / 60.0),
            SKAction.removeFromParent()
            ])
        
        // 2
        let soundAction = SKAction.playSoundFileNamed(soundName, waitForCompletion: true)
        
        // 3
        bullet.run(SKAction.group([bulletAction, soundAction]))
        
        // 4
        addChild(bullet)
    }
    
    func fireShipBullets() {
        let existingBullet = childNode(withName: kShipFiredBulletName)
        
        // 1
        if existingBullet == nil {
            if let ship = childNode(withName: kShipName) {
                let bullet = makeBullet(ofType: .shipFired)
                // 2
                bullet.position = CGPoint(
                    x: ship.position.x,
                    y: ship.position.y + ship.frame.size.height - bullet.frame.size.height / 2
                )
                // 3
                let bulletDestination = CGPoint(
                    x: ship.position.x,
                    y: frame.size.height + bullet.frame.size.height / 2
                )
                // 4
                fireBullet(
                    bullet: bullet,
                    toDestination: bulletDestination,
                    withDuration: 1.0,
                    andSoundFileName: "ShipBullet.wav"
                )
            }
        }
    }
    
    
    
    
    // User Tap Helpers
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if (touch.tapCount == 1) {
                tapQueue.append(1)
            }
        }
    }
    
    // HUD Helpers
    
    // Physics Contact Helpers
    
    func didBegin(_ contact: SKPhysicsContact) {
        contactQueue.append(contact)
    }
    
    func handle(_ contact: SKPhysicsContact) {
        // Ensure you haven't already handled this contact and removed its nodes
        if contact.bodyA.node?.parent == nil || contact.bodyB.node?.parent == nil {
            return
        }
        
        let nodeNames = [contact.bodyA.node!.name!, contact.bodyB.node!.name!]
        
        if nodeNames.contains(kShipName) && nodeNames.contains(kInvaderFiredBulletName) {
            // Invader bullet hit a ship
            run(SKAction.playSoundFileNamed("ShipHit.wav", waitForCompletion: false))
            
            // 1
            adjustShipHealth(by: -0.334)
            
            if shipHealth <= 0.0 {
                // 2
                contact.bodyA.node!.removeFromParent()
                contact.bodyB.node!.removeFromParent()
            } else {
                // 3
                if let ship = childNode(withName: kShipName) {
                    ship.alpha = CGFloat(shipHealth)
                    
                    if contact.bodyA.node == ship {
                        contact.bodyB.node!.removeFromParent()
                        
                    } else {
                        contact.bodyA.node!.removeFromParent()
                    }
                }
            }
            
        } else if nodeNames.contains(InvaderType.name) && nodeNames.contains(kShipFiredBulletName) {
            // Ship bullet hit an invader
            run(SKAction.playSoundFileNamed("InvaderHit.wav", waitForCompletion: false))
            contact.bodyA.node!.removeFromParent()
            contact.bodyB.node!.removeFromParent()
            
            // 4
            adjustScore(by: 100)
        }
    }
    
    func isGameOver() -> Bool {
        // 1
        let invader = childNode(withName: InvaderType.name)
        
        // 2
        var invaderTooLow = false
        
        enumerateChildNodes(withName: InvaderType.name) { node, stop in
            
            if (Float(node.frame.minY) <= self.kMinInvaderBottomHeight)   {
                invaderTooLow = true
                stop.pointee = true
            }
        }
        
        // 3
        let ship = childNode(withName: kShipName)
        
        // 4
        return invader == nil || invaderTooLow || ship == nil
    }
    
    func endGame() {
        // 1
        if !gameEnding {
            
            gameEnding = true
            
            // 2
            motionManager.stopAccelerometerUpdates()
            
            // 3
            let gameOverScene: GameOverScene = GameOverScene(size: size)
            
            view?.presentScene(gameOverScene, transition: SKTransition.doorsOpenHorizontal(withDuration: 1.0))
        }
    }
    // Game End Helpers
    
}
