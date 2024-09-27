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
            showAlert(title: "Error", message: "Por favor, ingresa tu correo electronico.")
            return
        }
        
        guard let password = passwordUserUITextField.text, !password.isEmpty else{
            showAlert(title: "Error", message: "Por favor, ingresa tu contraseña.")
            return
        }
        
        login(email: email, password: password)
        
        
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
   // MARK: - Alerts
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}



// MARK: - View Configuration

private extension LoginViewController {
    
    func configureView() {
        buttonLoginUIButton.setTitle("Iniciar Sesión", for: .normal)
        wallpaperLoginUIImageView.image = UIImage(named: "fondoGoku")
        
        
    }
    
// MARK: - Login and Navigation
    
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



