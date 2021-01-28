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
    var mapTex=SKSpriteNode()
    var colorOffset:CGFloat=0.0
    var topLayer=SKTileMapNode()
    
    
    // constants
    let map = SKNode()
    let tileSet = 0
    let tileSize = CGSize(width: 128, height: 128)
    let columns = 128//n/a
    let rows = 128//n/a

    init()
    {
        let titleSet = SKTileSet(named: "")
        
        func makeNoiseMap(columns: Int, rows: Int) -> GKNoiseMap {
            
            let seed=Int32(random(min: 1, max: 50000))
            //let source = GKBillowNoiseSource(frequency: 0.015, octaveCount: 2, persistence: 0.2, lacunarity: 0.005, seed: seed)
            let source=GKPerlinNoiseSource()
            source.persistence = 0.8
            
            let noise = GKNoise(source)
            let sizeRange=random(min: 3.5, max: 6.0)
            let size = vector2(Double(sizeRange), Double(sizeRange))
            let origin = vector2(0.0, 0.0)
            let sampleCount = vector2(Int32(columns), Int32(rows))
            
            return GKNoiseMap(noise, size: size, origin: origin, sampleCount: sampleCount, seamless: true)
        }
        
        let noiseMap = makeNoiseMap(columns: columns, rows: rows)
        
          for column in 0 ..< columns {
                  for row in 0 ..< rows {
                      let location = vector2(Int32(row), Int32(column))
                      let terrainHeight = noiseMap.value(at: location)
                     
//                      if terrainHeight < -0.5 {
//                          topLayer.setTileGroup(deadGrass, forColumn: column, row: row)
//                      } else if terrainHeight < 0.5{
//                          topLayer.setTileGroup(grassTiles, forColumn: column, row: row)
//                      }
//                      else
//                      {
//                          topLayer.setTileGroup(grass01Tiles, forColumn: column, row: row)
//                      }
                  }
              }

        
    
    }

}
