//
//  MainTabBarController.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 21.02.2024.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTabbar()

        
    }
    
    
    private func setupTabbar(){
        let vcHome = UINavigationController(rootViewController: MovieListBuilder.make())
        let vcFavorites = UINavigationController(rootViewController:FavoritesViewController())
        let vcSettings = UINavigationController(rootViewController:SettingsViewController())
        
        
        vcHome.tabBarItem.image = UIImage(systemName: "house")
        vcFavorites.tabBarItem.image = UIImage(systemName: "heart")
        vcSettings.tabBarItem.image = UIImage(systemName: "gearshape")
        
        
        vcHome.title = "Home"
        vcFavorites.title  = "Favorites"
        vcSettings.title = "Settings"
        
        tabBar.tintColor = .label
        setViewControllers([vcHome,vcFavorites,vcSettings], animated: true)
    }
 

}
