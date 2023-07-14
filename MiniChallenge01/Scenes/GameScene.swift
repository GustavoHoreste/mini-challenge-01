//
//  GameScene.swift
//  MiniChallenge01
//
//  Created by Thiago Pereira de Menezes on 11/07/23.
//
// TEste
import UIKit
import SpriteKit
import SwiftUI

let screenSize = UIScreen.main.bounds.size

let screenWidth = screenSize.width
let screenHeight = screenSize.height


let menuBackground:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "backgroundMenuPause"), size: CGSize(width: 84.42 / 100.0 * screenWidth, height: 55.4 / 100.0 * screenHeight))


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
            } else {
                self.closeMenu()
                menuAberto = false
            }
        })
        
        btnPause.position = CGPoint(x: frame.maxX - 70, y: frame.maxY - 70)
        self.addChild(btnPause)
        

        
    }
    
    func openMenu() {
//        menuBackground.anchorPoint = CGPoint(x: 0, y: 0)

        if(menuBackground.children.count > 0) {
            self.addChild(menuBackground)
        } else {
            menuBackground.position = CGPoint(x: frame.midX, y: frame.midY)
            menuBackground.zPosition = -1
            self.addChild(menuBackground)
            
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
                self.closeMenu()
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
            let btnSettings:SKButtonNode = SKButtonNode(image: spriteBtnSettings, label: SKLabelNode(text: "Settings"), action: {
                self.openMenuSettings()
            })
            btnSettings.position = CGPoint(x: menuWidth * ((((0 * 100) / (menuWidth / 2)) / 100) / 2), y: menuHeight * ((((-65 * 100) / (menuHeight / 2)) / 100) / 2))
            menuBackground.addChild(btnSettings)
            
            let spriteBtnExit:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "exitButtonBackground"), size: CGSize(width: 41.05 / 100.0 * menuWidth, height: 14.67 / 100.0 * menuHeight))
            let btnExit:SKButtonNode = SKButtonNode(image: spriteBtnExit, label: SKLabelNode(text: "Exit"), action: {
                print("exit")
            })
            btnExit.position = CGPoint(x: menuWidth * ((((0 * 100) / (menuWidth / 2)) / 100) / 2), y: menuHeight * ((((-148 * 100) / (menuHeight / 2)) / 100) / 2))
            menuBackground.addChild(btnExit)
//
//            let spriteBtnSairMenu:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: ""), size: CGSize(width: 149, height: 76))
//            let btnSairMenu:SKButtonNode = SKButtonNode(image: spriteBtnSairMenu, label: SKLabelNode(text: ""), action: {
//                self.closeMenu()
//            })
//            btnSairMenu.position = CGPoint(x: 100, y: 170)
//            menuBackground.addChild(btnSairMenu)
        }
    }
    
    func closeMenu() {
        if(menuAberto == true) {
            menuBackground.removeFromParent()
            menuAberto = false
        }
    }
    
    func openMenuSettings() {


        menuSettingsBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        menuSettingsBackground.zPosition = -1
        self.addChild(menuSettingsBackground)

        //CGSize(width: 84.42 / 100.0 * screenWidth, height: 55.4 / 100.0 * screenHeight))
        

        let spriteBtnMusica = SKSpriteNode(color: .systemPurple, size: CGSize(width: 41.05 / 100.0 * screenWidth, height: 14.67 / 100.0 * screenHeight))
        let btnMusica = SKButtonNode(image: spriteBtnMusica, label: SKLabelNode(text: "Música")) {
            print("musica")
        }
        btnMusica.position = CGPoint(x: 0, y: 180)
        menuSettingsBackground.addChild(btnMusica)

        let spriteBtnSom = SKSpriteNode(color: .systemPurple, size: CGSize(width: 41.05 / 100.0 * screenWidth, height: 14.67 / 100.0 * screenHeight))
        let btnSom = SKButtonNode(image: spriteBtnSom, label: SKLabelNode(text: "Som")) {
            print("som")
        }
        btnSom.position = CGPoint(x: 0, y: 90)
        menuSettingsBackground.addChild(btnSom)

        let spriteBtnJoystick = SKSpriteNode(color: .systemPurple, size: CGSize(width: 41.05 / 100.0 * screenWidth, height: 14.67 / 100.0 * screenHeight))
        let btnJoystick = SKButtonNode(image: spriteBtnJoystick, label: SKLabelNode(text: "Joystick")) {
            print("Joystick")
        }
        menuSettingsBackground.addChild(btnJoystick)

        let spriteBtnIdioma = SKSpriteNode(color: .systemPurple, size: CGSize(width: 41.05 / 100.0 * screenWidth, height: 14.67 / 100.0 * screenHeight))
        let btnIdioma = SKButtonNode(image: spriteBtnIdioma, label: SKLabelNode(text: "Idioma")) {
            print("idioma")
        }
        btnIdioma.position = CGPoint(x: 0, y: -90)
        menuSettingsBackground.addChild(btnIdioma)

        let spriteBtnSobre = SKSpriteNode(color: .systemPurple, size: CGSize(width: 41.05 / 100.0 * screenWidth, height: 14.67 / 100.0 * screenHeight))
        let btnSobre = SKButtonNode(image: spriteBtnSobre, label: SKLabelNode(text: "Sobre")) {
            print("sobre")
        }
        btnSobre.position = CGPoint(x: 0, y: -180)
        menuSettingsBackground.addChild(btnSobre)
    }
}
