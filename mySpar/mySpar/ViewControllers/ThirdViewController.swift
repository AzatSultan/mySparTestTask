//
//  ThirdViewController.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class ThirdViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var tabBarItem = UITabBarItem()
    tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "basketIcon"), selectedImage: UIImage(named: "basketIcon"))
    self.tabBarItem = tabBarItem
  }
}
