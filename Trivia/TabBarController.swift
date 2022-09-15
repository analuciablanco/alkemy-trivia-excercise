//
//  TabBarController.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 13/09/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewController()
    }
    
    private func setUpViewController() {
        let firstTab = CategoriesViewController()
        let secondTab = QuestionViewController()
        
        firstTab.tabBarItem = UITabBarItem(title: "Category",
                                           image: UIImage(systemName: "list.bullet"),
                                           tag: 0)
        
        secondTab.tabBarItem = UITabBarItem(title: "Random",
                                            image: UIImage(systemName: "shuffle"),
                                            tag: 1)
        
        self.viewControllers = [firstTab, secondTab]
    }
}
