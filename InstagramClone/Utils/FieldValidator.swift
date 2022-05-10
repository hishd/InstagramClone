//
//  FieldValidator.swift
//  InstagramClone
//
//  Created by Hishara Dilshan on 2022-05-10.
//

import Foundation

class FieldValidator {
    static let shared = FieldValidator()
    private init() {}
    
    lazy var emailPredicate = NSPredicate(format: "SELF MATCHES %@", Patterns.emailRegex.rawValue)
    lazy var passwordPredicate = NSPredicate(format: "SELF MATCHES %@", Patterns.passwordRegex.rawValue)
    
    func isValidEmailAddress(of email: String) -> Bool {
        return self.emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(of password: String) -> Bool {
        return self.passwordPredicate.evaluate(with: password)
    }
    
    private enum Patterns: String {
        case emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case passwordRegex = "[A-Za-z\\d]{6,}"
    }
}
