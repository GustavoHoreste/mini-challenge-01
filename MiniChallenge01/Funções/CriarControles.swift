//
//  CriarControles.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 14/07/23.
//

import Foundation
import SpriteKit

//MARK: Função para posicionar os controles - Arthur
func criarControles(in scene: GameScene) -> (SKSpriteNode, SKSpriteNode, SKSpriteNode)  {
    
    let controleDireito:SKSpriteNode = SKSpriteNode()
    let controleEsquerdo:SKSpriteNode = SKSpriteNode()
    let controlePular:SKSpriteNode = SKSpriteNode()
    
    controleEsquerdo.size = CGSize(width: 100, height: 100)
    controleEsquerdo.position = CGPoint(x: scene.frame.midX-200, y: -400)
    controleEsquerdo.color = .black
    controleEsquerdo.zPosition = 100
    controleEsquerdo.name = "Esquerdo"
    scene.addChild(controleEsquerdo)
    
    controleDireito.size = CGSize(width: 100, height: 100)
    controleDireito.position = CGPoint(x: scene.frame.midX - 90, y: -400)
    controleDireito.color = .black
    controleDireito.zPosition = 100
    controleDireito.name = "Direito"
    scene.addChild(controleDireito)
    
    controlePular.size = CGSize(width: 100, height: 100)
    controlePular.position = CGPoint(x: 200, y: -400)
    controlePular.zPosition = 100
    controlePular.color = .black
    controlePular.name = "Pular"
    scene.addChild(controlePular)
    
    return (controleEsquerdo, controleDireito, controlePular)
}
