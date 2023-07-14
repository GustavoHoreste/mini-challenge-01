//
//  MenuPause.swift
//  MiniChallenge01
//
//  Created by Thiago Pereira de Menezes on 11/07/23.
//

import Foundation
import SpriteKit

class SKMenuPauseNode: SKNode {
    
    func gerarPause() {
        
        let buttonPlay:SKButtonNode = SKButtonNode(image: SKSpriteNode(imageNamed: "playButtonBackground"), label: SKLabelNode(text: ""), action: { print("") })
        buttonPlay.position = CGPoint(x: 0, y: 0)
        self.addChild(buttonPlay)
        
        let buttonRepeat:SKButtonNode = SKButtonNode(image: SKSpriteNode(imageNamed: "repeatButtonBackground"), label: SKLabelNode(text: ""), action: { print("replay!") })
        buttonRepeat.position = CGPoint(x: 0, y: -30)
        self.addChild(buttonRepeat)
        
        let buttonSettings:SKButtonNode = SKButtonNode(image: SKSpriteNode(imageNamed: "settingsButtonBackground"), label: SKLabelNode(text: ""), action: { print("settings!") })
        buttonSettings.position = CGPoint(x: 0, y: -60)
        self.addChild(buttonSettings)
        
        let buttonExit:SKButtonNode = SKButtonNode(image: SKSpriteNode(imageNamed: "exitButtonBackground"), label: SKLabelNode(text: ""), action: { print("exit!") })
        buttonExit.position = CGPoint(x: 0, y: -90)
        self.addChild(buttonExit)
        
    }
}
