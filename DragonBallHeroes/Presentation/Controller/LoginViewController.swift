//
//  LoginViewController.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 16/9/24.
//

import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet weak var buttonLoginUIButton: UIButton!
    @IBOutlet weak var passwordUserUITextField: UITextField!
    @IBOutlet weak var wallpaperLoginUIImageView: UIImageView!
    @IBOutlet weak var emailUserUITextField: UITextField!
    
    @IBAction func tabButtonLogin(_ sender: Any) {
        let heroesTableViewController = HeroesListTableViewController(nibName: "HeroesListTableViewController", bundle: nil)
        
        self.navigationController?.pushViewController(heroesTableViewController, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
 
    }

}



// MARK: - View Configuration

private extension LoginViewController {
    
    func configureView() {
        buttonLoginUIButton.setTitle("Iniciar Sesión", for: .normal)
        wallpaperLoginUIImageView.image = UIImage(named: "fondoGoku")
        
        
    }
          
}
