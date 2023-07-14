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

var contadorPulo:Int = 0 // contador de pulo duplo
var apertou:Bool = false // Verificar se o usuario apertou na tela
let texto: SKLabelNode = SKLabelNode() // Texto na tela

var toqueEsquerdoAtivo:Bool = false // Verificar o toque do botao esquerdo
var toqueDireitoAtivo:Bool = false // Verificar o toque no botao direito



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let personagem:SKSpriteNode = SKSpriteNode(imageNamed: "Cavaleiro") // Personagem
    var contadorPulo:Int = 0 // contador de pulo duplo
    
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

        criarPersonagem(in: self, personagem)
        criarControles(in: self)

        
    }
    
    //MARK: TouchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        
        //MARK: Verifica se os botoes foram pressionados e movimento o personagem
        for touch in touches {
            
            let touchLocation = touch.location(in: self)
            let touchedNodes = nodes(at: touchLocation)
                
            for node in touchedNodes{
                
  
                
                if node.name == "Esquerdo" {
                    toqueEsquerdoAtivo = true
                    //quadrado.physicsBody?.velocity = CGVector.zero
                    personagem.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 0))
                }
                if node.name == "Direito"{
                    toqueDireitoAtivo = true
                   // quadrado.physicsBody?.velocity = CGVector.zero
                    personagem.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0))
                }
                if node.name == "Pular"{
                        if(contadorPulo < 2){
                        contadorPulo += 1
                        personagem.physicsBody?.applyImpulse(CGVector(dx: 0, dy: personagem.size.height))
                            if((personagem.physicsBody?.velocity.dy)! > 100){
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
        
        //MARK: Verificar o contato para zerar o contador de pulo
        if(contact.bodyA.node?.name == "Chao"){
            contadorPulo = 0
        }
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
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


////MARK: Função para o preview do SwiftUI - Arthur
//struct MyView: UIViewControllerRepresentable{
//    typealias UIViewControllerType = GameViewController
//
//    func makeUIViewController(context: Context) -> GameViewController {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard
//            let viewController = storyboard.instantiateInitialViewController()
//        else{
//            fatalError("Cannot load ViewController from main storyboard")
//        }
//        return viewController as! GameViewController
//    }
//
//    func updateUIViewController(_ uiViewController: GameViewController, context: Context) {
//        // Updates the state of the specified view controller with new information from SwiftUI.
//    }
//}
//struct ControllerView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyView()
//            .ignoresSafeArea()
//    }
//}
