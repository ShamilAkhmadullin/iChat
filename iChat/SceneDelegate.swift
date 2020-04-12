//
//  SceneDelegate.swift
//  iChat
//
//  Created by Shamil on 4/12/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Property

    var window: UIWindow?

    // MARK: - Scene lifecycle

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setWindow(windowScene)
    }
}

// MARK: - Set window

extension SceneDelegate {
    
    private func setWindow(_ windowScene: UIWindowScene) {
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = AuthorizationViewController()
        window?.makeKeyAndVisible()
    }
}
