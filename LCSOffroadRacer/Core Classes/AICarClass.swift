//
//  AICarClass.swift
//  OffroadRacer
//
//  Created by LCS Game Design on 1/11/21.
//

import Foundation
import SpriteKit

class AICarClass
{
    // variables
    var AICarSprite = SKSpriteNode(imageNamed: "car_blue_1")
    var theScene:GameScene?
    
    var AICarSpeed:Double = 0
    var AICarEnginePower:Double = 0
    var AICarTraction:Double = 0
    var AICarTurnRate:Double = 0
    var AICarAcceleration:Double = 0
    var AICarVector = CGVector()
    
    var isAccelearting:Bool = false
    var isBraking:Bool = false

    // constants
    let maxAICarSpeed:Double = 300
    let maxAICarEnginePower:Double = 300
    let maxAICarTurnRate:Double = 10
    let maxAICarBrake:Double = 10
    
    init(scene:GameScene)
    {
        theScene = scene
    } // init
    
    func goToFinishLine()
    {
        
    } // func goToFinishLine
    
    func slowDown()
    {
        
    } // func slowDown
    
    func accelerate()
    {
        
    } // func accelerate
    
    func turnLeft()
    {
        
    } // func turnLeft
    
    func turnRight()
    {
        
    } // func turnRight
    
    func goStragiht()
    {
        
    } // func goStraight()
    
    func reverse()
    {
        
    } // func reverse
    
    func update()
    {
        
    } // func update()

} // class AICarClass
