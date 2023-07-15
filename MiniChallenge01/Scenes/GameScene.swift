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


let menuBackground:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "backgroundMenuPause"), size: CGSize(width: 84.00 / 100.0 * screenWidth, height: 54.0 / 100.0 * screenHeight))

let menuSettingsBackground:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "settingsMenuBackground"), size: CGSize(width: 75 / 100.0 * screenWidth, height: 70 / 100.0 * screenHeight))

let menuSettingsLanguagesBackground = SKSpriteNode(texture: SKTexture(imageNamed: "backgroundPequeno"),
    size: CGSize(width: 73.5 / 100.0 * screenWidth, height: 32.5 / 100.0 * screenHeight)
)

var menuAberto:Bool? = false
var menuSettingsAberto:Bool? = false

class GameScene: SKScene {

    override func didMove(to view: SKView) {
        self.view?.backgroundColor = .blue
        
        let spriteButtonPause = SKSpriteNode(texture: SKTexture(imageNamed: "pauseButtonBackground"))
        let buttonPause:SKButtonNode = SKButtonNode(image: spriteButtonPause, label: SKLabelNode(text: ""), action: {
           if(menuAberto == false) {
               self.openMenu()

                menuAberto = true
            } else {
                self.closeMenu()
                menuAberto = false
           }
       })

       buttonPause.position = CGPoint(x: frame.maxX - 70, y: frame.maxY - 70)
        self.addChild(buttonPause)
        
    //    self.openMenu()

        
    }
    
    func openMenu() {

        if(menuBackground.children.count > 0) {
            self.addChild(menuBackground)
        } else {
            menuBackground.position = CGPoint(x: frame.midX, y: frame.midY)
            menuBackground.zPosition = -1
            self.addChild(menuBackground)

            let menuWidth = menuBackground.size.width
            let menuHeight = menuBackground.size.height
            
            let buttonHeigth = 15.00 / 100.0 * menuHeight
            let buttonWidth = 40.00 / 100.0 * menuWidth
            
            //MARK: - labelPause
            let sprite = SKSpriteNode()
            let buttonSpritePause = SKButtonNode(image: sprite, label: SKLabelNode(text: "PAUSED")) {
                print("pause")
            }
            buttonSpritePause.position = CGPoint(x: 0,
                                              y: (menuHeight / 2) - buttonHeigth)
            menuBackground.addChild(buttonSpritePause)
            

            //MARK: - buttonPlay
            let spriteButtonPlay:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "resumeButtonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonPlay:SKButtonNode = SKButtonNode(image: spriteButtonPlay, label: SKLabelNode(text: "Play"), action: {
                print("play")
                self.closeMenu()
            })
            buttonPlay.position = CGPoint(x: 0,
                                       y: menuHeight / 4 - buttonHeigth / 2 )
            menuBackground.addChild(buttonPlay)
            
            
            
