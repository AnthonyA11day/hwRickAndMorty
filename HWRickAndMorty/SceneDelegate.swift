//
//  SceneDelegate.swift
//  HWRickAndMorty
//
//  Created by Anthony on 25.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.backgroundColor = .black
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 234.0/255.0, green: 46.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
    }
}
