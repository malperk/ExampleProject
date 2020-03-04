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

    }

    func route(to route: Route) {

    }

    private func push(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}


