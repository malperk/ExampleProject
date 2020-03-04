//
//  Routing.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import UIKit

protocol Routing {

    associatedtype Route

    func route(to route: Route)

}


class MainRouter: Routing {

    private var navigationController: UINavigationController?

    enum Route: Equatable {
        case login(String)
        case confirmation
    }

    init(window: UIWindow?) {
        let rootViewController = ConnectionViewController(
            interactor: ConnectionInteractor(networking: Networking.sharedInstance, router: self),
            ipValidator: IPValidator()
        )
        navigationController = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = navigationController
    }

    func route(to route: Route) {
        switch route {
        case .login(let ipAddress):
            let interactor = LoginInteractor(ipAddress: ipAddress, networking: Networking.sharedInstance, router: self)
            let viewController = LoginViewController(
                interactor: interactor,
                usernameValidator: UsernameValidator(),
                passwordValidator: PasswordValidator()
            )
            push(viewController: viewController)
        case .confirmation:
            push(viewController: ConfirmationViewController())
        }
        
    }

    private func push(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}


