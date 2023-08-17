//
//  SecondViewController.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class SecondViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var tabBarItem = UITabBarItem()
    tabBarItem = UITabBarItem(title: "Каталог", image: UIImage(named: "catalogueIcon"), selectedImage:  UIImage(named: "catalogueIcon"))
    self.tabBarItem = tabBarItem
  }
}
