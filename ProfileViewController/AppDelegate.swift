//
//  AppDelegate.swift
//  ProfileViewController
//
//  Created by Pavan Kataria on 11/10/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ProfileViewController()
        self.window?.makeKeyAndVisible()
        return true
    }
    
}
