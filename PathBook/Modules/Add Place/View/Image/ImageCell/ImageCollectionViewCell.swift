//
//  ImageCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 15.10.2025.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var closeButton: UIButton!

  func configure() {
    containerView.layer.cornerRadius = 6
  }
}
