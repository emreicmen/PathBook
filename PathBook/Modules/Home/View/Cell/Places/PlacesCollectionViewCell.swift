//
//  PlacesCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var placeNameLabel: UILabel!
  @IBOutlet weak var categoryCollectionView: UICollectionView!
  @IBOutlet weak var placeLocationLabel: UILabel!
  @IBOutlet weak var placeSummaryLabel: UILabel!
  @IBOutlet weak var placeImageView: UIImageView!
  @IBOutlet weak var pageControl: UIPageControl!
  
  func configure() {
    configureCategoryCollectionView()
  }
  
  private func configureCategoryCollectionView() {
    let nib = UINib(nibName: CollectionViewCellIdentifier.category, bundle: nil)
    categoryCollectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.category)
    
    categoryCollectionView.delegate = self
    categoryCollectionView.dataSource = self
  }
}

extension PlacesCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.category,for: indexPath) as! CategoriesCollectionViewCell
    cell.configure()
    
    return cell
  }
}

extension PlacesCollectionViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width: CGFloat = 75   // istediğin sabit yükseklik
    let height: CGFloat = 50   // istediğin sabit yükseklik
    
    return CGSize(width: width, height: height)
  }
}

