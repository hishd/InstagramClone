//
//  AuthenticationViewModel.swift
//  InstagramClone
//
//  Created by Hishara Dilshan on 2022-05-10.
//

import Foundation


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
    
    @Published var formIsValid: Bool = false
    
    private func validateForm() {
        self.formIsValid = (
            FieldValidator.shared.isValidEmailAddress(of: email ?? "") &&
            FieldValidator.shared.isValidPassword(of: password ?? "")
        )
    }
}

class RegistrationViewModel {
    
}
