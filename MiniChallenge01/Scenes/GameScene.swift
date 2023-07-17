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


class GameScene: SKScene, SKPhysicsContactDelegate {
    var setasVisiveis = false
//    var controleDireito:SKSpriteNode = SKSpriteNode()
//    var controleEsquerdo:SKSpriteNode = SKSpriteNode()
//    var controlePular:SKSpriteNode = SKSpriteNode()
    var velocidadeX = 0.0
    

    let personagem:SKSpriteNode = SKSpriteNode(imageNamed: "Cavaleiro")
    var contadorPulo:Int = 0

    var apertou:Bool = false // Verificar se o usuario apertou na tela
    let texto: SKLabelNode = SKLabelNode() // Texto na tela
    
    var tileMapVisual: SKTileMapNode!
    var mapa1: SKTileMapNode!
    var mapa2: SKTileMapNode!
    var mapa3: SKTileMapNode!
    var mapHeight: CGFloat!
    var onMovingPlatform = false
    var velocidadeDaPlataforma: CGFloat = 0.0
    
    var toqueEsquerdoAtivo:Bool = false // Verificar o toque do botao esquerdo
    var toqueDireitoAtivo:Bool = false // Verificar o toque no botao direito

    

    
    var estaEmUsoJoy = false
    var controlToggle: SKLabelNode!
    var joystickBase: SKShapeNode = SKShapeNode()
    var joystickKnob: SKShapeNode  = SKShapeNode()
    var controleEsquerdo: SKSpriteNode!
    var controleDireito: SKSpriteNode!
    var controlePular: SKSpriteNode!
    
    var joystickDirection: CGVector = .zero


    //MARK: DidMove
    override func didMove(to view: SKView) {
        mapa1 = self.childNode(withName: "Mapa1") as? SKTileMapNode
        mapa2 = self.childNode(withName: "Mapa2") as? SKTileMapNode
        mapa3 = self.childNode(withName: "Mapa3") as? SKTileMapNode
        mapHeight = CGFloat(mapa1.mapSize.height)
        
        //MARK: Propriedades da view
        self.physicsBody =  SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsWorld.contactDelegate = self
        self.view?.isMultipleTouchEnabled = true
        
        //MARK: Gerar Tile maps
        for i in 1...3{
            tileMapVisual = self.childNode(withName: "Mapa\(i)") as? SKTileMapNode
            
            if tileMapVisual != nil {
                velocidadeDaPlataforma = moveTileMap(tileMapVisual)
                createTileMapColliders(tileMapVisual)
                
            } else {
                print("Tilemap node not found or not of type SKTileMapNode")
            }
        }
        
        //MARK: Botão de pause
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
        gerarTexto(in: self, texto: texto)
        
        
    //MARK: GUSTAVO
        

        self.view?.isMultipleTouchEnabled = true
        controlToggle = SKLabelNode(text: "Controles: Setas")
        controlToggle.position = CGPoint(x: frame.minX + 100, y: frame.maxY - 100)
        controlToggle.fontSize = 20
        controlToggle.fontColor = .white
        addChild(controlToggle)
        
        
    }
    
    func alternarControles() {
        setasVisiveis.toggle()
        
        print(" esse e o estado de setasVisieis: \(setasVisiveis)")
        if setasVisiveis {
            mostrarControlesSetas()
        } else {
            mostrarControleJoystick()
        }
    }

    func mostrarControlesSetas() {
        (controleEsquerdo, controleDireito, controlePular) = criarControles(in: self)
       
            print("estou nas setas")
            joystickBase.removeFromParent()
            joystickKnob.removeFromParent()
        
    }
    
    func mostrarControleJoystick() {
            estaEmUsoJoy = true
            controleDireito.removeFromParent()
            controleEsquerdo.removeFromParent()
            criarControlesJoy()
        }


    
    func criarControlesJoy() {
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
        if !apertou {
            apertou = true
            texto.isHidden = true
            criarPersonagem(in: self, personagem)
            alternarControles()
        }

        for touch in touches {
            let touchLocation = touch.location(in: self)
            let touchedNodes = nodes(at: touchLocation)

            for node in touchedNodes {
                if node == controlToggle {
                    alternarControles()
                } else if node == joystickBase {
                    estaEmUsoJoy.toggle()
                } else if node.name == "Esquerdo" {
                    toqueEsquerdoAtivo = true
                    personagem.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 0))
                } else if node.name == "Direito" {
                    toqueDireitoAtivo = true
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

    

    func funcaoQueCalculaDistanciaJoyStick(toque: UITouch) {
        let localicao = toque.location(in: self)
        
        if estaEmUsoJoy {
            let distanciaX = localicao.x - joystickBase.position.x
            
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
        estaEmUsoJoy.toggle()
        velocidadeX = 0.0
        let moverVoltar = SKAction.move(to: CGPoint(x: joystickBase.position.x, y: joystickBase.position.y), duration: 0.1)
        moverVoltar.timingMode = .linear
        joystickKnob.run(moverVoltar)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for toque in touches {
            self.funcaoQueCalculaDistanciaJoyStick(toque: toque)
        }
    }

    

    //MARK: TouchesEnded
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

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
                }else if joystickBase.contains(touchedNode){
                    moverDeVolta()
                    
                }
            }
        }
        
    }
    
    //MARK: DidBegin
    func didBegin(_ contact: SKPhysicsContact) {
        if(contact.bodyA.node?.name == "Chao"){
            contadorPulo = 0
            onMovingPlatform = true
            personagem.physicsBody?.velocity.dy = 0.0
        }
    }
    
    //MARK: DidEnd
    func didEnd(_ contact: SKPhysicsContact) {
        if(contact.bodyA.node?.name == "Chao"){
            onMovingPlatform = false
        }
    }
    

    override func update(_ currentTime: TimeInterval) {
        
        if onMovingPlatform {
            let forceToApply = (personagem.physicsBody!.mass * physicsWorld.gravity.dy) - velocidadeDaPlataforma
            personagem.physicsBody?.applyForce(CGVector(dx: 0, dy: forceToApply))
        }
        
        resetMapPosition(mapa1: mapa1, mapa2: mapa2, mapHeight: mapHeight)
        
        //MARK: fazer o personagem andar pressionando o botao.
        if estaEmUsoJoy{
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



    
    
    


