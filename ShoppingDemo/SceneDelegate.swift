//
//  SceneDelegate.swift
//  ShoppingDemo
//
//  Created by 罗诗朋 on 2022/1/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windownSence = (scene as? UIWindowScene) else { return }
        let windown = UIWindow(windowScene: windownSence)
        windown.rootViewController = ProductListVC()
        windown.makeKeyAndVisible()
        self.window = windown
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }

    func sceneWillResignActive(_ scene: UIScene) {
   
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
   
    }


}

