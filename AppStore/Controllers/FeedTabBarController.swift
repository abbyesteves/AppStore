//
//  FeedTabBarController.swift
//  AppStore
//
//  Created by Abby Esteves on 18/02/2019.
//  Copyright © 2019 Abby Esteves. All rights reserved.
//

import UIKit

class FeedTabBarController: UITabBarController {
    let controllers = Data().controllers()
    
    func tabsControllers() -> [UIViewController] {
        var viewControllersArray = [UIViewController]()
        for (index, controller) in controllers.enumerated() {
            let viewController = controller["controller"] as! UIViewController
            let title = controller["title"] as! String
            let icon = controller["icon"] as! String
            viewController.tabBarItem = UITabBarItem(title: title.capitalized, image: UIImage(named: icon), selectedImage: UIImage(named: ""))
            viewController.tabBarItem.tag = index
            viewControllersArray.append(viewController)
        }
        return viewControllersArray
    }
    
    func setupView() {
        self.viewControllers = self.tabsControllers()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        Service().sendPost() 
        setupView()
    }
}
