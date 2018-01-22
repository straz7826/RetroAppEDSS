//
//  GauntletGameScene.swift - Everyone
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
    var scoreText = SKLabelNode()
    
    // Sprite Node Variables
    var player =  SKSpriteNode()
    var ghost0 = SKSpriteNode()
    var ghost1 = SKSpriteNode()
    var ghost2 = SKSpriteNode()
    var ghost3 = SKSpriteNode()
    var ghost4 = SKSpriteNode()
    
    var exit = SKSpriteNode()
    var food = SKSpriteNode()
    var treasure = SKSpriteNode()
    var key1 = SKSpriteNode()
    var key2 = SKSpriteNode()
    var door1 = SKSpriteNode()
    var door2 = SKSpriteNode()
    var endingAnimation = SKSpriteNode()
    var projectileNode = SKSpriteNode()
    
    // Controls
    var leftArrow = SKSpriteNode()
    var rightArrow = SKSpriteNode()
    var upArrow = SKSpriteNode()
    var downArrow = SKSpriteNode()
    var fireButton = SKSpriteNode()
    var fireText = SKSpriteNode()
    
    // Sound Effects - MC and CH
    var collectItem: AVAudioPlayer?
    var shootFood: AVAudioPlayer?
    var contactExit: AVAudioPlayer?
    var characterHurt: AVAudioPlayer?
    var characterDies: AVAudioPlayer?
    var projectileShoot: AVAudioPlayer?
    var projectileHit: AVAudioPlayer?
    var openDoor: AVAudioPlayer?
    
    // Directional Variables
    var orientation = CGFloat(Double.pi/2)
    var directionx = CGFloat(0)
    var directiony = CGFloat(1)
    var contactQueue = [SKPhysicsContact]()
    
    // Bit Masks - MC
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
        
        //Sound Effects - MC and CH
        //Initializes sounds effects
