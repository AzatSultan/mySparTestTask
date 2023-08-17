//
//  ProductCardCollectionViewCell.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class ProductCardCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "ProductCardCollectionViewCell"
  
  private let priceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textColor = .black
    return label
  }()
  
  private let salePriceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textColor = UIColor.gray
    label.isHidden = true
    return label
  }()
  
  private let currencyLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 17)
    label.text = "₽"
    label.textColor = .black
    return label
  }()
  
  private let productImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private let promoMessage: UILabel = {
    let label = PromoLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .white
    label.backgroundColor = UIColor.systemPink
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 10
    label.layer.opacity = 0.7
    label.isHidden = true
    label.drawText(in: CGRect())
    return label
  }()
  
  private let basketImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "basket")
    imageView.contentMode = .scaleAspectFit
    imageView.backgroundColor = .clear
    return imageView
  }()
  
  private let priceStack: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    stackView.spacing = 3
    stackView.alignment = .center
    return stackView
  }()
  
  private let salePriceStack: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 3
    return stackView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    salePriceStack.addArrangedSubview(priceLabel)
    salePriceStack.addArrangedSubview(salePriceLabel)
    priceStack.addArrangedSubview(salePriceStack)
    productImage.addSubview(promoMessage)
    contentView.addSubview(priceStack)
    contentView.addSubview(productImage)
    contentView.addSubview(basketImage)
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
    contentView.backgroundColor = .white
    
    NSLayoutConstraint.activate([
      productImage.topAnchor.constraint(equalTo: contentView.topAnchor),
      productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      productImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
      
      basketImage.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10),
      basketImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      basketImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      basketImage.widthAnchor.constraint(equalToConstant: 40),
      
      priceStack.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10),
      priceStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      priceStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      
      promoMessage.topAnchor.constraint(equalTo: productImage.topAnchor),
      promoMessage.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: -20),
    ])
  }
  
  func configure(item: ProductCardModel) {
    productImage.image = UIImage(named: item.image)
    priceLabel.text = item.price + " ₽"
    if item.salePrice != nil {
      salePriceLabel.text = item.salePrice
      salePriceLabel.isHidden = false
      let attributtedString = NSAttributedString(string: salePriceLabel.text!, attributes: [
        NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue
      ])
      salePriceLabel.attributedText = attributtedString
    }
    if item.promoMessage != nil {
      promoMessage.text = item.promoMessage
      promoMessage.isHidden = false
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    productImage.image = nil
    priceLabel.text = nil
    salePriceLabel.isHidden = true
    salePriceLabel.text = nil
    promoMessage.isHidden = true
    promoMessage.text = nil
  }
}

class PromoLabel: UILabel {
  var topInset: CGFloat = 5.0
  var bottomInset: CGFloat = 5.0
  var leftInset: CGFloat = 17.0
  var rightInset: CGFloat = 7.0
  
  override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: rect.inset(by: insets))
  }
  
  override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(width: size.width + leftInset + rightInset,
                  height: size.height + topInset + bottomInset)
  }
  
  override var bounds: CGRect {
    didSet {
      // ensures this works within stack views if multi-line
      preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
    }
  }
}
