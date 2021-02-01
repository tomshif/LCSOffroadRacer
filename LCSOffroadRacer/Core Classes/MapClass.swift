//
//  MapClass.swift
//  OffroadRacer
//
//  Created by LCS Game Design on 1/11/21.
//

import Foundation
import SpriteKit
import GameplayKit

class MapClass
{
    // variables
    var theScene:GameScene?
    let tileWidth:CGFloat = 128
    var mapTex=SKSpriteNode()
    var topLayer=SKTileMapNode()
    let map = SKNode()
   
    
    // constants
    
    
    
    
    init(scene: GameScene)
    {
        theScene = scene
        
        let tileSize = CGSize(width: 128, height: 128)
        let columns = 128
        let rows = 128
        
        
        func mapPosition()
        {
            var y = map.position.y
            var x = map.position.x
            
            for y in 0...127
            {
                for x in 0...127
                {
                    var posX:CGFloat = 0
                    var posY:CGFloat = 0

                    posX = -64 * tileWidth + tileWidth * CGFloat(x)
                    posY = -64 * tileWidth + tileWidth * CGFloat(y)
                    let temptile=SKSpriteNode(imageNamed: "grass01")
                    temptile.position=CGPoint(x: posX, y: posY)
                    temptile.zPosition = -100
                    theScene!.irAnchor.addChild(temptile)
                }//for x
            }//for y
        }//mapPosition()

            mapPosition()
    }//init

    
    
    init()
    {
      // This initializer should never be used
                  
    
    }

}