//        let itemPath = Bundle.main.path(forResource: "CollectKey.mp3", ofType:nil)!
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
//        let openDoorPath = Bundle.main.path(forResource: "Open a Door.mp3", ofType:nil)!
//        let openDoorUrl = URL(fileURLWithPath: openDoorPath)
//        do {
//            openDoor = try AVAudioPlayer(contentsOf: openDoorUrl)
//        } catch {
//            print("did not work")
//        }
        
        //SKSpriteNode Labels - AC
        
        //Score
        //Displays the current total score
        score.text = "Score: \(scoreValue)"
        score.fontColor = SKColor.white
        score.fontName = "Futura"
        score.fontSize = 60
        score.position = CGPoint(x: 360, y: -544)
        score.zPosition = 100
        self.addChild(score)
        
        // Health Text
        //Displays the current health value
        healthText.text = "Health: \(health)"
        healthText.fontColor = SKColor.white
        healthText.fontName = "Futura"
        healthText.fontSize = 60
        healthText.position = CGPoint(x: 360, y: -450)
        healthText.zPosition = 100
        self.addChild(healthText)
        
        //Exit Text
        //Label the exit
        exitText.text = "EXIT"
        exitText.fontColor = SKColor.white
        exitText.fontName = "Futura"
        exitText.fontSize = 20
        exitText.position = CGPoint(x: 446, y: -288)
        exitText.zPosition = 100
        self.addChild(exitText)
        
        //Score text
        //Displays the score given for collecting stuff and killing ghosts
        scoreText.text = "0"
        scoreText.fontColor = SKColor.white
        scoreText.fontName = "Futura"
        scoreText.fontSize = 20
        scoreText.position = CGPoint(x: 330, y: -253)
        scoreText.zPosition = 100
        
        //SKSpriteNodes Characters - AC, MC and CH
        
        //Player - MC
        //Switch that uses the selectedPlayer variable to create an SKSpriteNode with the correct image
        switch selectedPlayer {
        case "elf":
            player = createSN(image: "Elf", name: "character", position: CGPoint(x:-447, y:-288), isDynamic: true)
            endingAnimation = createSN(image: "Elf", name: "end", position: CGPoint(x: 446, y: -288), isDynamic: false)
        case "warrior":
            player = createSN(image: "Warrior", name: "character", position: CGPoint(x:-447, y:-288), isDynamic: true)
            endingAnimation = createSN(image: "Warrior", name: "end", position: CGPoint(x: 446, y: -288), isDynamic: false)
        case "wizard":
            player = createSN(image: "Wizard", name: "character", position: CGPoint(x:-447, y:-288), isDynamic: true)
            endingAnimation = createSN(image: "Wizard", name: "end", position: CGPoint(x: 446, y: -288), isDynamic: false)
        case "valkyrie":
            player = createSN(image: "Valkyrie", name: "character", position: CGPoint(x:-447, y:-288), isDynamic: true)
            endingAnimation = createSN(image: "Valkyrie", name: "end", position: CGPoint(x: 446, y: -288), isDynamic: false)
        default:
            player = createSN(image: "Elf", name: "character", position: CGPoint(x:-447, y:-288), isDynamic: true)
            endingAnimation = createSN(image: "Elf", name: "end", position: CGPoint(x: 446, y: -288), isDynamic: false)
        }
        player.physicsBody?.usesPreciseCollisionDetection = true
        player.physicsBody?.categoryBitMask = playerCategory
        player.physicsBody?.collisionBitMask = itemCategory | enemyCategory | doorCategory
        player.physicsBody?.contactTestBitMask = itemCategory | enemyCategory | doorCategory
        self.addChild(player)
        //endingAnimation.zPosition = 101
        
        //Ghosts - CH
        //Initializes fives unique ghosts and animated them
        ghost0 = createGhost(name: "ghost0", position: CGPoint(x: -447, y: 440))
        self.addChild(ghost0)
        let moveGhostVertical:SKAction = SKAction.moveBy(x: 0, y: -620, duration: 4)
        let rotateGhost = SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 0)
        let moveGhostVerticalSequence = SKAction.repeatForever(SKAction.sequence([rotateGhost, moveGhostVertical, rotateGhost, moveGhostVertical.reversed()]))
        ghost0.run(moveGhostVerticalSequence)
        
        ghost1 = createGhost(name: "ghost1", position: CGPoint(x: -191, y: 288))
        ghost1.zRotation = CGFloat(3*Double.pi/2)
        self.addChild(ghost1)
        let moveGhostHorizontalShort:SKAction = SKAction.moveBy(x: -110, y: 0, duration: 2)
        let moveGhostHorizontalShortSequence = SKAction.repeatForever(SKAction.sequence([rotateGhost, moveGhostHorizontalShort, rotateGhost, moveGhostHorizontalShort.reversed()]))
        ghost1.run(moveGhostHorizontalShortSequence)
        
        ghost2 = createGhost(name: "ghost2", position: CGPoint(x: 260, y: 608))
        ghost2.zRotation = CGFloat(3*Double.pi/2)
        self.addChild(ghost2)
        let moveGhostHorizontal:SKAction = SKAction.moveBy(x: -550, y: 0, duration: 4)
        let moveGhostHorizontalSequence = SKAction.repeatForever(SKAction.sequence([rotateGhost, moveGhostHorizontal, rotateGhost, moveGhostHorizontal.reversed()]))
        ghost2.run(moveGhostHorizontalSequence)
        
        ghost3 = createGhost(name: "ghost3", position: CGPoint(x: 446, y: 480))
        self.addChild(ghost3)
        ghost3.run(moveGhostVerticalSequence)
        
        ghost4 = createGhost(name: "ghost4", position: CGPoint(x: 320, y: -288))
        ghost4.zRotation = CGFloat(3*Double.pi/2)
        self.addChild(ghost4)
        ghost4.run(moveGhostHorizontalSequence)
        
        //SKSpriteNodes Objects - AC and CH
        //Creating objects that can be interacted with
        
        //Exit
        exit = createSN (image: "Exit", name: "exit", position: CGPoint(x: 446, y: -288), isDynamic: false)
        exit.physicsBody?.usesPreciseCollisionDetection = true
        exit.physicsBody?.categoryBitMask = itemCategory
        self.addChild(exit)
        
        //Food#1
        food = createSN (image: "Food1", name: "food", position: CGPoint(x: 129, y: 96), isDynamic: false)
        food.physicsBody?.usesPreciseCollisionDetection = true
        food.physicsBody?.categoryBitMask = itemCategory
        self.addChild(food)
        
        //Treasure
        treasure = createSN (image: "Treasure", name: "treasure", position: CGPoint(x: 446, y: 608), isDynamic: false)
        treasure.physicsBody?.usesPreciseCollisionDetection = true
        treasure.physicsBody?.categoryBitMask = itemCategory
        self.addChild(treasure)
        
        //Key
        key1 = createSN (image: "Key", name: "key1", position: CGPoint(x: -446, y: 608), isDynamic: false)
        key1.physicsBody?.usesPreciseCollisionDetection = true
        key1.physicsBody?.categoryBitMask = itemCategory
        self.addChild(key1)
        
        key2 = createSN (image: "Key", name: "key2", position: CGPoint(x: -191, y: -8.6), isDynamic: false)
        key2.physicsBody?.usesPreciseCollisionDetection = true
        key2.physicsBody?.categoryBitMask = itemCategory
        self.addChild(key2)
        
        //Door
        door1 = createSN(image: "keyWallBasic", name: "door1", position: CGPoint(x: -63.017, y: 544), isDynamic: false)
        door1.size = CGSize(width: 64, height: 64)
        door1.physicsBody?.usesPreciseCollisionDetection = true
        door1.physicsBody?.categoryBitMask = doorCategory
        self.addChild(door1)
        
        door2 = createSN(image: "keyWallHorizontal", name: "door2", position: CGPoint(x: 96, y: -224.001), isDynamic: false)
        door2.size = CGSize(width: 128, height: 64)
        door2.physicsBody?.usesPreciseCollisionDetection = true
        door2.physicsBody?.categoryBitMask = doorCategory
        self.addChild(door2)
        
        //SKSpriteNodes Controls - CH
        //Arrow Keys and Fire Button used to control the character
        
        //Left control arrow
        leftArrow = SKSpriteNode(imageNamed: "LeftArrow")
        leftArrow.name = "leftControlArrow"
        leftArrow.size = CGSize (width: 100, height: 100)
        leftArrow.anchorPoint = CGPoint(x:0.5, y:0)
        leftArrow.position = CGPoint (x: -420, y: -570)
        self.addChild(leftArrow)
        
        //Right control arrow
        rightArrow = SKSpriteNode(imageNamed: "RightArrow")
        rightArrow.name = "rightControlArrow"
        rightArrow.size = CGSize (width: 100, height: 100)
        rightArrow.anchorPoint = CGPoint (x: 0.5, y: 0)
        rightArrow.position = CGPoint (x: -220, y: -570)
        self.addChild(rightArrow)
        
        //Up control arrow
        upArrow = SKSpriteNode(imageNamed: "UpArrow")
        upArrow.name = "upControlArrow"
        upArrow.size = CGSize (width: 100, height: 100)
        upArrow.anchorPoint = CGPoint (x: 0.5, y: 0)
        upArrow.position = CGPoint (x: -320, y: -470)
        self.addChild(upArrow)
        
        //Down control arrow
        downArrow = SKSpriteNode(imageNamed: "DownArrow")
        downArrow.name = "downControlArrow"
        downArrow.size = CGSize (width: 100, height: 100)
        downArrow.anchorPoint = CGPoint (x: 0.5, y: 0)
        downArrow.position = CGPoint (x: -320, y: -670)
        self.addChild(downArrow)
        
        //Fire button
        fireButton = SKSpriteNode(imageNamed: "dot")
        fireButton.name = "fireControl"
        fireButton.size = CGSize (width: 100, height: 100)
        fireButton.anchorPoint = CGPoint (x: 0.5, y: 0)
        fireButton.position = CGPoint (x: -90, y: -570)
        fireButton.zPosition = 10
        self.addChild(fireButton)
        
        fireText = SKSpriteNode(imageNamed: "fireText")
        fireText.size = CGSize (width: 150, height: 150)
        fireText.anchorPoint = CGPoint (x: 0.5, y: 0)
        fireText.position = CGPoint (x: -90, y: -570)
        fireText.zPosition = 9
        self.addChild(fireText)
        
    }
    
    
    
    //Arrow move controls and fire button - CH
    //Checks for touches on the screen and where they are. If it's on a button, it does the appropriate thing (moving character or firing projectile)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            
            var movementSpeed: Double
            if selectedPlayer == "elf" {
                movementSpeed = 0.15
            } else {
                movementSpeed = 0.3
            }
            if moveCharacter == true {
                
                if rightArrow.contains(positionInScene) {
                    let moveRight:SKAction = SKAction.moveBy(x: 50, y: 0, duration: movementSpeed)
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
                    let moveLeft:SKAction = SKAction.moveBy(x: -50, y: 0, duration: movementSpeed)
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
                    let moveUp:SKAction = SKAction.moveBy(x: 0, y: 50, duration: movementSpeed)
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
                    let moveDown:SKAction = SKAction.moveBy(x: 0, y: -50, duration: movementSpeed)
                    let loop:SKAction = SKAction.repeatForever(moveDown)
                    player.run(loop)
                    if player.zRotation != CGFloat(Double.pi) {
                        player.zRotation = CGFloat(Double.pi)
                        orientation = CGFloat(-Double.pi/2)
                        directionx = 0
                        directiony = -1
                    }
                }
                //Fire Button - MC
                //Creates a projectile based on the location of the player. It creates an action to shoot it
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
    }
    
    //End arrow movement - CH
    //When touch is released, the player stops moving
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
    
    //Contact detection - MC, AC and CH
    func didBegin(_ contact: SKPhysicsContact){
        contactQueue.append(contact)
        let firstNode = contact.bodyA.node as! SKSpriteNode
        let secondNode = contact.bodyB.node as! SKSpriteNode
        var firstBody : SKPhysicsBody
        var secondBody : SKPhysicsBody
        
        //Player interacts with an item
        if (contact.bodyA.categoryBitMask == playerCategory) && (contact.bodyB.categoryBitMask == itemCategory){
            //Player interacts with the exit, the game ends. The score it totalled and timer is stopped.
            if secondNode == exit {
                player.removeFromParent()
                player.physicsBody?.categoryBitMask = usedItemCategory
                moveCharacter = false
                scoreValue = scoreValue + seconds
                scoreValue = scoreValue + health
                score.text = "Score: \(scoreValue)"
                didWin = true
                winTime = winTime - seconds
                seconds = 1
                contactExit?.play()
                
                //endingAnimation.position = CGPoint(x:330, y: -245)
                //self.addChild(endingAnimation)
                //330, -245
                
                /*let rotatePlayer = SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(2*Double.pi), duration: 1))
                 let shrinkPlayer = SKAction.scale(by:CGFloat(100), duration:1).reversed()
                 var actions = Array<SKAction>()
                 actions.append(rotatePlayer)
                 actions.append(shrinkPlayer)
                 let exitLevel = SKAction.group(actions)
                 endingAnimation.run(exitLevel)*/
            } else {
                //Player picks up food item.
                if secondNode == food {
                    scoreText.removeFromParent()
                    scoreText.text = "15"
                    scoreText.position = food.position
                    self.addChild(scoreText)
                    scoreValue = scoreValue + 15
                    if health < 5 {
                        if selectedPlayer ==  "wizard" {
                            health += 1
                        }
                        health += 1
                        healthText.text = "Health: \(health)"
                    }
                    food.removeFromParent()
                    food.physicsBody?.categoryBitMask = usedItemCategory
                }
                //Player picks up treasure item.
                if secondNode == treasure {
                    scoreText.removeFromParent()
                    scoreText.text = "150"
                    scoreText.position = treasure.position
                    self.addChild(scoreText)
                    scoreValue = scoreValue + 150
                    treasure.removeFromParent()
                    treasure.physicsBody?.categoryBitMask = usedItemCategory
                }
                //Player picks up keys
                if secondNode == key1{
                    scoreText.removeFromParent()
                    scoreText.text = "100"
                    scoreText.position = key1.position
                    self.addChild(scoreText)
                    scoreValue = scoreValue + 100
                    key1.removeFromParent()
                    key1.physicsBody?.categoryBitMask = usedItemCategory
                    hasKey = true
                }
                if secondNode == key2{
                    scoreText.removeFromParent()
                    scoreText.text = "100"
                    scoreText.position = key2.position
                    self.addChild(scoreText)
                    scoreValue = scoreValue + 100
                    key2.removeFromParent()
                    key2.physicsBody?.categoryBitMask = usedItemCategory
                    hasKey = true
                }
                collectItem?.play()
            }
        }
        
        //Player interacts with a ghost and loses health - AC
        if (contact.bodyA.categoryBitMask == playerCategory) && (contact.bodyB.categoryBitMask == enemyCategory) {
            if selectedPlayer != "valkyrie" {
                health -= 1
            }
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
        
        //testing projectile
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
        
        //Projectile hits a ghost - AC and MC
        if (firstBody.categoryBitMask == projectileCategory) && (secondBody.categoryBitMask == enemyCategory){
            scoreText.removeFromParent()
            projectileHit?.play()
            //Ghost health - AC and MC
            //Searches through an array of ghosts to find the ghost that was hit. Decreases their health and removes if health == 0
            for num in 0...4 {
                if firstNode.name!.contains("\(num)") {
                    firstNode.texture = SKTexture(imageNamed: "Ghost(hurt)")
                    if selectedPlayer == "warrior" {
                        ghostHealth[num] -= 1
                    }
                    ghostHealth[num] -= 1
                    if ghostHealth[num] == 0 {
                        firstNode.removeFromParent()
                        scoreText.text = String(50)
                        scoreText.position = firstNode.position
                        self.addChild(scoreText)
                        scoreValue += 50
                    }
                }
            }
            secondNode.removeFromParent()
            projectileNode.physicsBody?.categoryBitMask = usedItemCategory
        }
        
        //Projectile hits an item
        if (firstBody.categoryBitMask == projectileCategory) && (secondBody.categoryBitMask == itemCategory){
            projectileHit?.play()
            projectileNode.removeFromParent()
            projectileNode.physicsBody?.categoryBitMask = usedItemCategory
            
        }
        
        //Projectile hits a wall - AC
        if (firstBody.categoryBitMask == projectileCategory) && (secondBody.categoryBitMask == 6){
            projectileHit?.play()
            secondNode.removeFromParent()
            projectileNode.physicsBody?.categoryBitMask = usedItemCategory
        }
        
        // Player interacts with a door - MC
        if (contact.bodyA.categoryBitMask == playerCategory) && (contact.bodyB.categoryBitMask == doorCategory) {
            if hasKey {
                secondNode.removeFromParent()
                hasKey = false
                openDoor?.play()
            }
        }
        score.text = "Score: \(scoreValue)"
    }
    
    // createProjectileNode - MC
    // Creates a projectile when called. Projectile is different depending on selectedPlayer.
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
        
        projectile.name = "projectileNode"
        projectile.position = CGPoint(x: archerPosition!.x + directionx * archerWidth!, y: archerPosition!.y + directiony*archerHeight!)
        projectile.size = CGSize(width: 40, height: 30)
        projectile.zRotation = CGFloat(orientation)
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
        
        //Rotating Axe animation - AC
        //If the selected player is the warrior, their projectile, the axe, will begin rotating indefinetly
        let rotateAxe = SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(2*Double.pi), duration: 0.2))
        if selectedPlayer == "warrior" {
            projectile.run(rotateAxe)
        }
        
        return projectile
    }
    
    //Create a Sprite Node - AC
    //Creates sprite nodes based on an image texture. Takes in the image, a name, its starting poisiton and what type of physics it will have.
    //Also, assigns size and anchor point to be the same between all the nodes.
    //Returns the node with all its properties.
    func createSN(image: String, name: String, position: CGPoint, isDynamic: Bool) -> SKSpriteNode {
        let node = SKSpriteNode(imageNamed: image)
        node.name = name
        node.size = CGSize (width: 60, height: 60) //Always the same
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
    
    //Create ghost - CH
    //Takes in the name, position, and adds physics to create ghosts
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

