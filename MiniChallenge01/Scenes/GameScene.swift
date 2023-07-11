//
//  GameScene.swift
//  MiniChallenge01
//
//  Created by Thiago Pereira de Menezes on 11/07/23.
//
// TEste
import UIKit
import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        self.view?.backgroundColor = .blue
        
        //Apenas um teste para ver se estava funcionando a view.
        let bolinha:SKShapeNode = SKShapeNode(circleOfRadius: 25)
        bolinha.fillColor = .purple
        bolinha.strokeColor = .green
        bolinha.lineWidth = 3
        bolinha.position = CGPoint(x: 100, y: 100)
        self.addChild(bolinha)
        
        let spriteQuadrado:SKSpriteNode = SKSpriteNode(color: .systemGreen, size: CGSize(width: 200, height: 100))
        
        let btn:SKButtonNode = SKButtonNode(image: spriteQuadrado, label: SKLabelNode(text: "Start!"), action: { print("funcionou!") })
        
        btn.position = CGPoint(x: 200, y: 700)
        
        self.addChild(btn)

        
    }
}
