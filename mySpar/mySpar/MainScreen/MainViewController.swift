//
//  ViewController.swift
//  mySpar
//
//  Created by Азат Султанов on 15.08.2023.
//

import UIKit

class MainViewController: UIViewController {
  
  private let storiesView = StoriesCollectionView()
  
  private let promotionsView = PromotionsCollectionView()
  
  private let bonusView = BonusView()
  
  private let personalPromotionsView = PersonalPromotionsCollectionView()
  
  private let productCardSectionHeaderRecommend: ProductCardSectionHeader = {
    let label = ProductCardSectionHeader()
    label.setSectionLabel(text: "Рекомендуем")
    return label
  }()
  
  private let productCardSectionHeaderSweet: ProductCardSectionHeader = {
    let label = ProductCardSectionHeader()
    label.setSectionLabel(text: "Сладкое настроение")
    return label
  }()
  
  private let productCardSectionHeaderMeat: ProductCardSectionHeader = {
    let label = ProductCardSectionHeader()
    label.setSectionLabel(text: "Мясное настроение")
    return label
  }()
  
  private let productCardView = ProductCardCollectionView(section: "Рекомендуем")
  
  private let productCardSweetView = ProductCardCollectionView(section: "Сладкое настроение")
  
  private let productCardMeatView = ProductCardCollectionView(section: "Мясное настроение")
  
  private let mainStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 20
    return stackView
  }()
  
  private let headerView = HeaderView()
  
  private let scrollView = UIScrollView()
  
  private let sparIcon: UIImageView = {
    let icon = UIImageView()
    icon.image = UIImage(named: "sparIcon")
    icon.contentMode = .scaleAspectFit
    return icon
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    var tabBarItem = UITabBarItem()
    tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIcon"))
    self.tabBarItem = tabBarItem
    
    storiesView.translatesAutoresizingMaskIntoConstraints = false
    promotionsView.translatesAutoresizingMaskIntoConstraints = false
    bonusView.translatesAutoresizingMaskIntoConstraints = false
    headerView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(headerView)
    mainStackView.addArrangedSubview(storiesView)
    mainStackView.addArrangedSubview(promotionsView)
    mainStackView.addArrangedSubview(bonusView)
    mainStackView.addArrangedSubview(personalPromotionsView)
    mainStackView.addArrangedSubview(productCardSectionHeaderRecommend)
    mainStackView.addArrangedSubview(productCardView)
    mainStackView.addArrangedSubview(productCardSectionHeaderSweet)
    mainStackView.addArrangedSubview(productCardSweetView)
    mainStackView.addArrangedSubview(productCardSectionHeaderMeat)
    mainStackView.addArrangedSubview(productCardMeatView)
    setupScrollView()
    setupLayout()
    
  }
  
  private func setupScrollView() {
    scrollView.addSubview(mainStackView)
    scrollView.alwaysBounceVertical = true
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(scrollView)
  }
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      mainStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      mainStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      
      scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      
      storiesView.heightAnchor.constraint(equalToConstant: 130),
      promotionsView.heightAnchor.constraint(equalToConstant: 200),
      personalPromotionsView.heightAnchor.constraint(equalToConstant: 160),
      productCardView.heightAnchor.constraint(equalToConstant: 260),
      productCardSweetView.heightAnchor.constraint(equalToConstant: 260),
      productCardMeatView.heightAnchor.constraint(equalToConstant: 260),
      
      headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
    ])
  }
}



