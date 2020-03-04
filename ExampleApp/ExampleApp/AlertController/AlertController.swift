//
//  AlertController.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import UIKit

class AlertController: UIAlertController {

    var window: UIWindow?

    func presentInNewWindow(animated: Bool = true, completion: (() -> Void)? = nil) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.windowLevel = UIWindow.Level.alert
        window?.backgroundColor = .clear
        window?.makeKeyAndVisible()
        window?.rootViewController?.present(self, animated: animated, completion: completion)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        window = nil
    }

}
