//
//  PCCarClass.swift
//  OffroadRacer
//
//  Created by LCS Game Design on 1/11/21.
//

import Foundation
import SpriteKit
class PCCarClass
{
    // variables
    var sprite = SKSpriteNode(imageNamed: "car_black_1")
    var theScene : GameScene?
    var playerVector = CGVector()
    
    var speed:CGFloat = 30
    var turning:CGFloat = 0.05
    var traction:CGFloat = 1
    var acceleration:CGFloat = 1

    var engine=PartClass() // affects speed
    var axle=PartClass() // affects turning
    var tires=PartClass() // affects traction
    var gearbox=PartClass() // affects acceleration
    
    var currentSpeed:CGFloat = 0
    var rotation:CGFloat = 0
    
    var dx:CGFloat = 0
    var dy:CGFloat = 0
    
    // constants
    
    let UPGRADEFILLER:CGFloat = 1 // used to fill in values until upgrades are ready
    let MOVEMENTVALUE:CGFloat = 0.5 // a value used when a check is made to see if the car is moving
    
    // booleans
    

    
    init(mmr: Int, scene: GameScene) {
        theScene = scene
        theScene!.irAnchor.addChild(sprite)
        sprite.zPosition = 3
        sprite.position.x = 0
        sprite.position.y = 0
     } // init(scene: GameScene) / initializes the scene
     
    public func updateStats() {
     
    } //public func updateStats() / determines part ratings
     
    public func speedUp() {
        var movement = sqrt((playerVector.dx*playerVector.dx)+(playerVector.dy*playerVector.dy))
        if movement < speed*UPGRADEFILLER {
            movement += (acceleration*UPGRADEFILLER)/15
            currentSpeed += (traction*UPGRADEFILLER)/30
            
            dx = cos(sprite.zRotation)*movement/60
            dy = sin(sprite.zRotation)*movement/60
            
            playerVector.dx += dx
            playerVector.dy += dy
        } // if currentSpeed is less than speed squared x engine / car cannot accelerate beyond max speed
    } //public func speedUp() / accelerates car
    
    public func turnLeft() {
        var movement = sqrt((playerVector.dx*playerVector.dx)+(playerVector.dy*playerVector.dy))
        sprite.zRotation += (turning*UPGRADEFILLER)*(movement/speed*0.75)
        
        playerVector.dx = cos(sprite.zRotation)*(movement)
        playerVector.dy = sin(sprite.zRotation)*(movement)
    } //public func turnLeft() / turns car left

    public func turnRight() {
        var movement = sqrt((playerVector.dx*playerVector.dx)+(playerVector.dy*playerVector.dy))
        
        sprite.zRotation -= (turning*UPGRADEFILLER)*(movement/speed*0.75)
        
        playerVector.dx = cos(sprite.zRotation)*(movement)
        playerVector.dy = sin(sprite.zRotation)*(movement)
    } //public func turnRight() / turns car right
     
     public func reverseSpeed() {
        var movement = -sqrt((playerVector.dx*playerVector.dx)+(playerVector.dy*playerVector.dy))
        if movement >= -speed*UPGRADEFILLER {
            movement -= (acceleration*UPGRADEFILLER)/5
            currentSpeed -= (traction*UPGRADEFILLER)/30
            
            dx = cos(sprite.zRotation)*movement/60
            dy = sin(sprite.zRotation)*movement/60
            
            playerVector.dx += dx
            playerVector.dy += dy
        } // if currentSpeed is less than speed x engine / car cannot accelerate beyond max speed
     } // public func reverseSpeed() / either stops the car or puts it in reverse
     
    private func getTileType() -> String
    {
        var retValue:String="Error"
        
        // Get mapSize values (eventually these need to be grabbed from the actual MapClass
        let mapWidth:CGFloat = 128
        let tileSize:CGFloat = 128
        
        // Compute the row/column for the player car
        
        
        var col = Int(mapWidth/2)
        col += Int((sprite.position.x)/tileSize)-1
        var row = Int(mapWidth/2)
        row += Int((sprite.position.y)/tileSize)
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
        
        print("Tile Type: \(retValue) - \(col),\(row)")
        //print("Car XY: \(col),\(row)")
        
        return retValue
        
    }
    
    public func update() {
        sprite.position.x += playerVector.dx
        sprite.position.y += playerVector.dy
        let tileType = getTileType()
       
    } //public func updatePlayer() / updates player stats and movement

 
    init() {
        
    } //init()
    
} //class PCCarClass
