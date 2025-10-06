//
//  AddPlaceViewController.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//
//

import UIKit
import MapKit

final class AddPlaceViewController: UIViewController {
  @IBOutlet weak var saveButton: UIButton!
  @IBOutlet weak var placeNameTextView: UITextView!
  @IBOutlet weak var placeLinkTextView: UITextView!
  @IBOutlet weak var categoryCollectionView: UICollectionView!
  @IBOutlet weak var placeSummaryTextView: UITextView!
  @IBOutlet weak var placeImagesCollectionView: UICollectionView!
  @IBOutlet weak var addPhotosButton: UIButton!
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var mapkit: MKMapView!
  
  var presenter: AddPlacePresentation!
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.viewDidLoad()
    
    setCollectionViewFlowLayout()
    setCollectionViewFlowLayout2()
  }
  
  @IBAction func saveButtonTapped(_ sender: UIButton) {
    
  }
  
  @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
    presenter.backButtonTapped()
  }
  
  @IBAction func addPhotosButtonTapped(_ sender: UIButton) {
    
  }
  
  private func configureCSelectategoryCollectionView() {
    let nib = UINib(nibName: CollectionViewCellIdentifier.categorySelect, bundle: nil)
    categoryCollectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.categorySelect)
  }
  
  private func configureAddImageCollectionView() {
    let nib = UINib(nibName: CollectionViewCellIdentifier.addImage, bundle: nil)
    placeImagesCollectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.addImage)
  }
  
  private func setCollectionViewFlowLayout() {
    let layout = UICollectionViewFlowLayout()
    
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 75, height: 50)
    placeImagesCollectionView.collectionViewLayout = layout
  }
  
  private func setCollectionViewFlowLayout2() {
    let layout = UICollectionViewFlowLayout()
    
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 75, height: 50)
    categoryCollectionView.collectionViewLayout = layout
  }
}

extension AddPlaceViewController: AddPlaceView {
  func setupUI() {
    navigationItem.title = "Add Place"
    
    configureCSelectategoryCollectionView()
    configureAddImageCollectionView()
  }
}

extension AddPlaceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == categoryCollectionView {
      return 10
    } else if collectionView == placeImagesCollectionView {
      return 5
    }
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == categoryCollectionView {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.categorySelect, for: indexPath) as! CategorySelectCollectionViewCell
      cell.configure()
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.addImage, for: indexPath) as! AddImageCollectionViewCell
      cell.configure()
      return cell
    }
  }
}

//extension AddPlaceViewController: UICollectionViewDelegateFlowLayout {
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    
//    if collectionView == placeImagesCollectionView {
//      return CGSize(width: 75, height: 50)
//    } else {
//      return CGSize(width: 50, height: 70)
//    }
//  }
//}
