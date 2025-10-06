//
//  AddPlaceRouter.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 17.09.2025.
//  
//

import UIKit

final class AddPlaceRouter {
  weak var view: UIViewController?
  
  static func setupModule() -> AddPlaceViewController {
    let navigationController = UIStoryboard.viewController(fromStoryboard: "AddPlace") as! UINavigationController
    let viewController = navigationController.visibleViewController as! AddPlaceViewController
    
    let presenter = AddPlacePresenter()
    let router = AddPlaceRouter()
    let interactor = AddPlaceInteractor()
    
    viewController.presenter =  presenter
    
    presenter.view = viewController
    presenter.router = router
    presenter.interactor = interactor
    
    router.view = viewController
    
    interactor.output = presenter
    
    return viewController
  }
}

extension AddPlaceRouter: AddPlaceWireframe {
  func pop() {
    view?.navigationController?.popViewController(animated: true)
  }
}
