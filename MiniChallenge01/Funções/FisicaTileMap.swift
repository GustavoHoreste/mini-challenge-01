//
//  File.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 14/07/23.
//

import Foundation
import SpriteKit
import SwiftUI
import GameplayKit


//MARK: Dar fisica para o tileMap - Arthur
func createTileMapColliders(_ tilemap: SKTileMapNode) {
    let tileSize = tilemap.tileSize
    
    // Defina a escala dos objetos com base na relação entre o tamanho do tile e o tamanho desejado dos objetos
    let scaleX: CGFloat = 1
    let scaleY: CGFloat = 1
    
    for row in 0..<tilemap.numberOfRows {
        for column in 0..<tilemap.numberOfColumns {
            if let tileDefinition = tilemap.tileDefinition(atColumn: column, row: row),
               let textures = tileDefinition.textures as? [SKTexture] {
                let tilePos = tilemap.centerOfTile(atColumn: column, row: row)
                
                for texture in textures {
                    let textureSize = texture.size()
                    let scaledSize = CGSize(width: textureSize.width * scaleX, height: textureSize.height * scaleY)
                    let scaledPos = CGPoint(x: tilePos.x * tilemap.xScale, y: tilePos.y * tilemap.yScale)
                    
                    let square = SKSpriteNode(texture: texture, size: scaledSize)
                    square.position = scaledPos
                    square.physicsBody = SKPhysicsBody(rectangleOf: scaledSize)
                    square.physicsBody?.isDynamic = false
                    square.physicsBody?.affectedByGravity = false
                    square.physicsBody?.allowsRotation = false
                    square.physicsBody?.restitution = 0.0
                    square.name = "Chao"
                    square.physicsBody?.categoryBitMask = bitMasks.ground.rawValue
                    tilemap.addChild(square)
                }
            }
        }
    }
}


