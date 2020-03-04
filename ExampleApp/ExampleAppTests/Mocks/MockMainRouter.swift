//
//  MockMainRouter.swift
//  ExampleAppTests
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import UIKit
@testable import ExampleApp


class MockMainRouter: MainRouter {
    
    var lastRoute: MainRouter.Route?
    
    init() {
        super.init(window: UIWindow())
    }
    
    override func route(to route: MainRouter.Route) {
        lastRoute = route
    }
}
