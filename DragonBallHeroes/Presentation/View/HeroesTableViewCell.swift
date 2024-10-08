//
//  HeroesTableViewCell.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 16/9/24.
//

import UIKit

final class HeroesTableViewCell: UITableViewCell {
    // MARK: Identifier
    
    static let identifier = String(describing: HeroesTableViewCell.self)
    
    // MARK: Outlets

    @IBOutlet weak var labelHeroes: UILabel!
    @IBOutlet weak var heroesImageView: UIImageView!
    @IBOutlet weak var characterHeroeUILabel: UILabel!
    @IBOutlet weak var nextViewUILabel: UILabel!
    
    // MARK: Configuration
    
    func configure(with heroe: DragonBallCharacter) {
        labelHeroes.text = heroe.name
        characterHeroeUILabel.text = heroe.description
        nextViewUILabel.text = String(describing: ">")
        
        guard let imageURL = heroe.photo else {
            return
        }
        heroesImageView.setImage(url: imageURL)
    }
    
}
