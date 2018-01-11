//
//  GameScene.swift
//  Test Gauntlet
//
//  Created by Corinne H on 2017-11-24.
//  Copyright © 2017 NFB. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

class GauntletGameScene: SKScene, SKPhysicsContactDelegate {
    
    // Label Variables
    let title = SKLabelNode()
    var score = SKLabelNode()
    var exitText = SKLabelNode()
    var healthText = SKLabelNode()
    
    // Sprite Node Variables
    var player =  SKSpriteNode()
    var ghost1 = SKSpriteNode()
    var ghost2 = SKSpriteNode()
    var ghost3 = SKSpriteNode()
    var ghost4 = SKSpriteNode()
    var ghost5 = SKSpriteNode()

    var exit = SKSpriteNode()
    var food = SKSpriteNode()
    var treasure = SKSpriteNode()
    var key1 = SKSpriteNode()
    var key2 = SKSpriteNode()
    var door1 = SKSpriteNode()
    var door2 = SKSpriteNode()
    
    var leftArrow = SKSpriteNode()
    var rightArrow = SKSpriteNode()
    var upArrow = SKSpriteNode()
    var downArrow = SKSpriteNode()
    var fireButton = SKSpriteNode()
    var fireText = SKSpriteNode()
    var projectileNode = SKSpriteNode()
    
    // Sound Effects
    var collectItem: AVAudioPlayer?
    var shootFood: AVAudioPlayer?
    var contactExit: AVAudioPlayer?
    var characterHurt: AVAudioPlayer?
    var characterDies: AVAudioPlayer?
    var projectileShoot: AVAudioPlayer?
    var projectileHit: AVAudioPlayer?
    
    // Directional Variables
    var orientation = CGFloat(Double.pi/2)
    var directionx = CGFloat(0)
    var directiony = CGFloat(1)
    var contactQueue = [SKPhysicsContact]()
    
    // Bit Masks
    let playerCategory: UInt32 = 0x1 << 0
    let projectileCategory: UInt32 = 0x1 << 1
    let enemyCategory: UInt32 = 0x1 << 2
    let itemCategory: UInt32 = 0x1 << 3
    let usedItemCategory: UInt32 = 0x1 << 4
    let doorCategory: UInt32 = 0x1 << 5
    
    
    // Overridden Functions
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        //Sound Effects
//        let itemPath = Bundle.main.path(forResource: "CollectKey.mp3", ofType: nil)!
//        let itemUrl = URL(fileURLWithPath: itemPath)
//        do {
//            collectItem = try AVAudioPlayer(contentsOf: itemUrl)
//        } catch {
//            print("did not work")
//        }
//
//        let foodPath = Bundle.main.path(forResource: "Don'tShootFood.mp3", ofType:nil)!
//        let foodUrl = URL(fileURLWithPath: foodPath)
//        do {
//            shootFood = try AVAudioPlayer(contentsOf: foodUrl)
//        } catch {
//            print("did not work")
//        }
//
//        let exitPath = Bundle.main.path(forResource: "ContactExit.mp3", ofType:nil)!
//        let exitUrl = URL(fileURLWithPath: exitPath)
//        do {
//            contactExit = try AVAudioPlayer(contentsOf: exitUrl)
//        } catch {
//            print("did not work")
//        }
//
//        let hurtPath = Bundle.main.path(forResource: "CharacterHurt.mp3", ofType:nil)!
//        let hurtUrl = URL(fileURLWithPath: hurtPath)
//        do {
//            characterHurt = try AVAudioPlayer(contentsOf: hurtUrl)
//        } catch {
//            print("did not work")
//        }
//
//        let diePath = Bundle.main.path(forResource: "CharacterDies.mp3", ofType:nil)!
//        let dieUrl = URL(fileURLWithPath: diePath)
//        do {
//            characterDies = try AVAudioPlayer(contentsOf: dieUrl)
//        } catch {
//            print("did not work")
//        }
//        let shootPath = Bundle.main.path(forResource: "ArrowShoot.wav", ofType:nil)!
//        let shootUrl = URL(fileURLWithPath: shootPath)
//        do {
//            projectileShoot = try AVAudioPlayer(contentsOf: shootUrl)
//        } catch {
//            print("did not work")
//        }
//        let hitGhostPath = Bundle.main.path(forResource: "ArrowHit.wav", ofType:nil)!
//        let hitGhostUrl = URL(fileURLWithPath: hitGhostPath)
//        do {
//            projectileHit = try AVAudioPlayer(contentsOf: hitGhostUrl)
//        } catch {
//            print("did not work")
//        }
        
