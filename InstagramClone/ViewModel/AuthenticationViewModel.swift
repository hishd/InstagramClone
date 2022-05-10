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
        self.formIsValid = (email?.isEmpty == false && password?.isEmpty == false)
    }
}

class RegistrationViewModel {
    
}
