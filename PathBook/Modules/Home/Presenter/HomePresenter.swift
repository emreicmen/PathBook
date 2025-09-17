//
//  HomePresenter.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 16.09.2025.
//  
//

import Foundation

final class HomePresenter {
  var view: HomeView?
  var router: HomeWireframe!
  var interactor: HomeInteractorInput!
}

extension HomePresenter: HomePresentation {
  func viewDidLoad() {
    view?.setupUI()
  }
  
  func backButtonTapped() {
    router.pop()
  }
}

extension HomePresenter: HomeInteractorOutput {}
