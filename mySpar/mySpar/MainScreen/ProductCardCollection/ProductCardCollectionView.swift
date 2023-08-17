//
//  ProductCardCollectionView.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class ProductCardCollectionView: UIView {
  private var collectionView: UICollectionView?
  
  private let productCardDict: [String : [ProductCardModel]] = ["Рекомендуем" : [ProductCardModel(section: "Рекомендуем", price: "190.90", image: "lamber"), ProductCardModel(section: "Рекомендуем", price: "30.0", salePrice: "50.0", image: "cola", promoMessage: "Супер Цена"), ProductCardModel(section: "Рекомендуем", price: "190.90", image: "lamber"), ProductCardModel(section: "Рекомендуем", price: "30.0", salePrice: "50.0", image: "cola", promoMessage: "Супер Цена"), ProductCardModel(section: "Рекомендуем", price: "190.90", image: "lamber"), ProductCardModel(section: "Рекомендуем", price: "30.0", salePrice: "50.0", image: "cola", promoMessage: "Супер Цена")], "Сладкое настроение" : [ProductCardModel(section: "Сладкое настроение", price: "200.0", image: "yogurt"), ProductCardModel(section: "Сладкое настроение", price: "300.98", image: "smoothie"), ProductCardModel(section: "Сладкое настроение", price: "199.9", salePrice: "200.5", image: "chocolade", promoMessage: "Удар по ценам"), ProductCardModel(section: "Сладкое настроение", price: "200.0", image: "yogurt"), ProductCardModel(section: "Сладкое настроение", price: "300.98", image: "smoothie"), ProductCardModel(section: "Сладкое настроение", price: "199.9", salePrice: "200.5", image: "chocolade", promoMessage: "Удар по ценам")], "Мясное настроение" : [ProductCardModel(section: "Мясное настроение", price: "800.00", salePrice: "1000.99", image: "meat2", promoMessage: "Бери"), ProductCardModel(section: "Мясное настроение", price: "500.10", image: "meat1")]]
  
  public var productCardList: [ProductCardModel] = []
  
  private var section: String
  
  init(section: String) {
    self.section = section
    self.productCardList = productCardDict[section] ?? []
    super.init(frame: .zero)
    setupCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupCollectionView() {
    let layout = PersonalSnapLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 170, height: 250)
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView?.register(ProductCardCollectionViewCell.self, forCellWithReuseIdentifier: ProductCardCollectionViewCell.identifier)
    collectionView?.showsHorizontalScrollIndicator = false
    collectionView?.delegate = self
    collectionView?.dataSource = self
    collectionView?.alwaysBounceHorizontal = true
    collectionView?.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    guard let myCollection = collectionView else { return }
    myCollection.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(myCollection)
    
    NSLayoutConstraint.activate([
      myCollection.topAnchor.constraint(equalTo: topAnchor),
      myCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
      myCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
      myCollection.heightAnchor.constraint(equalToConstant: 260)
    ])
  }
}

extension ProductCardCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return productCardList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCardCollectionViewCell.identifier, for: indexPath) as! ProductCardCollectionViewCell
    cell.configure(item: productCardList[indexPath.row])
    cell.contentView.layer.cornerRadius = 20
    cell.contentView.layer.borderWidth = 1.0

    cell.contentView.layer.borderColor = UIColor.clear.cgColor
    cell.contentView.layer.masksToBounds = true

    cell.layer.shadowColor = UIColor.gray.cgColor
    cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    cell.layer.shadowRadius = 2.0
    cell.layer.shadowOpacity = 1.0
    cell.layer.masksToBounds = false
    cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
    return cell
  }
}
