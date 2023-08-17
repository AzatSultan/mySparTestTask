//
//  HeaderView.swift
//  mySpar
//
//  Created by Азат Султанов on 17.08.2023.
//

import UIKit

class HeaderView: UIView {
  
  private let searchBar = UISearchBar()
  
  private let menuButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "menuIcon"), for: .normal)
    return button
  }()
  
  private let data = ["Москва", "Казань", "Чикаго", "Санкт-Петербург", "Чебоксары", "Тетеево", "Екатеринбург"]
  
  private var filteredData: [String] = []
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(searchBar)
    addSubview(menuButton)
    searchBar.searchBarStyle = .minimal
    searchBar.setImage(UIImage(named: "locationIcon"), for: .search, state: .normal)
    searchBar.text = "Москва"
    searchBar.delegate = self
    filteredData = data
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    menuButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      searchBar.topAnchor.constraint(equalTo: topAnchor),
      searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
      searchBar.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor),
      searchBar.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      menuButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      menuButton.heightAnchor.constraint(equalToConstant: 28),
      menuButton.widthAnchor.constraint(equalTo: menuButton.heightAnchor, multiplier: 1),
      menuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    ])
  }
  
}

extension HeaderView: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    filteredData = searchText.isEmpty ? data : data.filter { (item: String) -> Bool in
      return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
    }
  }
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.text = ""
    self.searchBar.showsCancelButton = true
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = false
    searchBar.text = ""
    searchBar.resignFirstResponder()
  }
}
