//
//  CategorySelectCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 18.09.2025.
//

import UIKit

class CategorySelectCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var categoryNameLabel: UILabel!
  @IBOutlet weak var categoryContainerView: UIView!
  
  func configure() {
    categoryNameLabel.text = "Cinema"
    categoryContainerView.layer.borderWidth = 1
    categoryContainerView.layer.cornerRadius = 12
//    categoryContainerView.layer.borderColor = CGColor.
  }
  
}
