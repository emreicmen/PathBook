//
//  SegmentedControlCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 20.09.2025.
//

import UIKit

class SegmentedControlCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var segmentedControlView: SegmentedControlView!
  
  func configure() {
    segmentedControlView.configure(with: ["Gidilecek", "Favori", "Gidildi"])
    
    segmentedControlView.onSegmentChanged = { index in
      switch index {
      case 0:
        print("Gidilecek seçildi")
      case 1:
        print("Favori seçildi")
      case 2:
        print("Gidildi seçildi")
      default:
        break
      }
    }
  }
}
