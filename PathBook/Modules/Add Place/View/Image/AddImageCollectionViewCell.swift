//
//  AddImageCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 18.09.2025.
//

import UIKit

class AddImageCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var placeImageView: UIImageView!
  @IBOutlet weak var deleteButton: UIButton!

  func configure() {
    placeImageView.image = UIImage(named: "sampleImage")
  }
}