        //Title - "Gauntlet"
        title.text = "Gauntlet"
        title.fontColor = SKColor.white
        title.fontSize = 60
        title.position = CGPoint(x:220, y: -330)
        title.zPosition = 100
        self.addChild(title)
        
        //Score
        score.text = "Score: \(scoreValue)"
        score.fontColor = SKColor.white
        score.fontName = "Futura"
        score.fontSize = 60
        score.position = CGPoint(x:220, y: -450)
        score.zPosition = 100
        self.addChild(score)
        
        // Health Text
        healthText.text = "Health: \(health)"
        healthText.fontColor = SKColor.white
        healthText.fontName = "Futura"
        healthText.fontSize = 60
        healthText.position = CGPoint(x:220, y: -400)
        healthText.zPosition = 100
        self.addChild(healthText)
        
        //Exit Text
        exitText.text = "EXIT"
        exitText.fontColor = SKColor.white
        exitText.fontName = "Futura"
        exitText.fontSize = 20
        exitText.position = CGPoint(x: 330, y: -253)
        exitText.zPosition = 100
        self.addChild(exitText)
        
        //Player
        switch selectedPlayer {
        case "elf":
            player = createSN(image: "Elf", name: "character", position: CGPoint(x:-330, y:-260), isDynamic: true)
        case "warrior":
            player = createSN(image: "Warrior", name: "character", position: CGPoint(x:-330, y:-260), isDynamic: true)
        case "wizard":
            player = createSN(image: "Wizard", name: "character", position: CGPoint(x:-330, y:-260), isDynamic: true)
        case "valkyrie":
            player = createSN(image: "Valkyrie", name: "character", position: CGPoint(x:-330, y:-260), isDynamic: true)
        default:
            player = createSN(image: "Elf", name: "character", position: CGPoint(x:-330, y:-260), isDynamic: true)
        }
        player.physicsBody?.usesPreciseCollisionDetection = true
        player.physicsBody?.categoryBitMask = playerCategory
        player.physicsBody?.collisionBitMask = itemCategory | enemyCategory | doorCategory
        player.physicsBody?.contactTestBitMask = itemCategory | enemyCategory | doorCategory
        self.addChild(player)
        
        //Monster - Ghost
        ghost1 = createGhost(name: "ghost1", position: CGPoint(x: -320, y: -50))
        ghost1.zRotation = CGFloat(Double.pi)
        self.addChild(ghost1)
        
        ghost2 = createGhost(name: "ghost2", position: CGPoint(x: 330, y: -90))
        self.addChild(ghost2)
        
        ghost3 = createGhost(name: "ghost3", position: CGPoint(x: 150, y: 430))
        ghost3.zRotation = CGFloat(Double.pi/2)
        self.addChild(ghost3)
        
        ghost4 = createGhost(name: "ghost4", position: CGPoint(x: -125, y: 160))
        ghost4.zRotation = CGFloat(Double.pi/2)
        self.addChild(ghost4)
        
        ghost5 = createGhost(name: "ghost5", position: CGPoint(x: 190, y: -245))
        ghost5.zRotation = CGFloat(Double.pi/2)
        self.addChild(ghost5)

        
        //Exit
        exit = createSN (image: "Exit", name: "exit", position: CGPoint(x: 330, y: -245), isDynamic: false)
        exit.physicsBody?.usesPreciseCollisionDetection = true
        exit.physicsBody?.categoryBitMask = itemCategory
        self.addChild(exit)
        
        //Food#1
        food = createSN (image: "Food1", name: "food", position: CGPoint(x: -125, y: 0), isDynamic: false)
        food.physicsBody?.usesPreciseCollisionDetection = true
        food.physicsBody?.categoryBitMask = itemCategory
        self.addChild(food)
        
        //Treasure
        treasure = createSN (image: "Treasure", name: "treasure", position: CGPoint(x: 320, y: 430), isDynamic: false)
        treasure.physicsBody?.usesPreciseCollisionDetection = true
        treasure.physicsBody?.categoryBitMask = itemCategory
        self.addChild(treasure)
        
