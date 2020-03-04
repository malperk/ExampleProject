//
//  ValidatorTests.swift
//  ExampleAppTests
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import XCTest
@testable import ExampleApp

class ValidatorTests: XCTestCase {
    
    func testIPValidatorValidate_WhenIsValid_ReturnsTrue(){
        // Given
        let ip = "192.168.1.10"
        let validator = IPValidator()
        // When
        let result = validator.validate(string: ip)
        // Then
        XCTAssertTrue(result)
    }
    
    func testIPValidatorValidate_WhenIsUnvalid_ReturnsFalse(){
        // Given
        let ip = "42"
        let validator = IPValidator()
        // When
        let result = validator.validate(string: ip)
        // Then
        XCTAssertFalse(result)
        
    }
    
    func testUsernameValidate_WhenIsValid_ReturnsTrue(){
        // Given
        let ip = "aa"
        let validator = UsernameValidator()
        // When
        let result = validator.validate(string: ip)
        // Then
        XCTAssertTrue(result)
    }
    
    func testUsernameValidate_WhenIsUnvalid_ReturnsFalse(){
        // Given
        let ip = "a"
        let validator = UsernameValidator()
        // When
        let result = validator.validate(string: ip)
        // Then
        XCTAssertFalse(result)
        
    }
    
    func testPasswordValidatorValidate_WhenIsValid_ReturnsTrue(){
        // Given
        let ip = "aaaaa"
        let validator = PasswordValidator()
        // When
        let result = validator.validate(string: ip)
        // Then
        XCTAssertTrue(result)
    }
    
    func testPasswordValidatorValidate_WhenIsUnvalid_ReturnsFalse(){
        // Given
        let ip = "aaaa"
        let validator = PasswordValidator()
        // When
        let result = validator.validate(string: ip)
        // Then
        XCTAssertFalse(result)
        
    }

}
