//
//  ViewController.swift
//  Snake
//
//  Created by Matt T on 2017-11-23.
//  Copyright © 2017 Matthew Temniuk. All rights reserved.
//
//
import UIKit
import Foundation




class SnakeViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var body2: UIImageView!
    @IBOutlet weak var body3: UIImageView!
    @IBOutlet weak var body4: UIImageView!
    @IBOutlet weak var body5: UIImageView!
    @IBOutlet weak var body6: UIImageView!
    @IBOutlet weak var body7: UIImageView!
    @IBOutlet weak var body8: UIImageView!
    @IBOutlet weak var body9: UIImageView!
    @IBOutlet weak var body10: UIImageView!
    @IBOutlet weak var body11: UIImageView!
    @IBOutlet weak var body12: UIImageView!
    @IBOutlet weak var body13: UIImageView!
    @IBOutlet weak var body14: UIImageView!
    @IBOutlet weak var body15: UIImageView!
    @IBOutlet weak var body16: UIImageView!
    @IBOutlet weak var body17: UIImageView!
    @IBOutlet weak var body18: UIImageView!
    @IBOutlet weak var body19: UIImageView!
    @IBOutlet weak var body20: UIImageView!
    @IBOutlet weak var body21: UIImageView!
    @IBOutlet weak var body22: UIImageView!
    @IBOutlet weak var body23: UIImageView!
    @IBOutlet weak var body24: UIImageView!
    @IBOutlet weak var body25: UIImageView!
    @IBOutlet weak var body26: UIImageView!
    @IBOutlet weak var body27: UIImageView!
    @IBOutlet weak var body28: UIImageView!
    @IBOutlet weak var body29: UIImageView!
    @IBOutlet weak var body30: UIImageView!
    @IBOutlet weak var body31: UIImageView!
    @IBOutlet weak var body32: UIImageView!
    @IBOutlet weak var body66: UIImageView!
    @IBOutlet weak var body33: UIImageView!
    @IBOutlet weak var body34: UIImageView!
    @IBOutlet weak var body35: UIImageView!
    @IBOutlet weak var body36: UIImageView!
    @IBOutlet weak var body37: UIImageView!
    @IBOutlet weak var body67: UIImageView!
    @IBOutlet weak var body38: UIImageView!
    @IBOutlet weak var body39: UIImageView!
    @IBOutlet weak var body40: UIImageView!
    @IBOutlet weak var body41: UIImageView!
    @IBOutlet weak var body42: UIImageView!
    @IBOutlet weak var body43: UIImageView!
    @IBOutlet weak var body44: UIImageView!
    @IBOutlet weak var body45: UIImageView!
    @IBOutlet weak var body46: UIImageView!
    @IBOutlet weak var body47: UIImageView!
    @IBOutlet weak var body48: UIImageView!
    @IBOutlet weak var body49: UIImageView!
    @IBOutlet weak var body50: UIImageView!
    @IBOutlet weak var body51: UIImageView!
    @IBOutlet weak var body52: UIImageView!
    @IBOutlet weak var body53: UIImageView!
    @IBOutlet weak var body54: UIImageView!
    @IBOutlet weak var body55: UIImageView!
    @IBOutlet weak var body56: UIImageView!
    @IBOutlet weak var body57: UIImageView!
    @IBOutlet weak var body58: UIImageView!
    @IBOutlet weak var body59: UIImageView!
    @IBOutlet weak var body60: UIImageView!
    @IBOutlet weak var body61: UIImageView!
    @IBOutlet weak var body62: UIImageView!
    @IBOutlet weak var body63: UIImageView!
    @IBOutlet weak var body64: UIImageView!
    @IBOutlet weak var body65: UIImageView!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var food: UIImageView!
    @IBOutlet weak var snakeHead: UIImageView!
    @IBOutlet weak var startPosition: UIImageView!
   
    @IBOutlet weak var body1: UIImageView!
    @IBOutlet weak var foodStart: UIImageView!
    
 var timer:Timer?
    
    var snake = Snake(speed: 0.30)
    
   
 
    
    
    
    @objc func timerMethod(_ timer:Timer?) {
        
        let y = Int(snake.length)
        
        var x = 1
        
        snake.move(Image: snakeHead, Body1: body1, start: foodStart)
        let headHitBody = snake.headHitBody()
        if headHitBody == true {
            print("Lppl")
            snake.returnImage(Image: body2)
            snake.returnImage(Image: body3)
            snake.returnImage(Image: body4)
            snake.returnImage(Image: body5)
            snake.returnImage(Image: body6)
            snake.returnImage(Image: body7)
            snake.returnImage(Image: body8)
            snake.returnImage(Image: body9)
            snake.returnImage(Image: body10)
            snake.returnImage(Image: body11)
            snake.returnImage(Image: body12)
            snake.returnImage(Image: body13)
            snake.returnImage(Image: body14)
            snake.returnImage(Image: body15)
            snake.returnImage(Image: body16)
            snake.returnImage(Image: body17)
            snake.returnImage(Image: body18)
            snake.returnImage(Image: body19)
            snake.returnImage(Image: body20)
            snake.returnImage(Image: body21)
            snake.returnImage(Image: body22)
            snake.returnImage(Image: body23)
            snake.returnImage(Image: body24)
            snake.returnImage(Image: body25)
            snake.returnImage(Image: body26)
            snake.returnImage(Image: body27)
            snake.returnImage(Image: body28)
            snake.returnImage(Image: body29)
            snake.returnImage(Image: body30)
            snake.returnImage(Image: body31)
            snake.returnImage(Image: body32)
            snake.returnImage(Image: body33)
            snake.returnImage(Image: body34)
            snake.returnImage(Image: body35)
            snake.returnImage(Image: body36)
            snake.returnImage(Image: body37)
            snake.returnImage(Image: body38)
            snake.returnImage(Image: body39)
            snake.returnImage(Image: body40)
            snake.returnImage(Image: body41)
            snake.returnImage(Image: body42)
            snake.returnImage(Image: body43)
            snake.returnImage(Image: body44)
            snake.returnImage(Image: body45)
            snake.returnImage(Image: body46)
            snake.returnImage(Image: body47)
            snake.returnImage(Image: body48)
            snake.returnImage(Image: body49)
            snake.returnImage(Image: body50)
            snake.returnImage(Image: body51)
            snake.returnImage(Image: body52)
            snake.returnImage(Image: body53)
            snake.returnImage(Image: body54)
            snake.returnImage(Image: body55)
            snake.returnImage(Image: body56)
            snake.returnImage(Image: body57)
            snake.returnImage(Image: body58)
            snake.returnImage(Image: body59)
            snake.returnImage(Image: body60)
            snake.returnImage(Image: body61)
            snake.returnImage(Image: body62)
            snake.returnImage(Image: body63)
            snake.returnImage(Image: body64)
            snake.returnImage(Image: body65)
            snake.returnImage(Image: body66)
            snake.returnImage(Image: body67)
            endGame()
            
        }
        
        if Int(snake.length) > x{
            snake.spawnImage(Image: body66, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > 0{
        snake.spawnImage(Image: body61, length: snake.bodyCoordinates.count - 1, start: foodStart)
        }
        //snake.spawnImage(Image: body50, length: bodyCoordinates.capacity - 2, start: foodStart)
            
        if Int(snake.length) > x{
            snake.spawnImage(Image: body67, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body2, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body3, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body4, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body5, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body6, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body7, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body8, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body9, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body10, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body11, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body12, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body13, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body14, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body15, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body16, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body17, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body18, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body19, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body20, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body21, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body22, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body23, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body24, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body25, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body26, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body27, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body28, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body29, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body30, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body31, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body32, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body33, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body34, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body35, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body36, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body37, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body38, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body39, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body40, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body41, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body42, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body43, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body44, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body45, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body46, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body47, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body48, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body49, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body50, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body51, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body52, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body53, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body54, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body55, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body56, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body57, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body58, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body59, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body60, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body61, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body62, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body63, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body64, length: x, start: foodStart)
            x += 1
        }
        if Int(snake.length) > x{
            snake.spawnImage(Image: body65, length: x, start: foodStart)
            x += 1
        }
        
        let headHitWall = snake.headHitWall(Image: snakeHead)
        if headHitWall == true{
            endGame()
        }
        
        
        let head = snake.bodyCoordinates[0]
        if head.x == snake.foodCordinate.x && head.y == snake.foodCordinate.y {
            snake.foodAte(Image: food,start: foodStart, body: body1)
            //let scoreNumber = snake.score00
            
            score.text = "\(snake.score), \(snake.length)"
        }
    }
    
    func startGame() {
        if (timer != nil) {
            return
        }
        
        
        startButton!.isHidden = true
        snake.direction = Direction.up
        snake.length = 0
        snake.score = 0
        score.text = "0"
        snake.spawn()

            
        snake.genFood(Image: food,start: foodStart)
        timer = Timer.scheduledTimer(timeInterval: snake.speed, target: self, selector: #selector(timerMethod(_:)) , userInfo: nil, repeats: true)
        
    }
    
    func endGame() {
        snake.returnImage(Image: body2)
        snake.returnImage(Image: body3)
        snake.returnImage(Image: body4)
        snake.returnImage(Image: body5)
        snake.returnImage(Image: body6)
        snake.returnImage(Image: body7)
        snake.returnImage(Image: body8)
        snake.returnImage(Image: body9)
        snake.returnImage(Image: body10)
        snake.returnImage(Image: body11)
        snake.returnImage(Image: body12)
        snake.returnImage(Image: body13)
        snake.returnImage(Image: body14)
        snake.returnImage(Image: body15)
        snake.returnImage(Image: body16)
        snake.returnImage(Image: body17)
        snake.returnImage(Image: body18)
        snake.returnImage(Image: body19)
        snake.returnImage(Image: body20)
        snake.returnImage(Image: body21)
        snake.returnImage(Image: body22)
        snake.returnImage(Image: body23)
        snake.returnImage(Image: body24)
        snake.returnImage(Image: body25)
        snake.returnImage(Image: body26)
        snake.returnImage(Image: body27)
        snake.returnImage(Image: body28)
        snake.returnImage(Image: body29)
        snake.returnImage(Image: body30)
        snake.returnImage(Image: body31)
        snake.returnImage(Image: body32)
        snake.returnImage(Image: body33)
        snake.returnImage(Image: body34)
        snake.returnImage(Image: body35)
        snake.returnImage(Image: body36)
        snake.returnImage(Image: body37)
        snake.returnImage(Image: body38)
        snake.returnImage(Image: body39)
        snake.returnImage(Image: body40)
        snake.returnImage(Image: body41)
        snake.returnImage(Image: body42)
        snake.returnImage(Image: body43)
        snake.returnImage(Image: body44)
        snake.returnImage(Image: body45)
        snake.returnImage(Image: body46)
        snake.returnImage(Image: body47)
        snake.returnImage(Image: body48)
        snake.returnImage(Image: body49)
        snake.returnImage(Image: body50)
        snake.returnImage(Image: body51)
        snake.returnImage(Image: body52)
        snake.returnImage(Image: body53)
        snake.returnImage(Image: body54)
        snake.returnImage(Image: body55)
        snake.returnImage(Image: body56)
        snake.returnImage(Image: body57)
        snake.returnImage(Image: body58)
        snake.returnImage(Image: body59)
        snake.returnImage(Image: body60)
        snake.returnImage(Image: body61)
        snake.returnImage(Image: body62)
        snake.returnImage(Image: body63)
        snake.returnImage(Image: body64)
        snake.returnImage(Image: body65)
        snake.returnImage(Image: body66)
        snake.returnImage(Image: body67)
        startButton!.isHidden = false
        timer!.invalidate()
        timer = nil
    }

    @IBAction func upButton(_ sender: Any) {
        snake.changeDirection(Direction.up)
    }
    @IBAction func downButton(_ sender: Any) {
        snake.changeDirection(Direction.down)
    }
    @IBAction func rightButton(_ sender: Any) {
        snake.changeDirection(Direction.right)
    }
    @IBAction func leftButton(_ sender: Any) {
        snake.changeDirection(Direction.left)
    }
   
    @IBAction func startButton(_ sender: Any) {
        startGame()
        
        snakeHead.center.x = startPosition.center.x
       snakeHead.center.y = startPosition.center.y
    }
    
   
    
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

