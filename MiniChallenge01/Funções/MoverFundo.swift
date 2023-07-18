//
//  MoverFundo.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 17/07/23.
//

import Foundation
import SpriteKit

func moverFundo(in scene: GameScene, objetoDummy: SKNode) {
    
    let moveFundo = SKAction.moveBy(x: 0, y: -scene.size.height, duration: 13)
    let reposicionarFundo = SKAction.moveBy(x: 0, y: scene.size.height, duration: 0)
    let sequencia = SKAction.sequence([moveFundo, reposicionarFundo])
    let infinito = SKAction.repeatForever(sequencia)

    for i in 0..<2 {
        let imagemFundo = SKSpriteNode(imageNamed: "background_1")
        imagemFundo.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        imagemFundo.size = scene.size
        imagemFundo.position = CGPoint(x: 0, y: scene.size.height * CGFloat(i))
        imagemFundo.zPosition = -1
        imagemFundo.run(infinito)
        objetoDummy.addChild(imagemFundo)
    }
}


