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
    var treeLayer = SKTileMapNode()
    let map = SKNode()
    // constants
    
    
    init(scene: GameScene)
    {
        theScene = scene
        theScene!.irAnchor.addChild(map)
        
        let tileSet = SKTileSet(named: "Grass Map")!
        let tileSize = CGSize(width: 128, height: 128)
        let columns = 128
        let rows = 128
        let grassTiles = tileSet.tileGroups.first { $0.name == "grass01"}
        let sandTiles = tileSet.tileGroups.first { $0.name == "sand"}
        let dirtTiles = tileSet.tileGroups.first { $0.name == "dirt"}
        let waterTiles = tileSet.tileGroups.first { $0.name == "water"}
        let tree = SKSpriteNode(imageNamed: "tree_large")
        
        let bottomLayer = SKTileMapNode(tileSet: tileSet, columns: columns, rows: rows, tileSize: tileSize)
        bottomLayer.fill(with: waterTiles)
        
        map.addChild(bottomLayer)

        let treeSet = SKTileSet(named: "treee")!

        treeLayer = SKTileMapNode(tileSet: treeSet, columns: columns, rows: rows, tileSize: tileSize)
        let treeTiles = treeSet.tileGroups.first { $0.name == "tree"}
        map.addChild(treeLayer)
        treeLayer.enableAutomapping = true
        treeLayer.zPosition = 99999
        treeLayer.fill(with: treeTiles)

        
        func mapPosition()
        {
            var x = map.position.x
            var y = map.position.y
            
            for y in 0...127
            {
                for x in 0...127
                {
                    var posX:CGFloat = 0
                    var posY:CGFloat = 0

                    posX = -64 * tileWidth + tileWidth * CGFloat(x)
                    posY = -64 * tileWidth + tileWidth * CGFloat(y)
                    /*
                    let temptile=SKSpriteNode(imageNamed: "grass01")
                    temptile.position=CGPoint(x: posX, y: posY)
                    temptile.zPosition = -100
                    theScene!.irAnchor.addChild(temptile)
                    */
                } //for
             } //for
        } // func mapPosition

        mapPosition()
        
        topLayer = SKTileMapNode(tileSet: tileSet, columns: columns, rows: rows, tileSize: tileSize)
        topLayer.enableAutomapping = true
        map.addChild(topLayer)
        // creates the noisemap
        
        func makeNoiseMap1(columns: Int, rows: Int) -> GKNoiseMap
        {
            let seed = Int32(random(min: 1, max: 50000))
            //let source = GKBillowNoiseSource(frequency: 0.015, octaveCount: 2, persistence: 0.2, lacunarity: 0.005, seed: seed)
            let source=GKPerlinNoiseSource()
            source.persistence = 0.8
              
            let noise = GKNoise(source)
            let sizeRange=random(min: 3.5, max: 6.0)
            let size = vector2(Double(sizeRange), Double(sizeRange))
            let origin = vector2(0.0, 0.0)
            let sampleCount = vector2(Int32(columns), Int32(rows))
              
            return GKNoiseMap(noise, size: size, origin: origin, sampleCount: sampleCount, seamless: true)
        } // func makeNoiseMap
          
        let noiseMap1 = makeNoiseMap1(columns: columns, rows: rows)
        let mapT1 = SKTexture(noiseMap: noiseMap1)
        mapText1 = SKSpriteNode(texture: mapT1)
        // Generates different tiles depending on terrain height
        
        func makeNoiseMap2(columns: Int, rows: Int) -> GKNoiseMap
        {
            let seed = Int32(random(min: 1, max: 50000))
            //let source = GKBillowNoiseSource(frequency: 0.015, octaveCount: 2, persistence: 0.2, lacunarity: 0.005, seed: seed)
            let source=GKPerlinNoiseSource()
            source.persistence = 0.8
              
            let noise = GKNoise(source)
            let sizeRange=random(min: 3.5, max: 6.0)
            let size = vector2(Double(sizeRange), Double(sizeRange))
            let origin = vector2(0.0, 0.0)
            let sampleCount = vector2(Int32(columns), Int32(rows))
              
            return GKNoiseMap(noise, size: size, origin: origin, sampleCount: sampleCount, seamless: true)
        } // func makeNoiseMap
          
        let noiseMap2 = makeNoiseMap2(columns: columns, rows: rows)
        let mapT2 = SKTexture(noiseMap: noiseMap2)
        mapText2 = SKSpriteNode(texture: mapT2)
        
        for column in 0 ..< columns
        {
            for row in 0 ..< rows
            {
                let location = vector2(Int32(row), Int32(column))
                let terrainHeight = noiseMap2.value(at: location)
                
                if (terrainHeight > -0.5 && terrainHeight < -0.2)
                {
                    topLayer.setTileGroup(dirtTiles, forColumn: column, row: row)
                } // if
                
                else if (terrainHeight < 0.5)
                {
                    topLayer.setTileGroup(grassTiles, forColumn: column, row: row)
                } // else if
                else if (terrainHeight < 1 && terrainHeight > 0.5)
                {
                    topLayer.setTileGroup(sandTiles, forColumn: column, row: row)
                } // else if
            } // for
        } // for
    } // init
} // class MapClass
