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
    
    // State Management
    var viewState: ViewState = .empty {
        didSet { onViewStateChange?(viewState) }
    }
    
    var onViewStateChange: ((ViewState) -> ())?
    
    
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func connect(ipAddress: String) {
        networking.connectToServer(ipAddress: ipAddress, credentials: nil) { response in
            
        }
        
    }
}
