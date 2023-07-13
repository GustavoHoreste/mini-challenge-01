//
//  SKButtonNode.swift
//  MiniChallenge01
//
//  Created by Thiago Pereira de Menezes on 11/07/23.
//

import Foundation
import SpriteKit

//Class para usarmos btn no projeto.
class SKButtonNode: SKNode {
    
    var image:SKSpriteNode? // Sprite do btn.
    var label:SKLabelNode?  // Texto contido no btn.
    var action: (() -> Void)? //Ação feita ao btn ser clicado.
    
    init(image: SKSpriteNode, label: SKLabelNode, action: @escaping (() -> Void)) {
        self.image = image
        self.label = label
        self.action = action
        super.init() //Init obrigatório.
        self.isUserInteractionEnabled = true //Permite que o usuário interaja com a class.
//        self.size = image.size
        label.position = CGPoint(x: 0, y: -10)
        self.addChild(image)
        image.addChild(label)
        
    }
    
    //Inicializador obrigatório.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action?()
    }
}

/*
 MARK: EXEMPLO DE COMO USAR
 let spriteQuadrado:SKSpriteNode = SKSpriteNode(color: .systemGreen, size: CGSize(width: 200, height: 100))
 
 let btn:SKButtonNode = SKButtonNode(image: spriteQuadrado, label: SKLabelNode(text: "Start!"), action: { print("funcionou!") })
 
 btn.position = CGPoint(x: 200, y: 700)
 
 self.addChild(btn)
 */

//MARK: MESMA CLASSE PORÉM DO TIPO SKSpriteNode.
//import Foundation
//import SpriteKit
//
////Class para usarmos btn no projeto.
//class SKButtonNode: SKSpriteNode {
//
//    var image:SKTexture? // Sprite do btn.
//    var label:SKLabelNode?  // Texto contido no btn.
//    var action: (() -> Void)? //Ação feita ao btn ser clicado.
//
//    init(image: SKTexture, label: SKLabelNode, action: @escaping (() -> Void)) {
//        self.image = image
//        self.label = label
//        self.action = action
//        super.init(texture: image, color: .clear, size: image.size()) //Inito obrigatório.
//        self.isUserInteractionEnabled = true //Permite que o usuário interaja com a class.
////        self.size = image.size
//        label.position = CGPoint(x: 0, y: -10)
//
//    }
//
//    //Inicializador obrigatório.
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.action?()
//    }
//}
