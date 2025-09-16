//
//  BaseViewController.swift
//  Cleaner
//
//  Created by Andaç Tercan on 28.08.2024.
//

import UIKit
import StoreKit

class BaseViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let className = String(describing: type(of: self))
    LogManager.shared.logEvent(.viewShowed, parameters: ["name": className])
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.interactivePopGestureRecognizer?.delegate = self
  }
  
  func getWindow() -> UIWindow! {
    if #available(iOS 13.0, *) {
      let keyWindow = UIApplication.shared.connectedScenes
        .map { $0 as? UIWindowScene }
        .compactMap { $0 }
        .first?.windows
        .filter { $0.isKeyWindow }.first
      
      return keyWindow
    }
    
    return (UIApplication.shared.delegate as! AppDelegate).window
  }
  
  func updateUserInteraction(by interactionEnabled: Bool) {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      
      view.isUserInteractionEnabled = interactionEnabled
      
      navigationController?.navigationBar.isUserInteractionEnabled = interactionEnabled
      navigationController?.interactivePopGestureRecognizer?.isEnabled = interactionEnabled
    }
  }
 
}
