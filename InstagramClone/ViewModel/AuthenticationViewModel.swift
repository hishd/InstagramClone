//
//  AuthenticationViewModel.swift
//  InstagramClone
//
//  Created by Hishara Dilshan on 2022-05-10.
//

import Foundation
import UIKit


class LoginViewModel: Validatable {
    var email: String? {
        didSet {
            validateForm()
        }
    }
    var password: String? {
        didSet {
            validateForm()
        }
    }
    
    @Published var loginButtonColor: UIColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    @Published var loginButtonTitleColor: UIColor = UIColor(white: 1, alpha: 0.67)
    @Published var formIsValid: Bool = false
    
    func validateForm() {
        if FieldValidator.shared.isValidEmailAddress(of: email ?? "") &&
            FieldValidator.shared.isValidPassword(of: password ?? "") {
            self.loginButtonColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            self.loginButtonTitleColor = .white
            self.formIsValid = true
        } else {
            self.loginButtonColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
            self.loginButtonTitleColor = UIColor(white: 1, alpha: 0.67)
            self.formIsValid = false
        }
    }
}

class RegistrationViewModel: Validatable {
    @Published var formIsValid: Bool  = false
    @Published var signInButtonColor: UIColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    @Published var signInButtonTitleColor: UIColor = UIColor(white: 1, alpha: 0.67)
    
    var email: String? {
        didSet {
            validateForm()
        }
    }
    var password: String? {
        didSet {
            validateForm()
        }
    }
    var fullName: String? {
        didSet {
            validateForm()
        }
    }
    var userName: String? {
        didSet {
            validateForm()
        }
    }
    
    func validateForm() {
        if FieldValidator.shared.isValidEmailAddress(of: email ?? "") &&
            FieldValidator.shared.isValidPassword(of: password ?? "") &&
            FieldValidator.shared.isValidPersonName(of: fullName ?? "") &&
            FieldValidator.shared.isValidUserName(of: userName ?? "") {
            self.formIsValid = true
            self.signInButtonColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            self.signInButtonTitleColor = .white
            debugPrint("Form is valid")
        } else {
            self.formIsValid = false
            self.signInButtonColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
            self.signInButtonTitleColor = UIColor(white: 1, alpha: 0.67)
            debugPrint("Form not valid")
        }
    }
}
