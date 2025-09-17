//
//  HomeViewController.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 16.09.2025.
//
//

import UIKit

final class HomeViewController: UIViewController {
  @IBOutlet weak var placeCollectionView: UICollectionView!
  @IBOutlet weak var segmentControl: UISegmentedControl!
  @IBOutlet weak var addBanner: UIView!
  
  var presenter: HomePresentation!
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.viewDidLoad()
  }
  
  @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
    presenter.backButtonTapped()
  }
  
  @IBAction func addButtonTapped(_ sender: UIButton) {
    
  }
  
  private func configurePlacesCollectionView() {
    let nib = UINib(nibName: CollectionViewCellIdentifier.places, bundle: nil)
    placeCollectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCellIdentifier.places)
  }
}

extension HomeViewController: HomeView {
  func setupUI() {
    configurePlacesCollectionView()
    
    placeCollectionView.reloadData()
    
    navigationItem.title = "Homepage"
  }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.places,for: indexPath) as! PlacesCollectionViewCell
    cell.configure()
    
    return cell
  }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = UIScreen.main.bounds.width - 32
    let height: CGFloat = 200   // istediğin sabit yükseklik
    return CGSize(width: width, height: height)
  }
}

