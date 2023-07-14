//
//  CriarPersonagem.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 14/07/23.
//

import Foundation
import SpriteKit

func criarPersonagem(in scene:GameScene, _ personagem:SKSpriteNode){
    
    personagem.size = CGSize(width: 60, height: 60)
    personagem.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: personagem.size.width - 10, height: personagem.size.height))
    personagem.physicsBody?.isDynamic = true
    personagem.physicsBody?.affectedByGravity = true
    personagem.physicsBody?.categoryBitMask = 1
    personagem.physicsBody?.contactTestBitMask = 2
    personagem.physicsBody?.allowsRotation = false
    personagem.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
    scene.addChild(personagem)
    
}
