//
//  AbrirMenu.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 14/07/23.
//

import Foundation
import SpriteKit

func closeMenu() {
    if(menuAberto == true) {
        menuBackground.removeFromParent()
        menuAberto = false
    }
}

