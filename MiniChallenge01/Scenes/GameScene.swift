//
//  GameScene.swift
//  MiniChallenge01
//
//  Created by Thiago Pereira de Menezes on 11/07/23.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        self.view?.backgroundColor = .blue
        
        let menuBackground:SKSpriteNode = SKSpriteNode(color: .systemGray4, size: CGSize(width: 250, height: 400))
        menuBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        menuBackground.zPosition = -1
        self.addChild(menuBackground)
        
        let spriteBtnPlay:SKSpriteNode = SKSpriteNode(color: .systemGreen, size: CGSize(width: 200, height: 70))
        let btnPlay:SKButtonNode = SKButtonNode(image: spriteBtnPlay, label: SKLabelNode(text: "Play"), action: {
            print("play")
        })
        btnPlay.position = CGPoint(x: 0, y: 140)
        menuBackground.addChild(btnPlay)
        
        let spriteBtnRepeat:SKSpriteNode = SKSpriteNode(color: .systemBlue, size: CGSize(width: 200, height: 70))
        let btnRepeat:SKButtonNode = SKButtonNode(image: spriteBtnRepeat, label: SKLabelNode(text: "Repeat"), action: {
            print("repeat")
        })
        btnRepeat.position = CGPoint(x: 0, y: 50)
        menuBackground.addChild(btnRepeat)
        
        let spriteBtnSettings:SKSpriteNode = SKSpriteNode(color: .systemGray, size: CGSize(width: 200, height: 70))
        let btnSettings:SKButtonNode = SKButtonNode(image: spriteBtnSettings, label: SKLabelNode(text: "Settings"), action: {
            print("settings")
        })
        btnSettings.position = CGPoint(x: 0, y: -40)
        menuBackground.addChild(btnSettings)
        
        let spriteBtnExit:SKSpriteNode = SKSpriteNode(color: .systemPink, size: CGSize(width: 200, height: 70))
        let btnExit:SKButtonNode = SKButtonNode(image: spriteBtnExit, label: SKLabelNode(text: "Exit"), action: {
            print("exit")
        })
        btnExit.position = CGPoint(x: 0, y: -130)
        menuBackground.addChild(btnExit)
        
        
                                                       
                                                       
                                                       
    }
    
    func openMenu() {
        
    }
}

/* MARK: MenuPause com sprites prontos
 let backgroundMenu:SKSpriteNode = SKSpriteNode(imageNamed: "menuPauseBackground")
 backgroundMenu.zPosition = -1
 backgroundMenu.position = CGPoint(x: frame.midX, y: frame.midY)
 backgroundMenu.setScale(3.0)
 self.addChild(backgroundMenu)
 
 let labelButtonPlay:SKLabelNode = SKLabelNode(text: "Play")
 labelButtonPlay.fontName = "alagard"
 labelButtonPlay.fontSize = labelButtonPlay.fontSize * 0.2

 let buttonPlay:SKButtonNode = SKButtonNode(image: SKSpriteNode(imageNamed: "playButtonBackground"), label: labelButtonPlay, action: { print("play!") })
 buttonPlay.position = CGPoint(x: frame.midX, y: frame.midY)
 self.addChild(buttonPlay)
 
 
 let labelButtonRepeat:SKLabelNode = SKLabelNode(fontNamed: "Alagard")
 labelButtonRepeat.text = "testeeeeee"
 labelButtonRepeat.zPosition = 100
 labelButtonRepeat.fontSize = labelButtonRepeat.fontSize * 0.2

 let buttonRepeat:SKButtonNode = SKButtonNode(image: SKSpriteNode(imageNamed: "repeatButtonBackground"), label: labelButtonRepeat, action: { print("replay!") })
 buttonRepeat.position = CGPoint(x: frame.midX, y: frame.midY - 30)
 self.addChild(buttonRepeat)
 
 
 let labelButtonSettings:SKLabelNode = SKLabelNode(text: "Settings")
 labelButtonSettings.fontName = "alagard"
 labelButtonSettings.fontSize = labelButtonPlay.fontSize * 0.2

 let buttonSettings:SKButtonNode = SKButtonNode(image: SKSpriteNode(imageNamed: "settingsButtonBackground"), label: labelButtonSettings, action: { print("settings!") })
 buttonSettings.position = CGPoint(x: frame.midX, y: frame.midY - 60)
 self.addChild(buttonSettings)
 
 let labelButtonExit:SKLabelNode = SKLabelNode(text: "Exit")
 labelButtonExit.fontName = "alagard"
 labelButtonExit.fontSize = labelButtonExit.fontSize * 0.2

 let buttonExit:SKButtonNode = SKButtonNode(image: SKSpriteNode(imageNamed: "exitButtonBackground"), label: labelButtonExit, action: { print("exit!") })
 buttonExit.position = CGPoint(x: frame.midX, y: frame.midY - 90)
 self.addChild(buttonExit)
 
 let node = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
 self.addChild(node)
 node.position = CGPoint(x: 0, y: view.bounds.size.height/2)
 */
