//
//  SceneDelegate.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/11/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let dataModel = DataModel()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let window = window else { return }
        guard let navigationController = window.rootViewController as? UINavigationController else { return }
        let controller = navigationController.viewControllers[0] as? AllListsViewController
        controller?.dataModel = dataModel
    }

    func sceneDidDisconnect(_ scene: UIScene) { saveData() }
    
    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) { saveData() }

    
    func saveData() {
        dataModel.saveChecklists()
    }
}