        //Key
        key1 = createSN (image: "Key", name: "key1", position: CGPoint(x: -320, y: 430), isDynamic: false)
        key1.physicsBody?.usesPreciseCollisionDetection = true
        key1.physicsBody?.categoryBitMask = itemCategory
        self.addChild(key1)
        
        key2 = createSN (image: "Key", name: "key2", position: CGPoint(x: -50, y: -140), isDynamic: false)
        key2.physicsBody?.usesPreciseCollisionDetection = true
        key2.physicsBody?.categoryBitMask = itemCategory
        self.addChild(key2)
        
        //Door
        door1 = createSN(image: "Exit", name: "door1", position: CGPoint(x: 38, y: 370), isDynamic: false)
        door1.physicsBody?.usesPreciseCollisionDetection = true
        door1.physicsBody?.categoryBitMask = doorCategory
        self.addChild(door1)
        
        door2 = createSN(image: "Exit", name: "door2", position: CGPoint(x: 100, y: -183), isDynamic: false)
        door2.physicsBody?.usesPreciseCollisionDetection = true
        door2.physicsBody?.categoryBitMask = doorCategory
        self.addChild(door2)
        
        //Left control arrow
        leftArrow = SKSpriteNode(imageNamed: "LeftArrow")
        leftArrow.name = "leftControlArrow"
        leftArrow.size = CGSize (width: 100, height: 100)
        leftArrow.anchorPoint = CGPoint(x:0.5, y:0)
        leftArrow.position = CGPoint (x: -320, y: -440)
        self.addChild(leftArrow)
        
        //Right control arrow
        rightArrow = SKSpriteNode(imageNamed: "RightArrow")
        rightArrow.name = "rightControlArrow"
        rightArrow.size = CGSize (width: 100, height: 100)
        rightArrow.anchorPoint = CGPoint (x: 0.5, y: 0)
        rightArrow.position = CGPoint (x: -120, y: -440)
        self.addChild(rightArrow)
        
        //Up control arrow
        upArrow = SKSpriteNode(imageNamed: "UpArrow")
        upArrow.name = "upControlArrow"
        upArrow.size = CGSize (width: 100, height: 100)
        upArrow.anchorPoint = CGPoint (x: 0.5, y: 0)
        upArrow.position = CGPoint (x: -220, y: -380)
        self.addChild(upArrow)
        
        //Down control arrow
        downArrow = SKSpriteNode(imageNamed: "DownArrow")
        downArrow.name = "downControlArrow"
        downArrow.size = CGSize (width: 100, height: 100)
        downArrow.anchorPoint = CGPoint (x: 0.5, y: 0)
        downArrow.position = CGPoint (x: -220, y: -500)
        self.addChild(downArrow)
        
        //Fire button
        fireButton = SKSpriteNode(imageNamed: "dot")
        fireButton.name = "fireControl"
        fireButton.size = CGSize (width: 100, height: 100)
        fireButton.anchorPoint = CGPoint (x: 0.5, y: 0)
        fireButton.position = CGPoint (x: 0, y: -470)
        fireButton.zPosition = 10
        self.addChild(fireButton)
        
