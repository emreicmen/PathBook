//
//  MapKitCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 6.10.2025.
//

import UIKit
import MapKit

class MapKitCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var mapKitView: MapKitView!
  
  func configure() {
    print("Vavelya: MapKitCollectionViewCell loaded")
  }
}
