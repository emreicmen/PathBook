//
//  PlaceListCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 3.10.2025.
//

import UIKit

class PlaceListCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var categoryCollectionView: UICollectionView!
  @IBOutlet weak var provinceLabel: UILabel!
  @IBOutlet weak var summaryLabel: UILabel!
  @IBOutlet weak var placeImageView: UIImageView!
  @IBOutlet weak var pageControl: UIPageControl!
  //  @IBOutlet weak var placeImageContainerView: UIView!
  @IBOutlet weak var containerView: UIView!
  
  private var categories: [String] = []
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 8
    layout.minimumInteritemSpacing = 8
    categoryCollectionView.collectionViewLayout = layout
    
    let nib = UINib(nibName: CollectionViewCellIdentifier.category, bundle: nil)
    categoryCollectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.category)
    
    categoryCollectionView.delegate = self
    categoryCollectionView.dataSource = self
    
    categoryCollectionView.contentInset = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    containerView.layer.cornerRadius = 20
    containerView.layer.masksToBounds = true
    
    containerView.layer.borderWidth = 2
    containerView.layer.borderColor = UIColor.systemBlue.cgColor
    placeImageView.layer.cornerRadius = 20
    placeImageView.layer.masksToBounds = true
    placeImageView.clipsToBounds = true
  }
  
  func configure(with place: Place) {
    
    nameLabel.text = place.name
    provinceLabel.text = place.location
    summaryLabel.text = place.summary
    placeImageView.image = UIImage(named: "\(place.image)")
    
    categories = ["Tarihi", "Popüler", "Cafe", "Müze", "Tarihi Eser"]
    categoryCollectionView.reloadData()
  }
}

extension PlaceListCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
