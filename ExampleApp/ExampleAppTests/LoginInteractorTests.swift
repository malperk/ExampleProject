//
//  LoginInteractorTests.swift
//  ExampleAppTests
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import XCTest
@testable import ExampleApp

class LoginInteractorTests: XCTestCase {
    
    var interactor: LoginInteractor!
    var networking: MockNetworking!
    var router: MockMainRouter!
    
    override func setUp() {
        networking = MockNetworking()
        router = MockMainRouter()
        interactor = LoginInteractor(ipAddress: "", networking: networking, router: router)
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
    
    func testConnect_WhenRetuns200_RouteToConfirmation(){
        // Given
        networking.connectToServerResponse = NetworkingResponse(success: true, code: 200, message: "")
        // When
        interactor.connect(username: "", password: "")
        // Then
        XCTAssertEqual(router.lastRoute, MainRouter.Route.confirmation)
        
    }
    
    
    func testConnect_WhenRetuns0_OnViewStateChangeCalledWithCorrectViewState(){
        // Given
        var expectedViewState: ViewState?
        interactor.onViewStateChange = {
            expectedViewState = $0
        }
        let message = "42"
        networking.connectToServerResponse = NetworkingResponse(success: true, code: 0, message: message)
        // When
        interactor.connect(username: "", password: "")
        // Then
        guard let viewState = expectedViewState, case let ViewState.error(error) = viewState else {
            XCTFail("Should get an error state")
            return
        }
        XCTAssertEqual(error.message, message)
    }

}

