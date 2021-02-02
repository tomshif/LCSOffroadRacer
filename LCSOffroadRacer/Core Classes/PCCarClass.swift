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
    
    var speed:CGFloat = 0.5
    var turning:CGFloat = 0.1
    var traction:CGFloat = 1
    var acceleration:CGFloat = 0.5

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
        if currentSpeed < speed*speed*UPGRADEFILLER {
            currentSpeed += acceleration*UPGRADEFILLER
            currentSpeed += (traction*UPGRADEFILLER)/60
            
            dx = cos(sprite.zRotation)*currentSpeed/60
            dy = sin(sprite.zRotation)*currentSpeed/60
            
            playerVector.dx += dx
            playerVector.dy += dy
        } // if currentSpeed is less than speed squared x engine / car cannot accelerate beyond max speed
    } //public func speedUp() / accelerates car
    
    public func turnLeft() {
        sprite.zRotation += ((turning*UPGRADEFILLER)+(traction*UPGRADEFILLER)/60)*currentSpeed
    } //public func turnLeft() / turns car left

    public func turnRight() {
        sprite.zRotation -= ((turning*UPGRADEFILLER)+(traction*UPGRADEFILLER)/60)*currentSpeed
    } //public func turnRight() / turns car right
     
     public func reverseSpeed() {
        currentSpeed -= traction*UPGRADEFILLER
        
        dx = cos(sprite.zRotation)*currentSpeed/60
        dy = sin(sprite.zRotation)*currentSpeed/60
        
        playerVector.dx += dx
        playerVector.dy += dy
     } // public func reverseSpeed() / either stops the car or puts it in reverse
     
    public func update() {
        dx = cos(sprite.zRotation)*currentSpeed/60
        dy = sin(sprite.zRotation)*currentSpeed/60
            
        playerVector.dx += dx
        playerVector.dy += dy
        
        sprite.position.x += playerVector.dx
        sprite.position.y += playerVector.dy
        
        currentSpeed *= 0.000009
    } //public func updatePlayer() / updates player stats and movement

 
    init() {
        
    } //init()
    
} //class PCCarClass
