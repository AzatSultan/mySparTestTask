//
//  PromotionsCollectionViewCell.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class PromotionsCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "PromotionsCollectionViewCell"
  
  private let backImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 20
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(backImageView)
    
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      backImageView.topAnchor.constraint(equalTo: topAnchor),
      backImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      backImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      backImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  
  func configure(name: String) {
    backImageView.image = UIImage(named: name)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    backImageView.image = nil
  }

}
