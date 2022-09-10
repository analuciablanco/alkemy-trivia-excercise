//
//  SceneDelegate.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 02/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        let navController = UINavigationController(rootViewController: initialViewController())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

}

