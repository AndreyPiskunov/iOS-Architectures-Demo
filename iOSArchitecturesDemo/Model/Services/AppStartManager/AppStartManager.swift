//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let rootVCApps = SearchModuleBuilder.build()
        let navAppVC = configuredNavigationController()
        navAppVC.viewControllers = [rootVCApps]
        rootVCApps.navigationItem.title = "Search apps"
        navAppVC.tabBarItem.title = rootVCApps.navigationItem.title
        if #available(iOS 13.0, *) {
            navAppVC.tabBarItem.image = UIImage(systemName: "cart.circle.fill")
        } else {
            // Fallback on earlier versions
        }
        
        let rootVCSongs = SearchSongsBuilder.build()
        let navSongVC = configuredNavigationController()
        navSongVC.viewControllers = [rootVCSongs]
        rootVCSongs.navigationItem.title = "Search songs"
        navSongVC.tabBarItem.title = rootVCSongs.navigationItem.title
        if #available(iOS 13.0, *) {
            navSongVC.tabBarItem.image = UIImage(systemName: "music.note")
        } else {
            // Fallback on earlier versions
        }
        
        let tabVC = configuredTabBarController
                 tabVC.viewControllers = [navAppVC, navSongVC]
                 window?.rootViewController = tabVC
                 window?.makeKeyAndVisible()
    }
    
    private func configuredNavigationController() -> UINavigationController {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }
    
    private lazy var configuredTabBarController: UITabBarController = {
        let tabVC = UITabBarController()
        tabVC.tabBar.barStyle = .default
        tabVC.tabBar.barTintColor = UIColor.white
        tabVC.tabBar.tintColor = UIColor.green
        tabVC.tabBar.isTranslucent = false
        return tabVC
    }()
}
