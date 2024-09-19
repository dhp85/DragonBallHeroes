//
//  TransformationsModel.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 19/9/24.
//

import Foundation


enum Transformations: String, CaseIterable {
    case gokuSuperSaiyan = "Goku S.Saiyan"
    case gokuSuperSaiyan2 = "Goku S.Saiyan II"
    case gokuSuperSaiyan3 = "Goku S.Saiyan III"
}


extension Transformations {
    var imageURL: URL? {
        switch self {
        case .gokuSuperSaiyan:
            URL(string: "https://static.wikia.nocookie.net/dragonball/images/f/f8/Goku59.PNG/revision/latest?cb=20110903142006&path-prefix=es")
        case .gokuSuperSaiyan2:
            URL(string: "https://static.wikia.nocookie.net/dragonball/images/8/8b/Goku_SSJ2_Electric.png/revision/latest?cb=20110824130849&path-prefix=es")
        case .gokuSuperSaiyan3:
            URL(string: "https://static.wikia.nocookie.net/dragonball/images/7/79/Goku_SS3.png/revision/latest?cb=20100212231025&path-prefix=es")
        }
    }
    
}
