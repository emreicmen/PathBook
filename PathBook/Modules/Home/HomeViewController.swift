//
//  HomeViewController.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 16.09.2025.
//  
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
  var presenter: HomePresentation!
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.viewDidLoad()
  }
}

extension HomeViewController: HomeView {
  
}
