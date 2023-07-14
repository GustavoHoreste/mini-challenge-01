//
//  MoverTileMap.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 14/07/23.
//

import Foundation
import SpriteKit


//MARK: Mover tile map - Arthur

func moveTileMap(_ map: SKTileMapNode, in scene:GameScene) {

    let tileSize =  CGSize(width: map.numberOfColumns, height: map.numberOfRows)

    let moveAction = SKAction.moveBy(x: 0, y: -scene.frame.height, duration: 5)
    let resetAction = SKAction.moveBy(x: -0, y: scene.frame.height, duration: 0.0)
    let removeAction = SKAction.removeFromParent()
    let sequenceAction = SKAction.sequence([moveAction])
    let repeatAction = SKAction.repeatForever(sequenceAction)

    map.run(repeatAction)
    
}
