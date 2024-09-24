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
            URL(string: "https://static.wikia.nocookie.net/dragonball/images/2/2e/Goku_Joven_Flashback.jpg/revision/latest/scale-to-width-down/1000?cb=20170809015919&path-prefix=es")
        case .vegeta:
            URL(string: "https://static.wikia.nocookie.net/dragonball/images/1/14/Vegeta_en_Super_Hero.png/revision/latest?cb=20220119211034&path-prefix=es")
        case .freezer:
            URL(string: "https://static.wikia.nocookie.net/dragonball/images/e/e8/Freeza_artwork_Dragon_Ball_Super_Broly_%281%29.png/revision/latest?cb=20200207113941&path-prefix=es")
            
        }
    }
}

extension Heroe {
    var character: String {
        switch self {
        case .goku:
            String(describing: "Originalmente enviado a la Tierra como un infante volador con la misión de conquistarla. Sin embargo, el caer por un barranco le proporcionó un brutal golpe que si bien casi lo mata, este alteró su memoria y anuló todos los instintos violentos de su especie, lo que lo hizo crecer con un corazón puro y bondadoso, pero conservando todos los poderes de su raza. No obstante, en la nueva continuidad de Dragon Ball se establece que él fue enviado por sus padres a la Tierra con el objetivo de sobrevivir a toda costa a la destrucción de su planeta por parte de Freeza. Más tarde, Kakarot, ahora conocido como Son Goku, se convertiría en el príncipe consorte del monte Fry-pan y líder de los Guerreros Z, así como el mayor defensor de la Tierra y del Universo 7, logrando mantenerlos a salvo de la destrucción en innumerables ocasiones, a pesar de no considerarse a sí mismo como un héroe o salvador.")
        case.vegeta:
            String(describing: "Es el hijo mayor del Rey Vegeta III, así como el príncipe más reciente de la familia real saiyana y uno de los pocos supervivientes tras el genocidio saiyano del planeta Vegeta del Universo 7, a manos de Freeza. Es el eterno rival de Son Goku, hermano mayor de Tarble, el esposo de Bulma, padre de Trunks y Bra y ancestro de Vegeta Jr.")
        case .freezer:
            String(describing: "El tirano emperador es el responsable de la muerte de Bardock y Gine, los padres de Son Goku, del Rey Vegeta, así como de la mayor parte de su especie, los saiyanos del Planeta Vegeta, desembocando en una limpieza étnica conocida popularmente como el Genocidio saiyano.")
        }
    }
}
