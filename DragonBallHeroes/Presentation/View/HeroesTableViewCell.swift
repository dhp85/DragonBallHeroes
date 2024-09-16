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
    
    // MARK: Configuration
    
    func configure(with heroe: Heroe) {
        labelHeroes.text = heroe.rawValue
        
        guard let imageURL = heroe.imageURL else {
            return
        }
        heroesImageView.setImage(url: imageURL)
    }
    
}
