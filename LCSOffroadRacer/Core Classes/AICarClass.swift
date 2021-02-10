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
        AICarSpeed = 15/2 + (15/2 * AIUPGRADEFILLER)

        AICarEnginePower = 30/2 + (30/2 * AIUPGRADEFILLER)

        AICarTraction = 20/2 + (20/2 * AIUPGRADEFILLER)

        AICarTurnRate = 0.1/2 + (0.1/2 * AIUPGRADEFILLER)

        AICarAcceleration = 60/2 + (60/2 * AIUPGRADEFILLER)

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
    
    private func getTileType() -> String
              {
                  var retValue:String="Error"
                  
                  // Get mapSize values (eventually these need to be grabbed from the actual MapClass
                  let mapWidth:CGFloat = 128
                  let tileSize:CGFloat = 128
                  
                  // Compute the row/column for the player car
                  
                  
                  var col = Int(mapWidth/2)
                  col += Int((AICarSprite.position.x)/tileSize)-1
                  var row = Int(mapWidth/2)
                  row += Int((AICarSprite.position.y)/tileSize)
                  if (col > 64)
                  {
                      col += 1
                  }
                  if (row <= 64)
                  {
                      row -= 1
                  }
                  
                  retValue=(theScene!.theGame!.theRace!.theMap!.topLayer.tileGroup(atColumn: col, row: row)?.name ?? "Error")
                  if retValue=="Error"
                  {
                      retValue = "water"
                  }
                  
                  if retValue=="grass01"
                  {
                      retValue="grass"
                  }
                  
                  print("AI Tile Type: \(retValue) - \(col),\(row)")
                  //print("Car XY: \(col),\(row)")
                  
                  return retValue
                  
              }
    
    public func update()
    {
        goToFinishLine()
        let tileType = getTileType()
    } // func update()

} // class AICarClass
