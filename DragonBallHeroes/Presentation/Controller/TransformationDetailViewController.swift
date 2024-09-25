//
//  TransformationDetailViewController.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 21/9/24.
//

import UIKit

final class TransformationDetailViewController: UIViewController {
    
    @IBOutlet weak var characterTransformationUILabel: UILabel!
    @IBOutlet weak var nameTransformationUILabel: UILabel!
    @IBOutlet weak var transformationDetailUIImageView: UIImageView!
    
    private let transformations : Transformation
    
    init(transformations : Transformation) {
        self.transformations = transformations
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}
    
extension TransformationDetailViewController {
    
    func configure() {
        characterTransformationUILabel.text = transformations.description
        nameTransformationUILabel.text = transformations.name
        title = nameTransformationUILabel.text
        
        guard let imageURL = transformations.photo else {
            return
        }
        
        transformationDetailUIImageView.setImage(url: imageURL)
    }
    
}



