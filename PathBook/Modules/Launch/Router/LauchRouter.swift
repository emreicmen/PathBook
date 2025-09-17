//
//  LauchRouter.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//  
//

import Foundation
import UIKit

final class LauchRouter {
  weak var view: UIViewController?
  
  static func setupModule() -> LauchViewController {
    let viewController = UIStoryboard.viewController(fromStoryboard: "Lauch") as! LauchViewController
    let presenter = LauchPresenter()
    let router = LauchRouter()
    let interactor = LauchInteractor()
    
    viewController.presenter =  presenter
    
    presenter.view = viewController
    presenter.router = router
    presenter.interactor = interactor
    
    router.view = viewController
    
    interactor.output = presenter
    
    return viewController
  }
}

extension LauchRouter: LauchWireframe {
  func routeToHome() {
    let homeViewController = HomeRouter.setupModule().navigationController!
    homeViewController.modalPresentationStyle = .fullScreen

    view?.present(homeViewController, animated: true)
  }
}
