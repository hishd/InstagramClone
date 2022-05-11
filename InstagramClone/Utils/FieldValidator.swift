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
    lazy var namePredicate = NSPredicate(format: "SELF MATCHES %@", Patterns.nameRegex.rawValue)
    lazy var userNamePredicate = NSPredicate(format: "SELF MATCHES %@", Patterns.userNameRegex.rawValue)
    
    func isValidEmailAddress(of email: String) -> Bool {
        return self.emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(of password: String) -> Bool {
        return self.passwordPredicate.evaluate(with: password)
    }
    
    func isValidPersonName(of name: String) -> Bool {
        return self.namePredicate.evaluate(with: name)
    }
    
    func isValidUserName(of userName: String) -> Bool {
        return self.userNamePredicate.evaluate(with: userName)
    }
    
    private enum Patterns: String {
        case userNameRegex = "[A-Za-z]{4,20}"
        case nameRegex = "[A-Za-z ]{2,100}"
        case emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case passwordRegex = "[A-Za-z\\d]{6,}"
    }
}
