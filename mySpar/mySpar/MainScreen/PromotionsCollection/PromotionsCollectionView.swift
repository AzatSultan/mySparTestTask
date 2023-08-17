//
//  PromotionsCollectionView.swift
//  mySpar
//
//  Created by Азат Султанов on 16.08.2023.
//

import UIKit

class PromotionsCollectionView: UIView {
  private var collectionView: UICollectionView?
  
  init() {
    super.init(frame: .zero)
    
    setupCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupCollectionView() {
    let layout = SnapLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.85, height: 200)
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView?.register(PromotionsCollectionViewCell.self, forCellWithReuseIdentifier: PromotionsCollectionViewCell.identifier)
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
      myCollection.heightAnchor.constraint(equalToConstant: 200)
    ])
  }
}

extension PromotionsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionsCollectionViewCell.identifier, for: indexPath) as! PromotionsCollectionViewCell
    cell.configure(name: "promotions")
    return cell
  }
}


