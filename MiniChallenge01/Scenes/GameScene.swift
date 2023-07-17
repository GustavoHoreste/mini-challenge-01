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

//MARK: CÓDIGO ARTHUR...

var contadorPulo:Int = 0
var apertou:Bool = false

var toqueEsquerdoAtivo:Bool = false
var toqueDireitoAtivo:Bool = false



class GameScene: SKScene, SKPhysicsContactDelegate {
    var setasVisiveis = true
    let controleDireito:SKSpriteNode = SKSpriteNode()
    let controleEsquerdo:SKSpriteNode = SKSpriteNode()
    let controlePular:SKSpriteNode = SKSpriteNode()
    var velocidadeX = 0.0
    
    let personagem:SKSpriteNode = SKSpriteNode(imageNamed: "Cavaleiro")
    var contadorPulo:Int = 0
    
    var estaEmUso = false
    var controlToggle: SKLabelNode!
    var joystickBase: SKShapeNode!
    var joystickKnob: SKShapeNode!
    
    var joystickActive: Bool = false
    var joystickDirection: CGVector = .zero
    

    //MARK: DidMove
    override func didMove(to view: SKView) {
        
        //MARK: Propriedades da view
        self.physicsBody =  SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsWorld.contactDelegate = self
        
        let spriteBtnPause = SKSpriteNode(texture: SKTexture(imageNamed: "pauseButtonBackground"))
        let btnPause:SKButtonNode = SKButtonNode(image: spriteBtnPause, label: SKLabelNode(text: ""), action: {
            if(menuAberto == false) {
                openMenu(in: self)
                
                menuAberto = true
            } else {
                closeMenu()
                menuAberto = false
            }
        })
        btnPause.position = CGPoint(x: frame.maxX - 70, y: frame.maxY - 70)
        self.addChild(btnPause)
        
        //MARK: CÓDIGO ARTHUR...

        criarControles()
        criarPersonagem(in: self, personagem)
        
        
    //MARK: GUSTAVO
        

        self.view?.isMultipleTouchEnabled = true
        controlToggle = SKLabelNode(text: "Controles: Setas")
        controlToggle.position = CGPoint(x: frame.minX + 100, y: frame.maxY - 100)
        controlToggle.fontSize = 20
        controlToggle.fontColor = .white
        addChild(controlToggle)
        mostrarControlesSetas()
    }
    
    func alternarControles() {
        setasVisiveis.toggle()
        
        if setasVisiveis {
            controlToggle.text = "Controles: Setas"
            mostrarControlesSetas()
        } else {
            controlToggle.text = "Controles: Joystick"
            mostrarControleJoystick()
        }
    }

    func mostrarControlesSetas() {
            controleEsquerdo.isHidden = false
            controleDireito.isHidden = false
            joystickBase.removeFromParent()
            joystickKnob.removeFromParent()
        }

        func mostrarControleJoystick() {
            controleEsquerdo.isHidden = true
            controleDireito.isHidden = true
            joystickBase.removeFromParent()
            joystickKnob.removeFromParent()
            addChild(joystickBase)
            addChild(joystickKnob)
        }


    
    func criarControles() {
        controleEsquerdo.size = CGSize(width: 100, height: 100)
        controleEsquerdo.position = CGPoint(x: self.frame.midX - 200, y: -400)
        controleEsquerdo.color = .black
        controleEsquerdo.zPosition = 100
        controleEsquerdo.name = "Esquerdo"
        addChild(controleEsquerdo)

        controleDireito.size = CGSize(width: 100, height: 100)
        controleDireito.position = CGPoint(x: self.frame.midX - 90, y: -400)
        controleDireito.color = .black
        controleDireito.zPosition = 100
        controleDireito.name = "Direito"
        addChild(controleDireito)

        controlePular.size = CGSize(width: 100, height: 100)
        controlePular.position = CGPoint(x: 200, y: -400)
        controlePular.zPosition = 100
        controlePular.color = .black
        controlePular.name = "Pular"
        addChild(controlePular)

        joystickBase = SKShapeNode(rectOf: CGSize(width: 200, height: 100), cornerRadius: 20)
        joystickBase.fillColor = .gray
        joystickBase.strokeColor = .clear
        joystickBase.position = CGPoint(x: self.frame.midX - 200, y: -400)
        joystickBase.zPosition = 100
        joystickBase.alpha = 0.5
        addChild(joystickBase)

                
        let joystickKnobRadius: CGFloat = 30
        joystickKnob = SKShapeNode(circleOfRadius: joystickKnobRadius)
        joystickKnob.fillColor = .gray
        joystickKnob.strokeColor = .clear
        joystickKnob.position = joystickBase.position
        joystickKnob.zPosition = joystickBase.zPosition + 1
        joystickKnob.alpha = 0.8
        addChild(joystickKnob)
    }


    
    //MARK: TouchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            let touchedNodes = nodes(at: touchLocation)

