//
//  ResetTileMao.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 16/07/23.
//

import Foundation
import SpriteKit

func resetMapPosition(mapas: [SKTileMapNode], mapHeight:CGFloat) {
    for i in 0..<mapas.count {
        if mapas[i].position.y <= -mapHeight {
            let mapaNaFrente = mapas[(i + 1) % mapas.count]
            mapas[i].position.y = mapaNaFrente.position.y + mapHeight
        }
    }
}

