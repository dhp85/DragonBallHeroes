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
        NetworkModel.shared.getTransformations(for: heroe) { result in
            switch result {
            case let .success(transformations):
                let sortedTransformations = transformations.sorted { $0.name < $1.name}
                DispatchQueue.main.async {
                    let transformationListViewController = TransformationsTableViewController(someTransformation: sortedTransformations)
                    self.navigationController?.pushViewController(transformationListViewController, animated: true)
                }
            case.failure:
                break
            }
        }
    }
    private let heroe: DragonBallCharacter
    
    init(heroe: DragonBallCharacter) {
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

// MARK: - View Configuration

private extension HeroeDetailViewController {
    func configureView() {
        heroeUILabel.text = heroe.name
        title = heroeUILabel.text
        characterLabelUILabel.text = heroe.description
        nameTransformationUIButton.setTitle("Transformaciones", for: .normal)
        
        guard let imageURL = heroe.photo else {
            return
        }
        
        heroeImageView.setImage(url: imageURL)
    }
}
