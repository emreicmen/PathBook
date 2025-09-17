//
//  HomeContract.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 16.09.2025.
//  
//

import Foundation

protocol HomeView {
  func setupUI()
}

protocol HomePresentation: AnyObject {
  func viewDidLoad()
  
  func backButtonTapped()
}

protocol HomeInteractorInput: AnyObject {
  
}

protocol HomeInteractorOutput: AnyObject {
  
}

protocol HomeWireframe: AnyObject {
  func pop()
}
