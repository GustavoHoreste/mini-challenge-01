//
//  ViewController.swift
//  MiniChallenge01
//
//  Created by Thiago Pereira de Menezes on 11/07/23.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameView:SKView = SKView(frame: self.view.frame)
        self.view = gameView
        
        let gameScene:GameScene = GameScene(size: gameView.frame.size)
//        let menuScene = SKScene(fileNamed: "MeenuPause")
        
        gameView.presentScene(gameScene)

        
        gameView.ignoresSiblingOrder = true
        gameView.showsFPS = true
        gameView.showsNodeCount = true
        gameView.showsPhysics = true
    }
    


}
