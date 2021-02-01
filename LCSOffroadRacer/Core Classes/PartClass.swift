//
//  PartClass.swift
//  OffroadRacer
//
//  Created by LCS Game Design on 1/11/21.
//

import Foundation
import SpriteKit

class PartClass
{
    // variables
    
    var theScene:GameScene?

    var type:Int = -1
    var quality:Int = -1
    
    
    var speed:CGFloat=0
    var traction:CGFloat=0
    var accel:CGFloat=0
    var turnRate:CGFloat=0
    
    var sprite=SKSpriteNode()
    
    

    // constants


    init()
    {
        
    }
    
    init(scene:GameScene)
    {
        theScene=scene
        type = Int(random(min: 0, max: 4.999999999999))
        quality = Int(random(min: 0, max: 4.999999999999))
        createStats()
    }

    init(scene:GameScene, partType:Int)
    {
        theScene=scene
        type=partType
        quality = Int(random(min: 0, max: 4.999999999999))
        createStats()
    }
    
    init(scene:GameScene, partType:Int, qual:Int)
    {
        theScene=scene
        type=partType
        quality=qual
        createStats()
        
    }
    
    func createStats()
    {
        switch type
        {
        
        case PARTTYPE.ENGINE:
            speed = (CGFloat(quality)/5)+0.2
            
        case PARTTYPE.AXLE:
            turnRate=(CGFloat(quality)/5)+0.2
            
        case PARTTYPE.TIRES:
            traction=(CGFloat(quality)/5)+0.2
            
        case PARTTYPE.GEARBOX:
            accel=(CGFloat(quality)/5)+0.2
            
        case PARTTYPE.CHASSIS:
            break
            
        default:
            print("Error - Invalid part type in PartClass.createStats().")
            
        } // switch
    } // createStats()
    
} // class PartClass

