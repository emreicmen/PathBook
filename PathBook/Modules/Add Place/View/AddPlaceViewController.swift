//
//  AddPlaceViewController.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//
//

import UIKit
import MapKit

enum AddPlaceCollectionViewCellTypes {
  case placeInfo
  case addImage
  case search
  case mapkit
}

final class AddPlaceViewController: UIViewController {
  @IBOutlet weak var adBannerView: UIView!
  @IBOutlet weak var addPlaceCollectionView: UICollectionView!
  @IBOutlet weak var saveBarButton: UIBarButtonItem!
  @IBOutlet weak var backBarButton: UIBarButtonItem!
  
  private var addPlaceCells: [AddPlaceCollectionViewCellTypes] = [.placeInfo, .addImage, .search, .mapkit]

  var presenter: AddPlacePresentation!
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.viewDidLoad()
  }
  
  @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
    presenter.backButtonTapped()
  }
}

extension AddPlaceViewController: AddPlaceView {
  func setupUI() {
    navigationItem.title = "Add Place"
    
    configurePlacesCollectionView()
    
    if #available(iOS 26.0, *) {
      saveBarButton.hidesSharedBackground = true
      backBarButton.hidesSharedBackground = true
    }
  }
  
  private func configurePlacesCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 8
    layout.minimumInteritemSpacing = 0
    layout.estimatedItemSize = .zero   // 🔑 bu satır çok önemli
    addPlaceCollectionView.collectionViewLayout = layout
    
    let placeInfoCellNib = UINib(nibName: CollectionViewCellIdentifier.placeInfo, bundle: nil)
    addPlaceCollectionView.register(placeInfoCellNib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.placeInfo)
    
    let addImageCellNib = UINib(nibName: CollectionViewCellIdentifier.addImage, bundle: nil)
    addPlaceCollectionView.register(addImageCellNib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.addImage)
    
    let mapKitCellNib = UINib(nibName: CollectionViewCellIdentifier.mapKit, bundle: nil)
    addPlaceCollectionView.register(mapKitCellNib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.mapKit)
    
    let searchCellNib = UINib(nibName: CollectionViewCellIdentifier.search, bundle: nil)
    addPlaceCollectionView.register(searchCellNib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.search)
  }
}

extension AddPlaceViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return addPlaceCells.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellType = addPlaceCells[indexPath.item]
    
    let cellIdentifier: String
    switch cellType {
    case .placeInfo:
      cellIdentifier = CollectionViewCellIdentifier.placeInfo
    case .addImage:
      cellIdentifier = CollectionViewCellIdentifier.addImage
    case .search:
      cellIdentifier = CollectionViewCellIdentifier.search
    case .mapkit:
      cellIdentifier = CollectionViewCellIdentifier.mapKit
    }
    
    let cell = addPlaceCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
    
    switch cellType {
    case .placeInfo:
      let cell = cell as! PlaceInfoCollectionViewCell
      cell.configure()
 
      return cell
    case .addImage:
      let cell = cell as! AddImageCollectionViewCell
      cell.configure()

      return cell
    case .search:
      let cell = cell as! SearchCollectionViewCell
      cell.delegate = self
      cell.configure()

      return cell
    case .mapkit:
      let cell = cell as! MapKitCollectionViewCell
      cell.configure()
      
      return cell
    }
  }
}

extension AddPlaceViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellType = addPlaceCells[indexPath.item]
    
    let screenWidth = UIScreen.main.bounds.width - 12
    let screenHeight = addPlaceCollectionView.frame.height
    
    switch cellType {
    case .placeInfo:
      return CGSize(width: screenWidth, height: screenHeight * 0.3)

    case .addImage:
      return CGSize(width: screenWidth, height: screenHeight * 0.17)
    case .search:
      return CGSize(width: screenWidth, height: 44)
    case .mapkit:
      return CGSize(width: screenWidth, height: screenHeight * 0.51 - 55)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
  }
}

extension AddPlaceViewController: SearchCollectionViewCellDelegate {
  func didSearch(for text: String) {
    // MapCell'i bul
    if let index = addPlaceCells.firstIndex(of: .mapkit),
       let mapCell = addPlaceCollectionView.cellForItem(at: IndexPath(item: index, section: 0)) as? MapKitCollectionViewCell {
      mapCell.searchAndShow(text)
    }
  }
}
