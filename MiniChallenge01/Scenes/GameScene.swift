//
//  GameScene.swift
//  MiniChallenge01
//
//  Created by Thiago Pereira de Menezes on 11/07/23.
//

import UIKit
import SpriteKit
import SwiftUI

let menuBackground:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "backgroundMenuPause"), size: CGSize(width: 615, height: 879))

let menuSettingsBackground:SKSpriteNode = SKSpriteNode(color: .systemGray3, size: CGSize(width: 250, height: 500))

var menuAberto:Bool? = false

class GameScene: SKScene {

    override func didMove(to view: SKView) {
        self.view?.backgroundColor = .blue
        
        let spriteBtnPause = SKSpriteNode(texture: SKTexture(imageNamed: "pauseButtonBackground"))
        let btnPause:SKButtonNode = SKButtonNode(image: spriteBtnPause, label: SKLabelNode(text: ""), action: {
            if(menuAberto == false) {
                self.openMenu()
                
                menuAberto = true
            }
        })
        
        btnPause.position = CGPoint(x: frame.maxX - 70, y: frame.maxY - 70)
        self.addChild(btnPause)
        

        
    }
    
    func openMenu() {
        if(menuBackground.children.count > 0) {
            self.addChild(menuBackground)
        } else {
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
                self.openMenuSettings()
            })
            btnSettings.position = CGPoint(x: 0, y: -40)
            menuBackground.addChild(btnSettings)
            
            let spriteBtnExit:SKSpriteNode = SKSpriteNode(color: .systemPink, size: CGSize(width: 200, height: 70))
            let btnExit:SKButtonNode = SKButtonNode(image: spriteBtnExit, label: SKLabelNode(text: "Exit"), action: {
                print("exit")
            })
            btnExit.position = CGPoint(x: 0, y: -130)
            menuBackground.addChild(btnExit)
            
            let spriteBtnSairMenu:SKSpriteNode = SKSpriteNode(color: .systemMint, size: CGSize(width: 30, height: 30))
            let btnSairMenu:SKButtonNode = SKButtonNode(image: spriteBtnSairMenu, label: SKLabelNode(text: ""), action: {
                self.closeMenu()
            })
            btnSairMenu.position = CGPoint(x: 100, y: 170)
            menuBackground.addChild(btnSairMenu)
        }
    }
    
    func closeMenu() {
        if(menuAberto == true) {
            menuBackground.removeFromParent()
            menuAberto = false
        }
    }
    
    func openMenuSettings() {
  
        menuSettingsBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        menuSettingsBackground.zPosition = -1
        self.addChild(menuSettingsBackground)

        let spriteBtnMusica = SKSpriteNode(color: .systemPurple, size: CGSize(width: 200, height: 70))
        let btnMusica = SKButtonNode(image: spriteBtnMusica, label: SKLabelNode(text: "Música")) {
            print("musica")
        }
        btnMusica.position = CGPoint(x: 0, y: 180)
        menuSettingsBackground.addChild(btnMusica)

        let spriteBtnSom = SKSpriteNode(color: .systemPurple, size: CGSize(width: 200, height: 70))
        let btnSom = SKButtonNode(image: spriteBtnSom, label: SKLabelNode(text: "Som")) {
            print("som")
        }
        btnSom.position = CGPoint(x: 0, y: 90)
        menuSettingsBackground.addChild(btnSom)

        let spriteBtnJoystick = SKSpriteNode(color: .systemPurple, size: CGSize(width: 200, height: 70))
        let btnJoystick = SKButtonNode(image: spriteBtnJoystick, label: SKLabelNode(text: "Joystick")) {
            print("Joystick")
        }
        menuSettingsBackground.addChild(btnJoystick)

        let spriteBtnIdioma = SKSpriteNode(color: .systemPurple, size: CGSize(width: 200, height: 70))
        let btnIdioma = SKButtonNode(image: spriteBtnIdioma, label: SKLabelNode(text: "Idioma")) {
            print("idioma")
        }
        btnIdioma.position = CGPoint(x: 0, y: -90)
        menuSettingsBackground.addChild(btnIdioma)

        let spriteBtnSobre = SKSpriteNode(color: .systemPurple, size: CGSize(width: 200, height: 70))
        let btnSobre = SKButtonNode(image: spriteBtnSobre, label: SKLabelNode(text: "Sobre")) {
            print("sobre")
        }
        btnSobre.position = CGPoint(x: 0, y: -180)
        menuSettingsBackground.addChild(btnSobre)
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


