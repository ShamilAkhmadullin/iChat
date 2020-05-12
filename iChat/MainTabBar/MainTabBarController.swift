//
//  MainTabBarController.swift
//  iChat
//
//  Created by Shamil on 5/3/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .tabBarPurple()
        setTabBarViewControllers()
    }
}

// MARK: - Setup

extension MainTabBarController {
    
    private func setTabBarViewControllers() {
        let listViewController = ListViewController()
        let peopleViewController = PeopleViewController()
        
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)
        let conversationsImage = UIImage(systemName: ImagesNames.systemBubles.rawValue, withConfiguration: boldConfiguration)
        let peopleImage = UIImage(systemName: ImagesNames.systemPerson.rawValue, withConfiguration: boldConfiguration)
        
        guard let unwrapConversationsImage = conversationsImage,
            let unwrapPeopleImages = peopleImage else { return }
        
        viewControllers = [
            generateNavigationController(rootViewController: listViewController, title: ViewControllersTitles.conversations.rawValue, image: unwrapConversationsImage),
            generateNavigationController(rootViewController: peopleViewController, title: ViewControllersTitles.people.rawValue, image: unwrapPeopleImages)
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
