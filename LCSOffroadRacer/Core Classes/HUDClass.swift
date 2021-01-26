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
    var speedometer = SKSpriteNode()
    var directionalArrow = SKSpriteNode()
    var countdown1 = SKSpriteNode()
    var countdown2 = SKSpriteNode()
    var countdown3 = SKSpriteNode()
    var countdownGo = SKSpriteNode()
    var currentTimer = SKLabelNode(fontNamed: "Arial")
    var raceTime:Int = 0
    
    // intend to add a variable that shows the player's place; not sure whether it should be separate variables for each place or just one.
    // no idea what else to add for variables.
    
    // constants

    
    
    func raceStart()
    {
        
    } // race start
    // probably will just cover the interface showing up, as well as the race countdown starting.
    
    func speedometerChange()
    {
        
    }// speedometer change
    // Speedometer will change reading based off of current speed; will need to see what the speed threshold's maximum is.
    
func updateAll()
{
    
} // updateAll
    
    init()
    {
        
    } // Initializer
    
} // HUDClass
