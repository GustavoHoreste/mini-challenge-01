//
//  MoverTileMap.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 14/07/23.
//

import Foundation
import SpriteKit


//MARK: Mover tile map - Arthur

func moveTileMap(_ map: SKTileMapNode) -> CGFloat {
    let moveDuration = TimeInterval(map.mapSize.height / (100 * map.xScale))
    let moveAction = SKAction.moveBy(x: 0, y: -map.mapSize.height, duration: moveDuration)
    let sequenceAction = SKAction.sequence([moveAction])
    let repeatAction = SKAction.repeatForever(sequenceAction)
        
    map.run(repeatAction)
    return map.mapSize.height / CGFloat(moveDuration)
}

