//
//  Transformation.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 24/9/24.
//

import Foundation

struct Transformation: Codable, Hashable {
    let id: String
    let photo: URL?
    let name: String
    let description: String
}
