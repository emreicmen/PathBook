//
//  PlacesCollectionViewCell.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var placeCollectionView: UICollectionView!
  
  private var places: [Place] = []

  func configure(with places: [Place]) {
    self.places = places

    configureCategoryCollectionView()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    // İçteki collectionView her zaman en önde olsun
    contentView.bringSubviewToFront(placeCollectionView)
  }

  private func configureCategoryCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 8
    layout.minimumInteritemSpacing = 8
    
    placeCollectionView.collectionViewLayout = layout
    placeCollectionView.showsHorizontalScrollIndicator = false
    
    let nib = UINib(nibName: CollectionViewCellIdentifier.placeList, bundle: nil)
    placeCollectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.placeList)
    
    placeCollectionView.dataSource = self
    placeCollectionView.delegate = self

    if places.count > 0 {
        placeCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
    }
  }
}

extension PlacesCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return places.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let place = places[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.placeList,for: indexPath) as! PlaceListCollectionViewCell
    cell.configure(with: place)
    
    return cell
  }
}

extension PlacesCollectionViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  let width = UIScreen.main.bounds.width - 12
  let height: CGFloat = 200
    
  return CGSize(width: width, height: height)
  }
}

