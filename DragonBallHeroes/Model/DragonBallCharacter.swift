//
//  DragonBallCharacter.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 23/9/24.
//

import Foundation


struct DragonBallCharacter: Codable, Hashable {
    let name : String
    let photo : String
    let description : String
    let favorite: Bool
    let id: String
}
