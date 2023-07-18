//
//  File.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 17/07/23.
//

import Foundation
import SpriteKit

func criarMoedor(in scene:GameScene){
    
    let textures: [SKTexture] = getTextures(with: "Meatgrinder", textureAtlasName: "meatgrinder")
    
    
    let node = SKSpriteNode (texture: textures [0])
    node.setScale(1.5)
    node.position = CGPoint(x: scene.frame.midX, y: scene.frame.minY + scene.frame.height*0.04)
    node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: node.size.width, height: node.size.height))
    node.physicsBody?.isDynamic = false
    node.physicsBody?.affectedByGravity = false
    node.physicsBody?.allowsRotation = false
    node.zPosition = 100
    scene.addChild(node)
    let action = SKAction.animate(with: textures, timePerFrame: 1 / TimeInterval(textures.count), resize: true,
    restore: true)
    node.run(SKAction.repeatForever(action))
    
}
