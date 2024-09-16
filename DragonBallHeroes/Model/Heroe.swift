//
//  Heroe.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 16/9/24.
//

import Foundation


enum Heroe: String, CaseIterable {
    case goku = "Goku"
    case vegeta = "Vegeta"
    case freezer = "Freezer"
}

extension Heroe {
    var imageURL: URL? {
        switch self {
        case .goku:
            URL(string: "https://static.wikia.nocookie.net/dragonball/images/c/c0/Son_Goku_en_Super_Hero.png/revision/latest?cb=20220302091733&path-prefix=es")
        case .vegeta:
            URL(string: "https://static.wikia.nocookie.net/dragonball/images/1/14/Vegeta_en_Super_Hero.png/revision/latest?cb=20220119211034&path-prefix=es")
        case .freezer:
            URL(string: "https://static.wikia.nocookie.net/dragonball/images/e/e8/Freeza_artwork_Dragon_Ball_Super_Broly_%281%29.png/revision/latest?cb=20200207113941&path-prefix=es")
            
        }
    }
}
