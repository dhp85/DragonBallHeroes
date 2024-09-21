//
//  HeroeDetailViewController.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 17/9/24.
//

import UIKit

final class HeroeDetailViewController: UIViewController {
    @IBOutlet weak var heroeImageView: UIImageView!
    @IBOutlet weak var nameTransformationUIButton: UIButton!
    @IBOutlet weak var heroeUILabel: UILabel!
    @IBOutlet weak var characterLabelUILabel: UILabel!
    
    @IBAction func pushTranformationButton(_ sender: Any) {
        let transformationtableViewController = TransformationsTableViewController(nibName: "TransforamationsTableViewController", bundle: nil)
        
        self.navigationController?.pushViewController(transformationtableViewController, animated: true)
        
    }
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
        configureView()
        
        
        
    }
    
    
}

// MARK: View Configuration

private extension HeroeDetailViewController {
    func configureView() {
        heroeUILabel.text = heroe.rawValue
        title = heroeUILabel.text
        characterLabelUILabel.text = heroe.character
        nameTransformationUIButton.setTitle("Transformaciones", for: .normal)
        
        guard let imageURL = heroe.imageURL else {
            return
        }
        
        heroeImageView.setImage(url: imageURL)
    }
}