            //MARK: - buttonRepeat
            let spriteButtonRepeat:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "restartButtonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonRepeat:SKButtonNode = SKButtonNode(image: spriteButtonRepeat, label: SKLabelNode(text: "ue"), action: {
                print("repeat")
            })
            buttonRepeat.position = CGPoint(x: 0,
                                         y: 0)
            menuBackground.addChild(buttonRepeat)
            
            
            
            //MARK: - buttonSettings
            let spriteButtonSettings:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "settingsButtonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonSettings:SKButtonNode = SKButtonNode(image: spriteButtonSettings, label: SKLabelNode(text: "Settings"), action: {
                self.openMenuSettings()
            })
            buttonSettings.position = CGPoint(x: 0,
                                           y: -menuHeight / 4 + buttonHeigth / 2 )
            menuBackground.addChild(buttonSettings)
         
            
            //MARK: - buttonExit
            let spriteButtonExit:SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "exitButtonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonExit:SKButtonNode = SKButtonNode(image: spriteButtonExit, label: SKLabelNode(text: "Exit"), action: {
                print("exit")
            })
            buttonExit.position = CGPoint(x: 0,
                                       y: (-menuHeight / 2) + (buttonHeigth))
            menuBackground.addChild(buttonExit)
        }
    }
    
    func closeMenu() {
        if(menuAberto == true) {
            menuBackground.removeFromParent()
            menuAberto = false
        }
    }
    
    func closeMenuSettings() {
        menuSettingsBackground.removeFromParent()
        
        menuBackground.isHidden = false
    }
    
    func openMenuSettings() {
        
        menuBackground.isHidden = true
        
        if(menuSettingsBackground.children.count > 0) {
            self.addChild(menuSettingsBackground)
        } else {
            menuBackground.isHidden = true
            
            menuSettingsBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
            menuSettingsBackground.zPosition = -1
            self.addChild(menuSettingsBackground)
            
            
            let menuSettingsWidth = menuSettingsBackground.size.width
            let menuSettingsHeight = menuSettingsBackground.size.height
            
            let buttonHeigth = 14 / 100.0 * menuSettingsHeight
            let buttonWidth = 50 / 100.0 * menuSettingsWidth
            
            
            
            //MARK: - buttonMusica
            
            let spriteButtonMusica = SKSpriteNode(texture: SKTexture(imageNamed: "musicButtonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonMusica = SKButtonNode(image: spriteButtonMusica, label: SKLabelNode(text: "Música")) {
                print("musica")
            }
            buttonMusica.position = CGPoint(x: 0, y: 180)
            menuSettingsBackground.addChild(buttonMusica)
            
            
            //MARK: - buttonSom
            
            let spriteButtonSom = SKSpriteNode(texture: SKTexture(imageNamed: "soundButtonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonSom = SKButtonNode(image: spriteButtonSom, label: SKLabelNode(text: "Som")) {
                print("som")
            }
            buttonSom.position = CGPoint(x: 0, y: 90)
            menuSettingsBackground.addChild(buttonSom)
            
            //MARK: - buttonVoltar
            let buttonVoltar = SKButtonNode(image: SKSpriteNode(color: .systemMint, size: CGSize(width: 50, height: 50)), label: SKLabelNode(text: "")) {
                print("voltar")
                self.closeMenuSettings()
            }
            buttonVoltar.zPosition = 30
            buttonVoltar.position = CGPoint(x: -120, y: 260)
            menuSettingsBackground.addChild(buttonVoltar)
            
            
            //MARK: - buttonJoystick
            
            let spriteButtonJoystick = SKSpriteNode(texture: SKTexture(imageNamed: "joystickButtonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonJoystick = SKButtonNode(image: spriteButtonJoystick, label: SKLabelNode(text: "Joystick")) {
                print("Joystick")
                self.openMenuSettingsJoysticks()
            }
            buttonJoystick.position = CGPoint(x: 0, y: 0)
            menuSettingsBackground.addChild(buttonJoystick)
            
            
            //MARK: - buttonIdioma
            
            let spriteButtonIdioma = SKSpriteNode(texture: SKTexture(imageNamed: "languageButtonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonIdioma = SKButtonNode(image: spriteButtonIdioma, label: SKLabelNode(text: "Idiomas")) {
                print("idioma")
            }
            buttonIdioma.position = CGPoint(x: 0, y: -90)
            menuSettingsBackground.addChild(buttonIdioma)
            
            
            //MARK: - buttonSobre
            
            let spriteButtonSobre = SKSpriteNode(texture: SKTexture(imageNamed: "aboutButtonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonSobre = SKButtonNode(image: spriteButtonSobre, label: SKLabelNode(text: "Sobre")) {
                print("sobre")
            }
            buttonSobre.position = CGPoint(x: 0, y: -180)
            menuSettingsBackground.addChild(buttonSobre)
        }
    }
    
    func openMenuSettingsJoysticks() {
        
        menuSettingsBackground.isHidden = true
        
        if(menuSettingsLanguagesBackground.children.count > 0) {
            print("filho?")
            self.addChild(menuSettingsLanguagesBackground)

        } else {
            menuSettingsLanguagesBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
            self.addChild(menuSettingsLanguagesBackground)
         
            //MARK: - tamanhos dos buttons
            
            let menuSettingsWidth = menuSettingsBackground.size.width
            let menuSettingsHeight = menuSettingsBackground.size.height
            
            let buttonHeigth = 14 / 100.0 * menuSettingsHeight
            let buttonWidth = 50 / 100.0 * menuSettingsWidth
            
            //MARK: - buttonTheeWay

            let spriteButtonJoystickThreeWay = SKSpriteNode(texture: SKTexture(imageNamed: "buttonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonJoystickThreeWay = SKButtonNode(image: spriteButtonJoystickThreeWay, label: SKLabelNode(text: "Setas")) {
                print("controle de setas escolhido")
            }
            spriteButtonJoystickThreeWay.position = CGPoint(x: 0, y: 50)
            
            menuSettingsLanguagesBackground.addChild(buttonJoystickThreeWay)
            
            //MARK: - buttonSlider
            
            let spriteButtonJoystickSlider = SKSpriteNode(texture: SKTexture(imageNamed: "buttonBackground"), size: CGSize(width: buttonWidth, height: buttonHeigth))
            let buttonJoystickSlider = SKButtonNode(image: spriteButtonJoystickSlider, label: SKLabelNode(text: "Slider")) {
                print("controle slider escolhido")
            }
            buttonJoystickSlider.position = CGPoint(x: 0, y: -50)
            menuSettingsLanguagesBackground.addChild(buttonJoystickSlider)
            
            //MARK: - buttonVoltar
            let buttonVoltar = SKButtonNode(image: SKSpriteNode(color: .systemPink, size: CGSize(width: 50, height: 50)), label: SKLabelNode(text: "")) {
                print("voltar")
                self.closeMenuSettingsJoysticks()
            }
            buttonVoltar.zPosition = 30
            buttonVoltar.position = CGPoint(x: -120, y: 160)
            menuSettingsLanguagesBackground.addChild(buttonVoltar)

        }
        
    }
    
    func closeMenuSettingsJoysticks() {
        menuSettingsLanguagesBackground.removeFromParent()
//        menuSettingsBackground.isHidden = true
        menuSettingsBackground.isHidden = false

    }
}
