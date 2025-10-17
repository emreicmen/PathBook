//
//  AddImageCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 18.09.2025.
//

import UIKit

class AddImageCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var imageCollectionView: UICollectionView!
  
  func configure() {
    let placeInfoCellNib = UINib(nibName: CollectionViewCellIdentifier.image, bundle: nil)
    imageCollectionView.register(placeInfoCellNib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.image)
    
    containerView.layer.cornerRadius = 12
    imageCollectionView.delegate = self
    imageCollectionView.dataSource = self
  }
}

extension AddImageCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 15
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.image, for: indexPath) as! ImageCollectionViewCell
    cell.configure()
    
    return cell
  }
}

extension AddImageCollectionViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = (collectionView.frame.width - 5 * 10) / 4 // 4 hücre + 3 spacing
    let height = containerView.frame.height * 0.8
    
    return CGSize(width: width, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
  }
}
