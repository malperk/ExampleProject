//
//  ConnectionProtocols.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import Foundation


protocol AnonymousServerConnecting {
    func connect(ipAddress: String)
}


protocol ServerConnecting {
    func connect(ipAddress: String, username: String, password: String)
}
