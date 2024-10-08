//
//  DragonBallCharacter.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 23/9/24.
//

import Foundation


struct DragonBallCharacter: Codable, Hashable, Equatable {
    let name : String
    let photo : URL?
    let description : String
    let favorite: Bool
    let id: String
}
