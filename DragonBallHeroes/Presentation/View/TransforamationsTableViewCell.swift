//
//  TransforamationsTableViewCell.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 19/9/24.
//

import UIKit

final class TransforamationsTableViewCell: UITableViewCell {
    //MARK: Identifier
    static let identifier = String(describing: TransforamationsTableViewCell.self)
    
    // MARK: Outlets
    @IBOutlet weak var labelcell: UILabel!
    @IBOutlet weak var imageCellImageView: UIImageView!
    
    // MARK: Configuration
    
    func configure(with transformation: Transformations) {
        labelcell.text = transformation.rawValue
        
        guard let imageURL = transformation.imageURL else {
            return
        }
        
        imageCellImageView.setImage(url: imageURL)
    }
    
}
