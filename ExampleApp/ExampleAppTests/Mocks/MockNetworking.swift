//
//  MockNetworking.swift
//  ExampleAppTests
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import Foundation
@testable import ExampleApp


let mockNetworkingResponse = NetworkingResponse(success: false, code: -1, message: "")

final class MockNetworking: NetworkingProtocol {
    
    var connectToServerResponse: NetworkingResponse = mockNetworkingResponse
    
    func connectToServer(
        ipAddress: String,
        credentials: Credentials?,
        completionHandler: @escaping (NetworkingResponse) -> Void
    ) {
        completionHandler(connectToServerResponse)
    }
    
    func getServerGroups(completionHandler: @escaping ([ServerGroup]) -> Void) throws {
        
    }
    
    func configureServer(
        name: String,
        serverGroupName: String?,
        newServerGroup: ServerGroup?,
        completionHandler: @escaping (NetworkingResponse) -> Void
    ) throws {
        
    }
    
}
