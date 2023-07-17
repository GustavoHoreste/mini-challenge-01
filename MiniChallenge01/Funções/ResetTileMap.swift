//
//  ResetTileMao.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 16/07/23.
//

import Foundation
import SpriteKit

func resetMapPosition(mapa1: SKTileMapNode, mapa2:SKTileMapNode, mapHeight:CGFloat) {
    if mapa1.position.y <= -mapHeight {
        mapa1.position.y = mapa2.position.y + mapHeight
    }
    if mapa2.position.y <= -mapHeight {
        mapa2.position.y = mapa1.position.y + mapHeight
    }
}
