//
//  HomeViewController.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 16.09.2025.
//  
//

import UIKit

final class HomeViewController: UIViewController {
  @IBOutlet weak var testLabel: UILabel!
  
  var presenter: HomePresentation!
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    testLabel.text = "Test"
    
    presenter.viewDidLoad()
  }
  @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
    presenter.backButtonTapped()
  }
}

extension HomeViewController: HomeView {
  func setupUI() {
    navigationItem.title = "Homepage"
  }
}
