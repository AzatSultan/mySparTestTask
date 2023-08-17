//
//  CircleCollectionViewCell.swift
//  mySpar
//
//  Created by Азат Султанов on 16.08.2023.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    
  static let identifier = "CircleCollectionViewCell"
  
  private let myImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 80.0 / 2.0
    imageView.layer.borderWidth = 2.5
    imageView.layer.borderColor = UIColor.systemGreen.cgColor
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let storiesName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 15)
    label.numberOfLines = 2
    label.textColor = .black
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(myImageView)
    contentView.addSubview(storiesName)
    
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      myImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      myImageView.widthAnchor.constraint(equalToConstant: 80),
      myImageView.heightAnchor.constraint(equalToConstant: 80),
      
      storiesName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      storiesName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      storiesName.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 10)
      
    ])
  }
  
//  override func layoutSubviews() {
//    super.layoutSubviews()
//    myImageView.frame = contentView.bounds
//  }
  
  public func configure(item: StoriesModel) {
    myImageView.image = UIImage(named: item.image)
    self.storiesName.text = item.name
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    myImageView.image = nil
    storiesName.text = nil
  }

}
