//
//  SceneDelegate.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 12.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.backgroundColor = .white
        
        let bookViewController = BookViewController()
//        let navigationController = UINavigationController(rootViewController: bookViewController)
        let url = Bundle.main.url(forResource: "Huckleberry", withExtension: "json")
        bookViewController.bookUrl = url
        let home = TabBarController()
        window?.rootViewController = home
        window?.makeKeyAndVisible()
    }
}

