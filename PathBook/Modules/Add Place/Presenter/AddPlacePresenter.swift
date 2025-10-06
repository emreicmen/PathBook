//
//  AddPlacePresenter.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//  
//

import Foundation

final class AddPlacePresenter {
  var view: AddPlaceView?
  var router: AddPlaceWireframe!
  var interactor: AddPlaceInteractorInput!
}

extension AddPlacePresenter: AddPlacePresentation {
  func viewDidLoad() {
    view?.setupUI()
  }
  
  func backButtonTapped() {
    router.pop()
  }
}

extension AddPlacePresenter: AddPlaceInteractorOutput {
  
}
