//
//  ProductCardModel.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import Foundation

struct ProductCardModel {
  public let section: String
  public let price: String
  public let salePrice: String?
  public let image: String
  public let promoMessage: String?
  
  init(section: String, price: String, salePrice: String? = nil, image: String, promoMessage: String? = nil) {
    self.section = section
    self.price = price
    self.salePrice = salePrice
    self.image = image
    self.promoMessage = promoMessage
  }
}