            for node in touchedNodes {
                if node == controlToggle {

                    alternarControles()
                } else if node == joystickBase {
                    estaEmUso = true
                    
                } else if node.name == "Esquerdo" {
                    toqueEsquerdoAtivo = true
                    personagem.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 0))
                    
                } else if node.name == "Direito" {
                        toqueDireitoAtivo = !estaEmUso
                        personagem.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0))
                } else if node.name == "Pular" {
                    if contadorPulo < 2 {
                        contadorPulo += 1
                        personagem.physicsBody?.applyImpulse(CGVector(dx: 0, dy: personagem.size.height))
                        if personagem.physicsBody?.velocity.dy ?? 0 > 100 {
                            personagem.physicsBody?.velocity.dy = 500
                        }
                    }
                }
            }
        }
    }
    

    func moverPersonagem(toque: UITouch) {
        let localicao = toque.location(in: self)
        
        if estaEmUso {
            let distanciaX = localicao.x - joystickBase.position.x
            
            // Limitar o movimento do knob ao tamanho da parte traseira do joystick (joystickBase)
            let maxDistanceX = joystickBase.frame.width / 2
            
            if abs(distanciaX) <= maxDistanceX {
                joystickKnob.position.x = localicao.x
            } else {
                let directionX = distanciaX < 0 ? -1.0 : 1.0
                joystickKnob.position.x = joystickBase.position.x + directionX * maxDistanceX
            }
            
            velocidadeX = (joystickKnob.position.x - joystickBase.position.x) / 10
        }
    }
    
    func moverDeVolta() {
        let moverVoltar = SKAction.move(to: CGPoint(x: joystickBase.position.x, y: joystickBase.position.y), duration: 0.1)
        moverVoltar.timingMode = .linear
        joystickKnob.run(moverVoltar)
        estaEmUso = false
        velocidadeX = 0.0
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for toque in touches {
            self.moverPersonagem(toque: toque)
        }
    }

    

    //MARK: TouchesEnded
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if estaEmUso {
            moverDeVolta()
        }
        //MARK: Verificar se o botão foi despressionado para que o personagem pare de andar
        for touch in touches {
                    let touchLocation = touch.location(in: self)
                    
                    if let touchedNode = self.nodes(at: touchLocation).first as? SKSpriteNode {
                        if touchedNode.name == "Direito" {
                            toqueDireitoAtivo = false
                            if((personagem.physicsBody?.velocity.dy)! == 0.0){
                                personagem.physicsBody?.velocity = CGVector.zero
                            }
                        } else if touchedNode.name == "Esquerdo" {
                            toqueEsquerdoAtivo = false
                            if((personagem.physicsBody?.velocity.dy)! == 0.0){
                                personagem.physicsBody?.velocity = CGVector.zero
                            }
                        }
                    }
                }
        
    }

    
    //MARK: DidBegin
    func didBegin(_ contact: SKPhysicsContact) {
        
        //MARK: Verificar o contato para zerar o contador de pulo
        if(contact.bodyA.node?.name == "Chao"){
            contadorPulo = 0
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        //MARK: fazer o personagem andar pressionando o botao.
        if estaEmUso{
            self.personagem.position.x += velocidadeX
        }
        if(toqueDireitoAtivo){
            personagem.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0))
            if((personagem.physicsBody?.velocity.dx)! > 10 ){
                personagem.physicsBody?.velocity.dx = 220
            }
        }
        if(toqueEsquerdoAtivo){
            personagem.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 0))
            if((personagem.physicsBody?.velocity.dx)! < -10){
                personagem.physicsBody?.velocity.dx = -220
            }
        }
    }
}


