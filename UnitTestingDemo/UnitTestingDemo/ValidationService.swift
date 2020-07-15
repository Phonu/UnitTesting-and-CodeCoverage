//
//  ValidationService.swift
//  UnitTestingDemo
//
//  Created by mac admin on 14/07/20.
//  Copyright © 2020 Kunal. All rights reserved.
//

import Foundation

struct ValidationService {
    
    func validateUserName(_ userName: String?) throws -> String {
        guard let username = userName else {throw ValidationError.invalidValue}
        guard username.count > 3 else {throw ValidationError.usernameTooShort}
        return username
    }
    
}


enum ValidationError: LocalizedError {
    case invalidValue
    case usernameTooShort
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered an invalid value"
        case .usernameTooShort:
            return "your username is too short"
        }
    }
}
