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
    var sprite = SKSpriteNode()
    var theScene = GameScene()
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

    
    // booleans
    var isAccelerating = false
    /*
    public func updateStats() {
     
    } //public func updateStats() / determines part ratings
     
    public func speedUp() {
        if currentSpeed < speed*speed*engine {
            currentSpeed += acceleration*gearbox
            currentSpeed += (traction*tires)/60
            isAccelerating = true
        } // if currentSpeed is less than speed squared x engine / car cannot accelerate beyond max speed
    } //public func speedUp() / accelerates car
    
    public func turnLeft() {
        if currentSpeed > 1 {
            sprite.zPosition += turning*axle
            sprite.zPosition += (traction*tires)/60
        } //if currentSpeed > 1 / car must be moving to turn
    } //public func turnLeft() / turns car left

    public func turnRight() {
        if currentSpeed > 1 {
            sprite.zPosition -= turning*axle
            sprite.zPosition -= (traction*tires)/60
        } //if currentSpeed > 1 / car must be moving to turn
    } //public func turnRight() / turns car right
     
     public func reverseSpeed() {
        if currentSpeed > 0 {
            currentSpeed -= traction*tires
        } //if currentSpeed > 0  / car must be moving forward
        if currentSpeed <= 0 && currentSpeed < -speed*engine {
            currentSpeed -= acceleration*gearbox
        } // if currentSpeed <= 0 and < -speed*engine / car must be stopped or already in reverse, plus lower than negative max speed
     } // public func reverseSpeed() / either stops the car or puts it in reverse
     
    public func updatePlayer() {
        let dx = cos(sprite.zRotation)*currentSpeed/60
        let dy = sin(sprite.zRotation)*currentSpeed/60
        
        playerVector.dx += dx
        playerVector.dy += dy
        
        sprite.position.x += playerVector.dx
        sprite.position.y += playerVector.dy
        
        if !isAccelerating {
            currentSpeed -= traction*tires
        } //if not accelerating / ensures the player will always slow down unless they want to move
    } //public func updatePlayer() / updates player stats and movement
  */
 
    init() {
        
    } //init()
    
} //class PCCarClass
