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
    
    var apertou:Bool = false // Verificar se o usuario apertou na tela
    let texto: SKLabelNode = SKLabelNode() // Texto na tela
    
    var tileMapVisual: SKTileMapNode!
    var mapa1: SKTileMapNode!
    var mapa2: SKTileMapNode!
    var mapa3: SKTileMapNode!
    var mapHeight: CGFloat!
    var onMovingPlatform = false
    var velocidadeDaPlataforma: CGFloat = 0.0
    var mapas: [SKTileMapNode] = []
    
    var imagemFundo: SKSpriteNode = SKSpriteNode(imageNamed: "background_1")
    let objetoDummy = SKNode()

    
    var toqueEsquerdoAtivo:Bool = false // Verificar o toque do botao esquerdo
    var toqueDireitoAtivo:Bool = false // Verificar o toque no botao direito

    
    let personagem:SKSpriteNode = SKSpriteNode(imageNamed: "Cavaleiro") // Personagem
    var contadorPulo:Int = 0 // contador de pulo duplo
    
    //MARK: DidMove
    override func didMove(to view: SKView) {
        
        
        moverFundo(in: self, objetoDummy: objetoDummy)
        self.addChild(objetoDummy)
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
            
            if let tileMapVisual = self.childNode(withName: "Mapa\(i)") as? SKTileMapNode {
                
                    mapas.append(tileMapVisual)
                
                }
            
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
        
        
        //MARK: Texto na tela
        gerarTexto(in: self, texto: texto)
        
        
        
    }
    
    //MARK: TouchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if(!apertou){
            
            apertou = true
            texto.isHidden = true
            criarPersonagem(in: self, personagem)
            criarControles(in: self)
            criarMoedor(in: self)
            
        }
        
        
        //MARK: Verifica se os botoes foram pressionados e movimento o personagem
        for touch in touches {
            
            let touchLocation = touch.location(in: self)
            let touchedNodes = nodes(at: touchLocation)
                
            for node in touchedNodes{
                                
                if node.name == "Esquerdo" {
                    toqueEsquerdoAtivo = true
                    print("Apertou")

                    //quadrado.physicsBody?.velocity = CGVector.zero
                    personagem.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 0))
                }
                if node.name == "Direito"{
                    toqueDireitoAtivo = true
                    print("Apertou")

                   // quadrado.physicsBody?.velocity = CGVector.zero
                    personagem.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0))
                }
                if node.name == "Pular"{
                        if(contadorPulo < 2){
                            print("Apertou")
                        contadorPulo += 1
                        personagem.physicsBody?.applyImpulse(CGVector(dx: 0, dy: personagem.size.height))
                            if((personagem.physicsBody?.velocity.dy)! > 100){
                                personagem.physicsBody?.velocity.dy = .zero
                                personagem.physicsBody?.velocity.dy = 500
                            }
                    }
                }
                
            }
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
    
    
    //MARK: Update
    override func update(_ currentTime: TimeInterval) {
        
        if onMovingPlatform {
            let forceToApply = (personagem.physicsBody!.mass * physicsWorld.gravity.dy) - velocidadeDaPlataforma
            personagem.physicsBody?.applyForce(CGVector(dx: 0, dy: forceToApply))
        }
        
        resetMapPosition(mapas: mapas, mapHeight: mapHeight)
        
        //MARK: fazer o personagem andar pressionando o botao.
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


//MARK: Função para o preview do SwiftUI - Arthur
struct MyView: UIViewControllerRepresentable{
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard
            let viewController = storyboard.instantiateInitialViewController()
        else{
            fatalError("Cannot load ViewController from main storyboard")
        }
        return viewController as! ViewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}
struct ControllerView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
            .ignoresSafeArea()
    }
}
