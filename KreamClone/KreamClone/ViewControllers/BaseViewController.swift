//
//  BaseViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.29.
//

import UIKit

class BaseViewController: UITabBarController {

    
    
    private lazy var HomeVC = HomeViewController()
    private lazy var StyleVC = StyleViewController()
    private lazy var ShopVC = ShopViewController()
    private lazy var SavedVC = SavedViewController()
    private lazy var MyVC = UINavigationController(rootViewController: MyViewController())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .white
        
        HomeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "icon_home_fill"), tag: 0)
        StyleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "icon_style_fill"), tag: 1)
        ShopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "icon_shop_none"), tag: 2)
        SavedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "_icon_saved_none"), tag: 3)
        MyVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "Union"), tag: 4)
        
        self.viewControllers = [HomeVC, StyleVC, ShopVC, SavedVC, MyVC]
        
        
    }
    
    
    

}
