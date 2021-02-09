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
    var theRace:RaceClass?
    
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
    
    let AIUPGRADEFILLER:CGFloat = 1 // used to fill in values until upgrades are ready
    
    init(scene:GameScene)
    {
        theScene = scene
        theScene!.irAnchor.addChild(AICarSprite)
        
        if(theScene != nil)
        {
            if(theScene!.theGame != nil)
            {
                if(theScene!.theGame!.theRace != nil)
                {
                    theRace=theScene!.theGame!.theRace!
                }
            }
        }
        
        
        
        AICarSprite.zPosition = 4
        AICarSprite.position.x = AICarDx
        AICarSprite.position.y = AICarDy
        
        pickRandomEndLine()
        generateAICarStats()
    } // init
    
    func pickRandomEndLine()
    {
        finishLineDx = random(min: -8192, max: 8192)
        finishLineDy = random(min: -8192, max: 8192)
        
        // Creates a "Target" label on the Random Finish Point
        let tempFinish = SKLabelNode(text: "Target")
        tempFinish.zPosition = 1500
        tempFinish.position = CGPoint(x: finishLineDx, y: finishLineDy)
        print("TempFinish: \(tempFinish.position)")
        theScene!.addChild(tempFinish)
        
    } // func pickRandomEndLine
    
    func generateAICarStats()
    {
        AICarSpeed = AIUPGRADEFILLER * 15
        //0.2 = 5, 1 = 10
        AICarEnginePower = AIUPGRADEFILLER * 30
        //0.2 = 10, 1 = 30
        AICarTraction = AIUPGRADEFILLER * 20
        //0.2 = 10, 1 = 20
        AICarTurnRate = AIUPGRADEFILLER * 0.1
        //0.2, = 0.05, 1 = 0.1
        AICarAcceleration = AIUPGRADEFILLER * 60
        //0.2 = 15, 1 = 60
    } // func generateAICarStats
    
    func goToFinishLine()
    {
        AICarDx = finishLineDx - AICarSprite.position.x
        AICarDy = finishLineDy - AICarSprite.position.y
        
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
        goToFinishLine()
    } // func update()

} // class AICarClass
