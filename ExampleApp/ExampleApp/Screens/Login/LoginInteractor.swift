//
//  LoginInteractor.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import Foundation


final class LoginInteractor: ServerConnecting & ViewStateProviding {
    
    let networking: NetworkingProtocol
    let router: MainRouter
    let ipAddress: String
    
    // State Management
    var viewState: ViewState = .empty {
        didSet { onViewStateChange?(viewState) }
    }
    
    var onViewStateChange: ((ViewState) -> ())?
    
    init(ipAddress: String, networking: NetworkingProtocol, router: MainRouter) {
        self.networking = networking
        self.router = router
        self.ipAddress = ipAddress
    }
    
    func connect(username: String, password: String) {
        viewState = .loading
        let credentials = Credentials(username: username, password: password)
        networking.connectToServer(ipAddress: ipAddress, credentials: credentials) { [weak self] response in
        self?.viewState = .ready
            if response.code == 200 {
                self?.router.route(to: .confirmation)
            } else {
                let error = AppError(innerError: nil, message: response.message)
                self?.viewState = .error(error)
            }
        }
    }
    
}
