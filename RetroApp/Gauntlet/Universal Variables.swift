//
//  Universal Variables.swift - MC
//  Collection of variables that get reset when starting a new game. Used in multiple files, so they are universal.
//  Copyright © 2017 NFB. All rights reserved.
//

import Foundation
import SpriteKit

// Universal Variables - MC
// the variables that are reset between games
var selectedPlayer:String = ""
var seconds = 100
var winTime = 100
var health = 5
var scoreValue = 0
var didWin: Bool = false
var gameTimer = Timer()
var pause = Timer()
var hasKey = false
var ghostHealth = [Int](repeating: 2, count: 5)
var moveCharacter = true
