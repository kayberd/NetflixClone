//
//  ViewController.swift
//  NetflixClone
//
//  Created by Berkay Demirören on 18.11.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let upcomingsVC = UINavigationController(rootViewController: UpcomingViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let downloadsVC = UINavigationController(rootViewController: DownloadsViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        upcomingsVC.tabBarItem.image = UIImage(systemName: "play.circle")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadsVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        homeVC.title = "Home"
        upcomingsVC.title = "Coming Soon"
        searchVC.title = "Top Search"
        downloadsVC.title = "Downloads"
        
        tabBar.tintColor = .label
        
        
        setViewControllers([homeVC, upcomingsVC, searchVC, downloadsVC], animated: true)
        
        
    }


}

