//
//  AuthenticationViewModel.swift
//  InstagramClone
//
//  Created by Hishara Dilshan on 2022-05-10.
//

import Foundation
import UIKit


class LoginViewModel {
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
    @Published var formIsValid: Bool = false
    
    private func validateForm() {
        if FieldValidator.shared.isValidEmailAddress(of: email ?? "") &&
            FieldValidator.shared.isValidPassword(of: password ?? "") {
            self.loginButtonColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            self.formIsValid = true
        } else {
            self.loginButtonColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
            self.formIsValid = false
        }
    }
}

class RegistrationViewModel {
    
}