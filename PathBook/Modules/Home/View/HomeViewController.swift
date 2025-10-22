//
//  HomeViewController.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 16.09.2025.
//
//

import UIKit

enum CollectionViewCellTypes {
  case search
  case segmentedControl
  case places
}

final class HomeViewController: UIViewController {
  @IBOutlet weak var searchButton: UIButton!
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var placesCollectionView: UICollectionView!
  @IBOutlet weak var adBanner: AdBannerView!
  @IBOutlet weak var addPlaceBarButton: UIBarButtonItem!
  @IBOutlet weak var searchBarButton: UIBarButtonItem!
  
  private var homepageCells: [CollectionViewCellTypes] = [.segmentedControl, .places]
  private var isSearchVisible = false
  
  var presenter: HomePresentation!
  
  private var places: [Place] = [
    Place(name: "Ayasofya", location: "İstanbul", summary: "Tarihi cami", image: "sampleImage"),
    Place(name: "Fatih", location: "İstanbul", summary: "Balonlarıyla ünlü", image: "sampleImage"),
    Place(name: "Sultanahmet", location: "İstanbul", summary: "Balonlarıyla ünlü", image: "sampleImage"),
    Place(name: "Kariye", location: "İstanbul", summary: "Balonlarıyla ünlü", image: "sampleImage"),
    Place(name: "Samatya", location: "İstanbul", summary: "Balonlarıyla ünlü", image: "sampleImage"),
    Place(name: "Kapadokya", location: "İstanbul", summary: "Balonlarıyla ünlü", image: "sampleImage")
  ]

  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    presenter.viewDidLoad()
  }
  
  @IBAction func searchButtonTapped(_ sender: UIButton) {
    isSearchVisible.toggle()
    searchButton.isEnabled = false
    
    if isSearchVisible {
      homepageCells.insert(.search, at: 0)
    } else {
      homepageCells.removeAll { $0 == .search }
    }
    
    placesCollectionView.performBatchUpdates({
      if isSearchVisible {
        placesCollectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
      } else {
        if placesCollectionView.numberOfItems(inSection: 0) > 0 {
          placesCollectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
        }
      }
    }, completion: { _ in
      if let placesIndex = self.homepageCells.firstIndex(of: .places),
         placesIndex < self.placesCollectionView.numberOfItems(inSection: 0) {
        
        let indexPath = IndexPath(item: placesIndex, section: 0)
        UIView.performWithoutAnimation {
          self.placesCollectionView.reloadItems(at: [indexPath])
        }
      } else {
        self.placesCollectionView.reloadData()
      }
    })
    searchButton.isEnabled = true
  }


  @IBAction func addButtonTapped(_ sender: UIButton) {
    presenter.addButtonTapped()
  }
  
  private func configurePlacesCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 8
    layout.minimumInteritemSpacing = 0
    layout.estimatedItemSize = .zero
    placesCollectionView.collectionViewLayout = layout
    
    let searchCellNib = UINib(nibName: CollectionViewCellIdentifier.search, bundle: nil)
    placesCollectionView.register(searchCellNib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.search)
    
    let segmentedCellNib = UINib(nibName: CollectionViewCellIdentifier.segmentedControl, bundle: nil)
    placesCollectionView.register(segmentedCellNib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.segmentedControl)
    
    let placesCellNib = UINib(nibName: CollectionViewCellIdentifier.places, bundle: nil)
    placesCollectionView.register(placesCellNib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.places)
  }
}

extension HomeViewController: HomeView {
  func setupUI() {
    navigationItem.title = "Homepage"
    
    configurePlacesCollectionView()
    
    placesCollectionView.delegate = self
    placesCollectionView.dataSource = self
    
    placesCollectionView.reloadData()
    
    if #available(iOS 26.0, *) {
      addPlaceBarButton.hidesSharedBackground = true
      searchBarButton.hidesSharedBackground = true
    }
  }
}

// MARK: - CollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return homepageCells.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellType = homepageCells[indexPath.item]
    
    let cellIdentifier: String
    switch cellType {
    case .search:
      cellIdentifier = CollectionViewCellIdentifier.search
    case .segmentedControl:
      cellIdentifier = CollectionViewCellIdentifier.segmentedControl
    case .places:
      cellIdentifier = CollectionViewCellIdentifier.places
    }
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
    
    switch cellType {
    case .search:
      let cell = cell as! SearchCollectionViewCell
      cell.configure()
 
      return cell
    case .segmentedControl:
      let cell = cell as! SegmentedControlCollectionViewCell
      cell.configure()

      return cell
    case .places:
      let cell = cell as! PlacesCollectionViewCell
      cell.configure(with: places)
      
      return cell
    }
  }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellType = homepageCells[indexPath.item]
    
    let screenWidth = UIScreen.main.bounds.width - 12
    let screenHeight = containerView.frame.height
    
    switch cellType {
    case .search:
      return CGSize(width: screenWidth, height: screenHeight * 0.06)
    case .segmentedControl:
      return CGSize(width: screenWidth, height: screenHeight * 0.075)
    case .places:
      let changedHeight = isSearchVisible ? screenHeight * 0.83 - 55 : screenHeight * 0.83
      
      return CGSize(width: screenWidth, height: changedHeight)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)
  }
}
