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
        
        let bolinha:SKShapeNode = SKShapeNode(circleOfRadius: 25)
        bolinha.fillColor = .purple
        bolinha.strokeColor = .green
        bolinha.lineWidth = 3
        bolinha.position = CGPoint(x: 100, y: 100)
        self.addChild(bolinha)
        
        }
}