        fireText = SKSpriteNode(imageNamed: "fireText")
        fireText.size = CGSize (width: 150, height: 150)
        fireText.anchorPoint = CGPoint (x: 0.5, y: 0)
        fireText.position = CGPoint (x: 0, y: -470)
        fireText.zPosition = 9
        self.addChild(fireText)
    }
    
    
    
    //Arrow move controls and fire button
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            if rightArrow.contains(positionInScene) {
                let moveRight:SKAction = SKAction.moveBy(x: 50, y: 0, duration: 0.2)
                let loop:SKAction = SKAction.repeatForever(moveRight)
                player.run(loop)
                if player.zRotation != CGFloat(-Double.pi/2) {
                    player.zRotation = CGFloat(-Double.pi/2)
                    orientation = CGFloat(0)
                    directionx = 1
                    directiony = 0
                }
            }
            if leftArrow.contains(positionInScene) {
                
                let moveLeft:SKAction = SKAction.moveBy(x: -50, y: 0, duration: 0.2)
                let loop:SKAction = SKAction.repeatForever(moveLeft)
                player.run(loop)
                if player.zRotation != CGFloat(Double.pi/2) {
                    player.zRotation = CGFloat(Double.pi/2)
                    orientation = CGFloat(Double.pi)
                    directionx = -1
                    directiony = 0
                }
            }
            if upArrow.contains(positionInScene) {
                let moveUp:SKAction = SKAction.moveBy(x: 0, y: 50, duration: 0.2)
                let loop:SKAction = SKAction.repeatForever(moveUp)
                player.run(loop)
                if player.zRotation != CGFloat(0) {
                    player.zRotation = CGFloat(0)
                    orientation = CGFloat(Double.pi/2)
                    directionx = 0
                    directiony = 1
                }
            }
            if downArrow.contains(positionInScene) {
                let moveDown:SKAction = SKAction.moveBy(x: 0, y: -50, duration: 0.2)
                let loop:SKAction = SKAction.repeatForever(moveDown)
                player.run(loop)
                if player.zRotation != CGFloat(Double.pi) {
                    player.zRotation = CGFloat(Double.pi)
                    orientation = CGFloat(-Double.pi/2)
                    directionx = 0
                    directiony = -1
                }
            }
            if fireButton.contains(positionInScene){
                if let archerNode = self.childNode(withName: "character"){
                    print ("Shoot")
                    let shootArrow = SKAction.run({
                        self.projectileNode = self.createProjectileNode()
                        self.addChild(self.projectileNode)
                        self.projectileNode.physicsBody?.applyImpulse(CGVector(dx: self.directionx * 30, dy: self.directiony * 30))
                    })
                    archerNode.run(shootArrow)
                    projectileShoot?.play()
                }
            }
        }
    }
    
    //End arrow movement
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            if rightArrow.contains(positionInScene) {
                player.removeAllActions()
            }
            if leftArrow.contains(positionInScene) {
                player.removeAllActions()
            }
            if upArrow.contains(positionInScene) {
                player.removeAllActions()
            }
            if downArrow.contains(positionInScene) {
                player.removeAllActions()
            }
        }
    }
    
    //Contact detection
    func didBegin(_ contact: SKPhysicsContact){
        contactQueue.append(contact)
        let firstNode = contact.bodyA.node as! SKSpriteNode
        let secondNode = contact.bodyB.node as! SKSpriteNode
        var firstBody : SKPhysicsBody
        var secondBody : SKPhysicsBody
        
        if (contact.bodyA.categoryBitMask == playerCategory) && (contact.bodyB.categoryBitMask == itemCategory){
            if secondNode == exit {
                player.removeFromParent()
                exit.physicsBody?.categoryBitMask = usedItemCategory
                scoreValue += seconds
                scoreValue += health
                score.text = "Score: \(scoreValue)"
                didWin = true
                winTime -= seconds
                seconds = 1
                contactExit?.play()
            }
                if secondNode == food {
                    scoreValue = scoreValue + 15
                    if health < 5 {
                        health += 1
                        healthText.text = "Health: \(health)"
                    }
                    food.removeFromParent()
                    food.physicsBody?.categoryBitMask = usedItemCategory
                }
                if secondNode == treasure {
                    scoreValue = scoreValue + 150
                    treasure.removeFromParent()
                    treasure.physicsBody?.categoryBitMask = usedItemCategory
                }
                if secondNode == key1{
                    scoreValue = scoreValue + 100
                    key1.removeFromParent()
                    key1.physicsBody?.categoryBitMask = usedItemCategory
                    hasKey = true
                }
                if secondNode == key2{
                    scoreValue = scoreValue + 100
                    key2.removeFromParent()
                    key2.physicsBody?.categoryBitMask = usedItemCategory
                    hasKey = true
                }
                collectItem?.play()
        }
        
        if (contact.bodyA.categoryBitMask == playerCategory) && (contact.bodyB.categoryBitMask == enemyCategory) {
            health -= 1
            healthText.text = "Health: \(health)"
            secondNode.physicsBody?.categoryBitMask = usedItemCategory
            secondNode.removeFromParent()
            characterHurt?.play()
            if health <= 0 {
                seconds = 1
                characterDies?.play()
                player.removeFromParent()
            }
        }
        
        if (contact.bodyA.categoryBitMask == projectileCategory) && (contact.bodyB.categoryBitMask == itemCategory) {
            if secondNode == food || secondNode == treasure{
                firstNode.removeFromParent()
                secondNode.removeFromParent()
                shootFood?.play()
            } else if secondNode == exit {
                projectileNode.removeFromParent()
            }
        }
        
        //test stuff
        if contact.bodyA.categoryBitMask == projectileCategory {
            print ("Projectile is body a")
        } else if contact.bodyB.categoryBitMask == projectileCategory {
            print ("Projectile is body b")
        }
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        //if firstBody.cBM == projectile &&
        if (firstBody.categoryBitMask == projectileCategory) && (secondBody.categoryBitMask == enemyCategory){
            scoreValue += 50
            projectileHit?.play()
            firstNode.removeFromParent()
            secondNode.removeFromParent()
            projectileNode.physicsBody?.categoryBitMask = usedItemCategory
        }
        
        //wallCategory
        if (firstBody.categoryBitMask == projectileCategory) && (secondBody.categoryBitMask == 6){
            projectileHit?.play()
            secondNode.removeFromParent()
            projectileNode.physicsBody?.categoryBitMask = usedItemCategory
        }
    
        // touch door
        if (contact.bodyA.categoryBitMask == playerCategory) && (contact.bodyB.categoryBitMask == doorCategory) {
            if hasKey {
                secondNode.removeFromParent()
                hasKey = false
            }
        }
        score.text = "Score: \(scoreValue)"
    }
    
    //Contact Ends
    func didEnd(_ contact: SKPhysicsContact) {
    }
    
    func createProjectileNode() -> SKSpriteNode {
        let archerNode = self.childNode(withName: "character")
        let archerPosition = archerNode?.position
        let archerWidth = archerNode?.frame.size.width
        let archerHeight = archerNode?.frame.size.height
        var projectile = SKSpriteNode()
        
        switch selectedPlayer {
        case "elf":
            projectile = SKSpriteNode(imageNamed: "Arrow")
        case "warrior":
            projectile = SKSpriteNode(imageNamed: "Axe")
        case "wizard":
            projectile = SKSpriteNode(imageNamed: "Fireball")
        case "valkyrie":
            projectile = SKSpriteNode(imageNamed: "Sword")
        default:
            projectile = SKSpriteNode(imageNamed: "Arrow")
        }
        
        projectile.position = CGPoint(x: archerPosition!.x + directionx * archerWidth!, y: archerPosition!.y + directiony*archerHeight!)
        projectile.size = CGSize(width: 40, height: 30)
        projectile.zRotation = CGFloat(orientation)
        
        projectile.name = "projectileNode"
        projectile.physicsBody = SKPhysicsBody(rectangleOf: projectile.frame.size)
        
        if let physics = projectile.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = false
            physics.isDynamic = true
            physics.linearDamping = 0
            physics.angularDamping = 0
            physics.restitution = 0
        }
        projectile.physicsBody?.usesPreciseCollisionDetection = true
        projectile.physicsBody?.categoryBitMask = projectileCategory
        projectile.physicsBody?.collisionBitMask = enemyCategory | itemCategory
        projectile.physicsBody?.contactTestBitMask = enemyCategory | itemCategory
        return projectile
    }
    
    func createSN(image: String, name: String, position: CGPoint, isDynamic: Bool) -> SKSpriteNode {
        let node = SKSpriteNode(imageNamed: image)
        node.name = name
        node.size = CGSize (width: 50, height: 50) //Always the same
        node.anchorPoint = CGPoint (x: 0.5, y:0.5) //Always the same
        node.position = position
        node.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: image), size: node.size)
        if isDynamic {
            if let physics = node.physicsBody {
                physics.affectedByGravity = false
                physics.allowsRotation = false
                physics.isDynamic = true
                physics.linearDamping = 1
                physics.angularDamping = 1
            }
            
        }
        else {
            if let physics = node.physicsBody {
                physics.affectedByGravity = false
                physics.allowsRotation = false
                physics.isDynamic = false
                physics.linearDamping = 1
                physics.angularDamping = 1
            }
        }
        return node
    }
    func createGhost(name: String, position: CGPoint) -> SKSpriteNode {
        let node = createSN(image: "Ghost", name: name, position: position, isDynamic: false)
        node.physicsBody?.restitution = 0
        node.physicsBody?.usesPreciseCollisionDetection = true
        node.physicsBody?.categoryBitMask = enemyCategory
        node.physicsBody?.collisionBitMask = projectileCategory
        node.physicsBody?.contactTestBitMask = projectileCategory
        
        return node
    }

}
