//
//  TextoTela.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 16/07/23.
//

import Foundation
import SpriteKit

func gerarTexto(in scene:GameScene, texto:SKLabelNode){
    
    texto.text = "Aperte na tela"
    texto.fontSize = 50
    texto.position = CGPoint(x: scene.frame.midX, y: 150)
    texto.fontColor = .black
    scene.addChild(texto)
    
}

