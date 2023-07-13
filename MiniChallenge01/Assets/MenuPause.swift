//
//  MenuPause.swift
//  MiniChallenge01
//
//  Created by Thiago Pereira de Menezes on 13/07/23.
//

import SpriteKit


class MenuPause: SKScene {
//    let menuBackground:SKSpriteNode = SKSpriteNode(color: .systemGray4, size: CGSize(width: 250, height: 400))
//    var red = SKSpriteNode()
//    override func didMove(to view: SKView) {
//        red = self.childNode(withName: "Red") as? SKSpriteNode ?? SKSpriteNode()
//
//    }
    
    var red = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        red = self.childNode(withName: "red") as? SKSpriteNode ?? SKSpriteNode()
        red.size = CGSize(width: 400, height: 4000)
        
    }
}
