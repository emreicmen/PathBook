//
//  LauchPresenter.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//  
//

import Foundation

final class LauchPresenter {
  var view: LauchView?
  var router: LauchWireframe!
  var interactor: LauchInteractorInput!
}

extension LauchPresenter: LauchPresentation {
  func viewDidLoad() {
    
    view?.setupUI()
  }
  
  func continueButtonTapped() {
    router.routeToHome()
  }
}

extension LauchPresenter: LauchInteractorOutput {}
