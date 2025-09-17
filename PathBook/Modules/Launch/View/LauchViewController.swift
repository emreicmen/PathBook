//
//  LauchViewController.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//  
//

import UIKit

final class LauchViewController: UIViewController {
  var presenter: LauchPresentation!
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.viewDidLoad()
  }
  
  @IBAction func continueButtonTapped(_ sender: UIButton) {
    presenter.continueButtonTapped()
  }
}

extension LauchViewController: LauchView {
  func setupUI() {
    navigationItem.title = "Lauch Screen"
  }
}
