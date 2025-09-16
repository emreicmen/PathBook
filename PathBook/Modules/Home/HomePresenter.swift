//
//  HomePresenter.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 16.09.2025.
//  
//

import Foundation

final class HomePresenter {
  weak var view: HomeView?
  var router: HomeWireframe!
  var interactor: HomeInteractorInput!
}

extension HomePresenter: HomePresentation {
  func viewDidLoad() {
    
  }
}

extension HomePresenter: HomeInteractorOutput {
  
}
