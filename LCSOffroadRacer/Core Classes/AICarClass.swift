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
    
    var AICarSpeed:CGFloat = 0
    var AICarEnginePower:CGFloat = 0
    var AICarTraction:CGFloat = 0
    var AICarTurnRate:CGFloat = 0
    var AICarAcceleration:CGFloat = 0
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
        theScene!.irAnchor.addChild(AICarSprite)
    } // init
    
    func generateAICarStats()
    {
        AICarSpeed = random(min: 10, max: 50)
        AICarEnginePower = random(min: 10, max: 30)
        AICarTraction = random(min: 10, max: 20)
        AICarTurnRate = random(min: 10, max: 30)
        AICarAcceleration = random(min: 15, max: 60)
    }
    
    func goToFinishLine()
    {
        // let dx = theScene!.AICrSprite.position.x
        // let dy = theScene!.AICarSprite.position.y
        
        /*
        var angleToPlyaer = atan2(dy, dx)
        
        if (angleToPlyaer < 0)
        {
            angleToPlyaer += CGFloat.pi*2
        }
        
        if (sprite.zRotation < 0)
        {
            sprite.zRotation += CGFloat.pi*2
        }
        
        if (sprite.zRotation > CGFloat.pi*2)
        {
            sprite.zRotation -= CGFloat.pi*2
        }
        
        var angleDiff = sprite.zRotation - angleToPlyaer
        
        if (angleDiff < 0)
        {
            angleDiff += CGFloat.pi*2
        }
        
        if (angleDiff > CGFloat.pi)
        {
            sprite.zRotation += turnRate
        }
        
        else
        {
            sprite.zRotation -= turnRate
        }
        
        let moveDX = cos(sprite.zRotation)*speed
        let moveDY = sin(sprite.zRotation)*speed
        sprite.position.x += moveDX
        sprite.position.y += moveDY
        
        */
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
    
    func didMove()
    {
        
    } // func didMove
    
    func update()
    {
        
    } // func update()

} // class AICarClass
