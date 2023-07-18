//
//  AnimarObjetos.swift
//  MiniChallenge01
//
//  Created by Arthur Dos Reis on 17/07/23.
//

import Foundation
import SpriteKit

func getTextures(with name: String, textureAtlasName: String) -> [SKTexture]{
    
    let textureAtlas = SKTextureAtlas(named: textureAtlasName)
    var textures: [SKTexture] = []
    let names = textureAtlas.textureNames.sorted()
    
    for i in 0..<names.count{
        if names[i].contains(name){
            let texture = textureAtlas.textureNamed(names[i])
            texture.filteringMode = .nearest
            textures.append(texture)
        }
    }
    
    return textures
    
}


