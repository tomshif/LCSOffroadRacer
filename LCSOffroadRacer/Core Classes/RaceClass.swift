//
//  RaceClass.swift
//  OffroadRacer
//
//  Created by LCS Game Design on 1/11/21.
//

import Foundation
import SpriteKit

class RaceClass
{
    var theScene:GameScene?
    
    var currentRank:Int = 1
    
    var isRacing:Bool = true
    
    var start = CGPoint()
    var finish = CGPoint()
    
    var easyCarAmount:Int = 3
    var medCarAmount:Int = 5
    var hardCarAmount:Int = 8
    
    var isSunrise:Bool = false
    
    var isRaining:Bool = false
    var isSnowing:Bool = false
    var isStorming:Bool = false
    
    var startTime = NSDate()
    var currentTime = NSDate()
    var endTime = NSDate()
    
    var isEasy1:Bool = false
    var isMedium1:Bool = false
    var isHard1:Bool = false
    var isEasy2:Bool = false
    var isMedium2:Bool = false
    var isHard2:Bool = false
    var isEasy3:Bool = false
    var isMedium3:Bool = false
    var isHard3:Bool = false
    
    var MMR:Int = 0
    // variables

    let hardFirstPlaceMoney:Int = 1000
    let hardSecondPlaceMoney:Int = 750
    let hardThirdPlaceMoney:Int = 500
    let hardParticipationMoney:Int = 100
    let hardLastPlaceMoney:Int = 50
    let medFirstPlaceMoney:Int = 500
    let medSecondPlaceMoney:Int = 350
    let medThirdPlaceMoney:Int = 250
    let medFourthPlaceMoney:Int = 100
    let medLastPlaceMoney:Int = 25
    let easyFirstPlaceMoney:Int = 100
    let easySecondPlaceMoney:Int = 50
    let easyThirdPlaceMoney:Int = 5
    // constants

    func createMap()
    {
        func createCheckpoints()
        {
            
        } // func createCheckpoints
    } // func createMap
    
    func raceStats()
    {
        func timer()
        {
            
        } // func timer
    } // func raceStats
    
    func destroyCar()
    {
        
    } // func destroyCar
    
    func raceRewards()
    {
        
    } // func raceRewards
    
    func difficulty()
    {
        
    } // func difficulty
    
    func timeOfDay()
    {
        
    } // func timeOfDay
    
    func weather()
    {
        let chooseWeather = random(min: 0, max: 1)
        
        if chooseWeather > 0.8
        {
            isRaining = true
        }
        else if chooseWeather > 0.6
        {
            isSnowing = true
        }
        else if chooseWeather > 0.5
        {
            isStorming = true
        } // Choose weather
    } // func weather
    
    func particles() // controls the particles coming from the car
    {
        
    } // func particles
    
    func playersPlace()
    {
        
    } // func playersPlace

    init(MMR:Int, scene:GameScene)
    {
        theScene = scene
        
        
        
    } // init

} // RaceClass
