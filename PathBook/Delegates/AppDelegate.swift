//
//  AppDelegate.swift
//  PathBook
//
//  Created by EMRE İÇMEN on 16.09.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    // Root'u doğrudan LaunchRouter üzerinden ayarla
    window?.rootViewController = LauchRouter.setupModule()
    window?.makeKeyAndVisible()
    
    return true
  }
}
