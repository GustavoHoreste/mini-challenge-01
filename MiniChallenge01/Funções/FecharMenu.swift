//
//  FecharMenu.swift
//  MiniChallenge01
//
//  Created by Gustavo Horestee Santos Barros on 17/07/23.
//


import Foundation
import SpriteKit

func closeMenu() {
    if(menuAberto == true) {
        menuBackground.removeFromParent()
        menuAberto = false
    }
}
