//
//  ConnectionInteractorTests.swift
//  ExampleAppTests
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import XCTest
@testable import ExampleApp

class ConnectionInteractorTests: XCTestCase {
    
    var interactor: ConnectionInteractor!
    var networking: NetworkingProtocol!
    
    override func setUp() {
        networking = MockNetworking()
        interactor = ConnectionInteractor(networking: networking)
    }
    
    func testOnViewStateChange_WhenViewStateChanged_OnViewStateChangeCalledWithCorrectViewState(){
        // Given
        var expectedViewState: ViewState?
        let viewSatate: ViewState = .loading
        interactor.onViewStateChange = {
            expectedViewState = $0
        }
        // When
        interactor.viewState = .loading
        // Then
        XCTAssertEqual(expectedViewState, viewSatate)
        
    }

}
