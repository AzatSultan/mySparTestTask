//
//  StoriesCollectionView.swift
//  mySpar
//
//  Created by Азат Султанов on 15.08.2023.
//

import UIKit

class StoriesCollectionView: UIView {
  private var collectionView: UICollectionView?
  
  private let storiesList: [StoriesModel] = [StoriesModel(image: "spar", name: "Привилегии «Мой спар»"), StoriesModel(image: "socialMedia", name: "Мы в соцсетях"), StoriesModel(image: "coctail", name: "3 рецепта коктейлей"), StoriesModel(image: "tasting", name: "Дегустации в SPAR"), StoriesModel(image: "healthyNutrition", name: "Правильное питание"), StoriesModel(image: "spar", name: "Привилегии «Мой спар»"), StoriesModel(image: "socialMedia", name: "Мы в соцсетях"), StoriesModel(image: "coctail", name: "3 рецепта коктейлей"), StoriesModel(image: "tasting", name: "Дегустации в SPAR"), StoriesModel(image: "healthyNutrition", name: "Правильное питание")]
  
  init() {
    super.init(frame: .zero)
    
    setupCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 90, height: 130)
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView?.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
    collectionView?.showsHorizontalScrollIndicator = false
    collectionView?.delegate = self
    collectionView?.dataSource = self
    collectionView?.alwaysBounceHorizontal = true
    collectionView?.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    guard let myCollection = collectionView else { return }
    myCollection.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(myCollection)
    
    NSLayoutConstraint.activate([
      myCollection.topAnchor.constraint(equalTo: topAnchor),
      myCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
      myCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
      myCollection.heightAnchor.constraint(equalToConstant: 130)
    ])
  }
}

extension StoriesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return storiesList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as! CircleCollectionViewCell
    cell.configure(item: storiesList[indexPath.row])
    return cell
  }
}
