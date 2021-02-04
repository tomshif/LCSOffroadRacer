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
    var AICarDx:CGFloat = 0
    var AICarDy:CGFloat = 0
    
    var finishLineDx:CGFloat = 0
    var finishLineDy:CGFloat = 0
    
    var isAccelearting:Bool = false
    var isBraking:Bool = false

    // constants
    let maxAICarSpeed:CGFloat = 300
    let maxAICarEnginePower:CGFloat = 300
    let maxAICarTurnRate:CGFloat = 10
    let maxAICarBrake:CGFloat = 10
    
    init(scene:GameScene)
    {
        theScene = scene
        theScene!.irAnchor.addChild(AICarSprite)
        
        AICarSprite.zPosition = 4
        AICarSprite.position.x = AICarDx
        AICarSprite.position.y = AICarDy
    } // init
    
    func pickRandomEndLine()
    {
        finishLineDx = random(min: -8192, max: 8192)
        finishLineDy = random(min: -8192, max: 8192)
    } // func pickRandomEndLine
    
    func generateAICarStats()
    {
        AICarSpeed = random(min: 10, max: 50)
        AICarEnginePower = random(min: 10, max: 30)
        AICarTraction = random(min: 10, max: 20)
        AICarTurnRate = random(min: 10, max: 30)
        AICarAcceleration = random(min: 15, max: 60)
    } // func generateAICarStats
    
    func goToFinishLine()
    {
        var angleToEndLine = atan2(AICarDy, AICarDx)
        
        if (angleToEndLine < 0)
        {
            angleToEndLine += CGFloat.pi*2
        } // if
        
        if (AICarSprite.zRotation < 0)
        {
            AICarSprite.zRotation += CGFloat.pi*2
        } // if
        
        if (AICarSprite.zRotation > CGFloat.pi*2)
        {
            AICarSprite.zRotation -= CGFloat.pi*2
        } // if
        
        var angleDiff = AICarSprite.zRotation - angleToEndLine
        
        if (angleDiff < 0)
        {
            angleDiff += CGFloat.pi*2
        } // if
        
        if (angleDiff > CGFloat.pi)
        {
            AICarSprite.zRotation += AICarTurnRate
        } // if
        
        else
        {
            AICarSprite.zRotation -= AICarTurnRate
        } // else
        
        let moveDX = cos(AICarSprite.zRotation)*AICarSpeed
        let moveDY = sin(AICarSprite.zRotation)*AICarSpeed
        AICarSprite.position.x += moveDX
        AICarSprite.position.y += moveDY
        
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
    
    public func update()
    {
        pickRandomEndLine()
        generateAICarStats()
        goToFinishLine()
    } // func update()

} // class AICarClass
