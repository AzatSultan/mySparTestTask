//
//  PersonalPromotionsCollectionViewCell.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class PersonalPromotionsCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "PersonalPromotionsCollectionViewCell"
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 17)
    label.textColor = .black
    label.numberOfLines = 2
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(titleLabel)
    layer.masksToBounds = true
    layer.cornerRadius = 20
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    ])
  }
  
  func configure(item: PersonalPromotionsModel) {
    titleLabel.text = item.text
    backgroundColor = item.color
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    backgroundColor = .clear
  }
}
