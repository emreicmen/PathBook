//
//  PlaceInfoCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 13.10.2025.
//

import UIKit

class PlaceInfoCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var placeNameLabel: UILabel!
  @IBOutlet weak var placeNameTextField: UITextView!
  @IBOutlet weak var placeLinkLabel: UILabel!
  @IBOutlet weak var placeLinkTextView: UITextView!
  @IBOutlet weak var categoriesCollectionView: UICollectionView!
  @IBOutlet weak var placeSummaryLabel: UILabel!
  @IBOutlet weak var placeSummaryTextView: UITextView!

  private var categories: [String] = []
  
  func configure() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 8
    layout.minimumInteritemSpacing = 8
    layout.estimatedItemSize = .zero // ✅ en önemli satır
    categoriesCollectionView.collectionViewLayout = layout
    
    let nib = UINib(nibName: CollectionViewCellIdentifier.category, bundle: nil)
    categoriesCollectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.category)
    
    categoriesCollectionView.delegate = self
    categoriesCollectionView.dataSource = self
    
    categoriesCollectionView.contentInset = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
    
    categories = ["Tarihi", "Popüler", "Cafe", "Müze", "Tarihi Eser"]
    categoriesCollectionView.reloadData()
    
    containerView.layer.cornerRadius = 12
  }
}

extension PlaceInfoCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categories.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.category, for: indexPath) as! CategoriesCollectionViewCell
    cell.configure(with: categories[indexPath.item])
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width * 0.2, height: 30)
  }
}
