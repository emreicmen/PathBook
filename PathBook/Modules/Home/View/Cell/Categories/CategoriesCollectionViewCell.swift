//
//  CategoriesCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var categoryNameLabel: UILabel!

  func configure() {
    categoryNameLabel.text = "Cafê"
    
    
  }
}
