//
//  bonusView.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class BonusView: UIView {
  private let balanceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 40)
    label.textColor = .black
    label.text = "0"
    return label
  }()
  
  private let bonusTextLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "бонусов"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.textColor = .black
    return label
  }()
  
  private let qrImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "qrCode")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 12
    imageView.layer.borderWidth = 5
    imageView.layer.borderColor = UIColor.white.cgColor
    imageView.backgroundColor = .white
    return imageView
  }()
  
  private let balanceStack: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .horizontal
    stack.spacing = 8
    stack.alignment = .bottom
    return stack
  }()
  
  private let contentView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemGray4
    view.layer.cornerRadius = 20
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    balanceStack.addArrangedSubview(balanceLabel)
    balanceStack.addArrangedSubview(bonusTextLabel)
    contentView.addSubview(balanceStack)
    contentView.addSubview(qrImage)
    addSubview(contentView)
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      balanceStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      balanceStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      
      qrImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      qrImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      qrImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
      qrImage.heightAnchor.constraint(equalToConstant: 100),
      qrImage.widthAnchor.constraint(equalToConstant: 100),
      
      contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      contentView.topAnchor.constraint(equalTo: topAnchor),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
