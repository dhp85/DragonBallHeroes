//
//  HeroeDetailViewController.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 17/9/24.
//

import UIKit

final class HeroeDetailViewController: UIViewController {
    @IBOutlet weak var heroeImageView: UIImageView!
    @IBOutlet weak var heroeUILabel: UILabel!
    
    private let heroe: Heroe
    
    init(heroe: Heroe) {
        self.heroe = heroe
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroeUILabel.text = heroe.rawValue
        title = heroeUILabel.text
        configureView()
        
        
        
    }
    
    
}

// MARK: View Configuration

private extension HeroeDetailViewController {
    func configureView() {
        heroeUILabel.text = heroe.rawValue
        
        guard let imageURL = heroe.imageURL else {
            return
        }
        
        heroeImageView.setImage(url: imageURL)
    }
}
