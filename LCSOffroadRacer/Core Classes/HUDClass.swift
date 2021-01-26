//
//  HUDClass.swift
//  OffroadRacer
//
//  Created by LCS Game Design on 1/11/21.
//

import Foundation
import SpriteKit


class HUDClass
{
    // variables
    var speedometer = SKSpriteNode(imageNamed: "speedometer")
    var directionalArrow = SKSpriteNode(imageNamed: "arrow")
    var countdown1 = SKSpriteNode(imageNamed: "countdown1")
    var countdown2 = SKSpriteNode(imageNamed:"countdown2")
    var countdown3 = SKSpriteNode(imageNamed: "countdown3")
    var countdownGo = SKSpriteNode(imageNamed: "go")
    var currentTimer = SKLabelNode(fontNamed: "Arial")
    
    // intend to add a variable that shows the player's place; not sure whether it should be separate variables for each place or just one.
    // no idea what else to add for variables.
    
    // constants

    
    
    func raceStart()
    {
        
    } // race start
    // probably will just cover the interface showing up, as well as the race countdown starting.
    
func updateAll()
{
    
} // updateAll
    
    init()
    {
        
    } // Initializer
    
} // HUDClass
