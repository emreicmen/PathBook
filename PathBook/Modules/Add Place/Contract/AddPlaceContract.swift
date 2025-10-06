//
//  AddPlaceContract.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//  
//

import Foundation

protocol AddPlaceView {
  func setupUI()
}

protocol AddPlacePresentation: AnyObject {
  func viewDidLoad()
  
  func backButtonTapped()
}

protocol AddPlaceInteractorInput: AnyObject {
  
}

protocol AddPlaceInteractorOutput: AnyObject {
  
}

protocol AddPlaceWireframe: AnyObject {
  func pop()
}
