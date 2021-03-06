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
    var theScene:GameScene?
    var speedometer = SKSpriteNode(imageNamed:  "Speedometer")
    var speedometerNeedle = SKSpriteNode(imageNamed: "needle")
    var directionalArrow = SKSpriteNode()
    var countdown1 = SKSpriteNode()
    var countdown2 = SKSpriteNode()
    var countdown3 = SKSpriteNode()
    var countdownGo = SKSpriteNode()
    var currentTimer = SKLabelNode(fontNamed: "Arial")
    var raceTime:Int = 0
    var timerBackdrop = SKSpriteNode(imageNamed: "timer_backdrop")
    
    
    

    
    // constants

    
    
    func updateTimer()
    {
        
    } // race start
    // probably will just cover the interface showing up, as well as the race countdown starting.
    
    func updateSpeed()
    {
        
    }// speedometer change
    // Speedometer will change reading based off of current speed; will need to see what the speed threshold's maximum is.
    
    func updateCompass()
    {
        
    }// directional arrow point
    // Arrow will point to wherever the end goal is. 
    
    func updatePlace()
    {
        
    }// update placing
    // place will show a number based off of distance from goal
    
func updateAll()
{
    
} // updateAll
    
init(scene:GameScene)
{
    theScene = scene
    currentTimer.position = CGPoint(x: theScene!.size.width*0.41, y: theScene!.size.height*0.4)
    currentTimer.text="Timer"
    currentTimer.zPosition=1501
    theScene!.hudAnchor.addChild(currentTimer)
    timerBackdrop.position = CGPoint(x: theScene!.size.width*0.411, y: theScene!.size.height*0.44)
    timerBackdrop.zPosition=1500
    theScene!.hudAnchor.addChild(timerBackdrop)
    speedometer.position = CGPoint(x: theScene!.size.width*0.41, y: theScene!.size.height * -0.385)
    speedometer.zPosition=1500
    theScene!.hudAnchor.addChild(speedometer)
    speedometerNeedle.position = CGPoint(x: theScene!.size.width*0.41, y: theScene!.size.height * -0.385)
    speedometerNeedle.zPosition=1501
    theScene!.hudAnchor.addChild(speedometerNeedle)
    // need the needle rotated to the RIGHT, not sure how to do that yet.
} // Initializer
    
} // HUDClass


