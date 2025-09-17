//
//  LauchContract.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//  
//

import Foundation

protocol LauchView {
  func setupUI()
}

protocol LauchPresentation: AnyObject {
  func viewDidLoad()
  
  func continueButtonTapped()
}

protocol LauchInteractorInput: AnyObject {
  
}

protocol LauchInteractorOutput: AnyObject {
  
}

protocol LauchWireframe: AnyObject {
  func routeToHome()
}
