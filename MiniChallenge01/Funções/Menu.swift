//
//  Menu.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 14/07/23.
//

import Foundation
import SpriteKit


func openMenu(in scene:GameScene) {
//        menuBackground.anchorPoint = CGPoint(x: 0, y: 0)

    if(menuBackground.children.count > 0) {
        scene.addChild(menuBackground)
    } else {
        menuBackground.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
        menuBackground.zPosition = 10
        scene.addChild(menuBackground)
        
//            let menuBackground = SKSpriteNode(texture: SKTexture(imageNamed: "backgroundMenuPause"), size: CGSize(width: 615, height: 879))

        let menuSize = menuBackground.size

        let menuWidth = menuSize.width
        let menuHeight = menuSize.height
        
        print("\n\nmenu:")
        print(menuSize)
        print(menuWidth)
        print(menuHeight)
        
        //CGSize(width: 84.42 / 100.0 * screenWidth, height: 55.4 / 100.0 * screenHeight))

        let spriteBtnPlay:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "resumeButtonBackground"), size: CGSize(width: 41.05 / 100.0 * menuWidth, height: 14.67 / 100.0 * menuHeight))
        let btnPlay:SKButtonNode = SKButtonNode(image: spriteBtnPlay, label: SKLabelNode(text: "Play"), action: {
            print("play")
            closeMenu()
        })
        
//            var calculo = ((((100 * 100) / (menuHeight / 2)) / 100) / 2)
//            print(calculo)
        btnPlay.position = CGPoint(x: menuWidth * ((((0 * 100) / (menuWidth / 2)) / 100) / 2), y: menuHeight * ((((100 * 100) / (menuHeight / 2)) / 100) / 2))
        menuBackground.addChild(btnPlay)
        
        let spriteBtnRepeat:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "restartButtonBackground"), size: CGSize(width: 41.05 / 100.0 * menuWidth, height: 14.67 / 100.0 * menuHeight))
        let btnRepeat:SKButtonNode = SKButtonNode(image: spriteBtnRepeat, label: SKLabelNode(text: "ue"), action: {
            print("repeat")
        })
      
        btnRepeat.position = CGPoint(x: menuWidth * ((((0 * 100) / (menuWidth / 2)) / 100) / 2), y: menuHeight * ((((16 * 100) / (menuHeight / 2)) / 100) / 2))
        menuBackground.addChild(btnRepeat)
        
        let spriteBtnSettings:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "settingsButtonBackground"), size: CGSize(width: 41.05 / 100.0 * menuWidth, height: 14.67 / 100.0 * menuHeight))
        let btnSettings:SKButtonNode = SKButtonNode(image: spriteBtnSettings, label: SKLabelNode(text: "Settings"), action: {openMenuSettings(in: scene)})
        btnSettings.position = CGPoint(x: menuWidth * ((((0 * 100) / (menuWidth / 2)) / 100) / 2), y: menuHeight * ((((-65 * 100) / (menuHeight / 2)) / 100) / 2))
        menuBackground.addChild(btnSettings)
        
        let spriteBtnExit:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "exitButtonBackground"), size: CGSize(width: 41.05 / 100.0 * menuWidth, height: 14.67 / 100.0 * menuHeight))
        let btnExit:SKButtonNode = SKButtonNode(image: spriteBtnExit, label: SKLabelNode(text: "Exit"), action: {
            print("exit")
        })
        btnExit.position = CGPoint(x: menuWidth * ((((0 * 100) / (menuWidth / 2)) / 100) / 2), y: menuHeight * ((((-148 * 100) / (menuHeight / 2)) / 100) / 2))
        menuBackground.addChild(btnExit)

    }
}
