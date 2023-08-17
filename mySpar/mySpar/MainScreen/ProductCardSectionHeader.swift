//
//  ProductCardSectionHeader.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class ProductCardSectionHeader: UIView {
  
  private let sectionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func setSectionLabel(text: String) {
    sectionLabel.text = text
  }
  
  private func setupLayout() {
    addSubview(sectionLabel)
    
    NSLayoutConstraint.activate([
      sectionLabel.topAnchor.constraint(equalTo: topAnchor),
      sectionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
      sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    ])
  }
}
