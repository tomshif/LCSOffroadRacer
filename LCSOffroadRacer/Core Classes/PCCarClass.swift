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
    
    var speed:CGFloat = 10
    var turning:CGFloat = 10
    var traction:CGFloat = 10
    var acceleration:CGFloat = 10

    var engine=PartClass() // affects speed
    var axle=PartClass() // affects turning
    var tires=PartClass() // affects traction
    var gearbox=PartClass() // affects acceleration
    
    var currentSpeed:CGFloat = 0
    var rotation:CGFloat = 0
    
    // constants
    
    let UPGRADEFILLER:CGFloat = 1 // used to fill in values until upgrades are ready
    
    // booleans
    var isAccelerating = false

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
            isAccelerating = true
        } // if currentSpeed is less than speed squared x engine / car cannot accelerate beyond max speed
    } //public func speedUp() / accelerates car
    
    public func turnLeft() {
        if currentSpeed > 1 {
            sprite.zPosition += turning*UPGRADEFILLER
            sprite.zPosition += (traction*UPGRADEFILLER)/60
        } //if currentSpeed > 1 / car must be moving to turn
    } //public func turnLeft() / turns car left

    public func turnRight() {
        if currentSpeed > 1 {
            sprite.zPosition -= turning*UPGRADEFILLER
            sprite.zPosition -= (traction*UPGRADEFILLER)/60
        } //if currentSpeed > 1 / car must be moving to turn
    } //public func turnRight() / turns car right
     
     public func reverseSpeed() {
        if currentSpeed > 0 {
            currentSpeed -= traction*UPGRADEFILLER
        } //if currentSpeed > 0  / car must be moving forward
        if currentSpeed <= 0 && currentSpeed < -speed*UPGRADEFILLER {
            currentSpeed -= acceleration*UPGRADEFILLER
        } // if currentSpeed <= 0 and < -speed*engine / car must be stopped or already in reverse, plus lower than negative max speed
     } // public func reverseSpeed() / either stops the car or puts it in reverse
     
    public func update() {
        let dx = cos(sprite.zRotation)*currentSpeed/60
        let dy = sin(sprite.zRotation)*currentSpeed/60
        
        playerVector.dx += dx
        playerVector.dy += dy
        
        sprite.position.x += playerVector.dx
        sprite.position.y += playerVector.dy
        
        if !isAccelerating {
            if currentSpeed > 0 {
                currentSpeed -= traction*UPGRADEFILLER
            } // if currentSpeed > 0 / car must be moving to slow down
            if currentSpeed < 0 {
                currentSpeed += traction*UPGRADEFILLER
            }// if currentSpeed < 0 / car must be moving to slow down
        } //if not accelerating  / ensures the player will always slow down unless they want to move
    } //public func updatePlayer() / updates player stats and movement

 
    init() {
        
    } //init()
    
} //class PCCarClass
