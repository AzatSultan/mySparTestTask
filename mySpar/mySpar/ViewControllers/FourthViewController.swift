//
//  FourthViewController.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//


import UIKit

class FourthViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var tabBarItem = UITabBarItem()
    tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profileIcon"), selectedImage: UIImage(named: "profileIcon"))
    self.tabBarItem = tabBarItem
  }
}
