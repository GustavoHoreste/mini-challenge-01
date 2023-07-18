//
//  AbrirMenu.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 14/07/23.
//

import Foundation
import SpriteKit


func openMenuSettings(in scene:GameScene) {


    menuSettingsBackground.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
    menuSettingsBackground.zPosition = 11
    scene.addChild(menuSettingsBackground)

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
