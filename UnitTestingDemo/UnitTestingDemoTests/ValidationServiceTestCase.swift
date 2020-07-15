//
//  ValidationServiceTestCase.swift
//  UnitTestingDemoTests
//
//  Created by mac admin on 14/07/20.
//  Copyright © 2020 Kunal. All rights reserved.
//

import XCTest
@testable import UnitTestingDemo

class ValidationServiceTestCase: XCTestCase {
    
    var validation: ValidationService!
    
    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    override func tearDown() {
        super.tearDown()
        validation = nil
    }
    
    func test_is_valid_userName() throws {
        XCTAssertNoThrow(try validation.validateUserName("kunl"))
    }
    
    func test_username_is_nil() throws {
        let expectedError = ValidationError.invalidValue
        var error:ValidationError?
        
        XCTAssertThrowsError(try validation.validateUserName(nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
    }

}
