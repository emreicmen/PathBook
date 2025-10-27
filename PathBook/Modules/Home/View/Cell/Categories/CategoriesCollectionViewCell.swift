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
    containerView.layer.cornerRadius = 6
    containerView.backgroundColor = .red
    containerView.layer.borderWidth = 0
    containerView.layer.borderColor = UIColor.clear.cgColor
    
    categoryNameLabel.text = title
  }
  
  override var isSelected: Bool {
    didSet {
      containerView.layer.borderWidth = isSelected ? 2 : 0
      containerView.layer.borderColor = isSelected ? UIColor.systemGreen.cgColor : UIColor.clear.cgColor
    }
  }
}
