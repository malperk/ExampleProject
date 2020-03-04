//
//  ConnectionInteractor.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import Foundation


final class ConnectionInteractor: AnonymousServerConnecting & ViewStateProviding {
    
    let networking: NetworkingProtocol
    let router: MainRouter
    
    // State Management
    var viewState: ViewState = .empty {
        didSet { onViewStateChange?(viewState) }
    }
    
    var onViewStateChange: ((ViewState) -> ())?
    
    
    init(networking: NetworkingProtocol, router: MainRouter) {
        self.networking = networking
        self.router = router
    }
    
    func connect(ipAddress: String) {
        networking.connectToServer(ipAddress: ipAddress, credentials: nil) { [weak self] response in
            if response.code == 200 {
                self?.router.route(to: .confirmation)
            } else if response.code == 401 {
                self?.router.route(to: .login(ipAddress))
            } else {
                let error = AppError(innerError: nil, message: response.message)
                self?.viewState = .error(error)
            }
        }
    }
    
}
