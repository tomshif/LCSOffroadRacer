//
//  PlayerClass.swift
//  OffroadRacer
//
//  Created by LCS Game Design on 1/11/21.
//

import Foundation
import SpriteKit

class PlayerClass
{
    // variables
    var theScene:GameScene?
    var money:Int = 1
    var RaceEntered = SKSpriteNode()
    var carsDestroyed:Int = 1
    var RaceWon = SKSpriteNode()
    var totalWinnings: Int = 1
    var car:PCCarClass?

    // constants


    func addMoney(amount:Int)
    {
        money += amount
    }
    
    func spendMoney(amount:Int)
    {
        money -= amount
    }
    
    
    init (scene:GameScene)
    {
        theScene = scene
    } //init

}
