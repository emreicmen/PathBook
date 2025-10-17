//
//  CategoriesCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var categoryNameLabel: UILabel!

  func configure(with title: String) {
    containerView.layer.cornerRadius = 10
    containerView.backgroundColor = .red
    
    categoryNameLabel.text = title
  }
}
