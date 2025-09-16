//
//  HomeRouter.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 16.09.2025.
//  
//

import Foundation
import UIKit

final class HomeRouter {
  weak var view: UIViewController?
  
  static func setupModule() -> HomeViewController {
    let viewController = UIStoryboard.viewController(fromStoryboard: "Home") as! HomeViewController
    let presenter = HomePresenter()
    let router = HomeRouter()
    let interactor = HomeInteractor()
    
    viewController.presenter =  presenter
    
    presenter.view = viewController
    presenter.router = router
    presenter.interactor = interactor
    
    router.view = viewController
    
    interactor.output = presenter
    
    return viewController
  }
}

extension HomeRouter: HomeWireframe {
  
}
