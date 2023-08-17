//
//  PersonalPromotionsCollectionView.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class PersonalPromotionsCollectionView: UIView {
  private var collectionView: UICollectionView?
  
  private let personalPromotionsList: [PersonalPromotionsModel] = [PersonalPromotionsModel(text: "Абонемент на кофе", color: .cyan), PersonalPromotionsModel(text: "Мои скидки", color: .systemPink), PersonalPromotionsModel(text: "Карта в подарок", color: .systemGreen), PersonalPromotionsModel(text: "Абонемент на кофе", color: .cyan), PersonalPromotionsModel(text: "Мои скидки", color: .systemPink), PersonalPromotionsModel(text: "Карта в подарок", color: .systemGreen)]
  
  init() {
    super.init(frame: .zero)
    
    setupCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupCollectionView() {
    let layout = PersonalSnapLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 130, height: 150)
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView?.register(PersonalPromotionsCollectionViewCell.self, forCellWithReuseIdentifier: PersonalPromotionsCollectionViewCell.identifier)
    collectionView?.showsHorizontalScrollIndicator = false
    collectionView?.delegate = self
    collectionView?.dataSource = self
    collectionView?.alwaysBounceHorizontal = true
    collectionView?.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 40)
    guard let myCollection = collectionView else { return }
    myCollection.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(myCollection)
    
    NSLayoutConstraint.activate([
      myCollection.topAnchor.constraint(equalTo: topAnchor),
      myCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
      myCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
      myCollection.heightAnchor.constraint(equalToConstant: 160)
    ])
  }
}

extension PersonalPromotionsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return personalPromotionsList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonalPromotionsCollectionViewCell.identifier, for: indexPath) as! PersonalPromotionsCollectionViewCell
    cell.configure(item: personalPromotionsList[indexPath.row])
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

