//
//  Validatable.swift
//  InstagramClone
//
//  Created by Hishara Dilshan on 2022-05-11.
//

import Foundation

protocol Validatable {
    var formIsValid: Bool {get}
    func validateForm()
}
