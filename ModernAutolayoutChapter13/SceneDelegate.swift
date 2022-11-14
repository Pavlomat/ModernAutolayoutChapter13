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
        let bookTableViewController = BookTableViewController(style: .plain)
        let navigationController = UINavigationController(rootViewController: bookTableViewController)
        
        let url = Bundle.main.url(forResource: "Huckleberry", withExtension: "plist")
        bookTableViewController.bookUrl = url
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

