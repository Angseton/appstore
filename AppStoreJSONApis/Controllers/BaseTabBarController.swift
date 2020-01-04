//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/3/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import Foundation
import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let appsNavController = createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps")
        let searchNavController = createNavController(viewController: AppSearchController(), title: "Search", imageName: "search")
        let todayNavController = createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon")
        
        viewControllers = [
            searchNavController,
            todayNavController,
            appsNavController
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        viewController.view.backgroundColor = .white
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
}
