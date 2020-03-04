//
//  AppDelegate.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    var router: MainRouter?
    
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        router = MainRouter(window: window)
        window?.makeKeyAndVisible()
        return true
    }

}

