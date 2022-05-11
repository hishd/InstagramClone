//
//  LoginController.swift
//  InstagramClone
//
//  Created by Hishara Dilshan on 2022-04-26.
//

import Foundation
import UIKit
import Combine

class LoginController: UIViewController, BaseViewController {
    
    private var viewModel: LoginViewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "Instagram_logo_white")
        return image
    }()
    
    private let emailTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(of: 50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.isEnabled = false
        return button
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(first: "Don't have an account? ", second: "Sign Up", fontSize: 16)
        button.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(first: "Forgot your password? ", second: "Get help signing in.", fontSize: 14)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
        setupBindings()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        self.configureGradientLayer()
        
        view.addSubview(logo)
        logo.setDimensions(height: 80, width: 120)
        logo.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
                
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 20

        view.addSubview(stackView)
        stackView.anchor(top: logo.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.centerX(inView: view, topAnchor: stackView.bottomAnchor, paddingTop: 20)
    }

    // MARK: Actions
    
    @objc func showSignUp() {
        self.navigationController?.pushViewController(RegistrationController(), animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }
        
        if sender == passwordTextField {
            viewModel.password = sender.text
        }
    }
    
    // MARK: Helper Methods
    
    func setupBindings() {
        viewModel.$formIsValid
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isValid in
            self?.loginButton.isEnabled = isValid
        }.store(in: &cancellables)
        
        viewModel.$loginButtonColor
            .receive(on: DispatchQueue.main)
            .sink { [weak self] color in
            self?.loginButton.backgroundColor = color
        }.store(in: &cancellables)
        
        viewModel.$loginButtonTitleColor
            .receive(on: DispatchQueue.main)
            .sink { [weak self] color in
            self?.loginButton.setTitleColor(color, for: .normal)
        }.store(in: &cancellables)
    }
    
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}
