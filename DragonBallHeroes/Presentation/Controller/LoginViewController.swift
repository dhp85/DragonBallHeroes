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
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailUserUITextField.text, !email.isEmpty else {
            return
        }
        
        guard let password = passwordUserUITextField.text, !password.isEmpty else{
            return
        }
        
        login(email: email, password: password)
        
        
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
    
    func login(email: String, password: String) {
        
        NetworkModel.shared.login(user: email, password: password) { [weak self] result in
            
            switch result {
            case let .success(token):
                UserDefaults.standard.set(token, forKey: "authToken")
                self?.navigateMainViewController()
            case .failure:
                break
            }
        }
    }
    
    func navigateMainViewController() {
        
            DispatchQueue.main.async {
            
            if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                let heroesListViewController = HeroesListTableViewController()
                let navigationController = UINavigationController(rootViewController: heroesListViewController)
                scene.changeRootViewController(to: navigationController)
            }
            
        }
    }
}


