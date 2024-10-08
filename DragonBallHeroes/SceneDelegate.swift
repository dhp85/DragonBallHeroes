//
//  SceneDelegate.swift
//  DragonBallHeroes
//
//  Created by Diego Herreros Parron on 16/9/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController()
        let loginViewController = LoginViewController()
        navigationController.setViewControllers([loginViewController], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    


}

