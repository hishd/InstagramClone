//
//  RegistrationController.swift
//  InstagramClone
//
//  Created by Hishara Dilshan on 2022-04-26.
//

import Foundation
import UIKit
import Combine

class RegistrationController: UIViewController, BaseViewController {
    
    private var viewModel = RegistrationViewModel()
    private var cancllables: Set<AnyCancellable> = []
    
    private lazy var addImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "Email Address")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let fullNameTextField = CustomTextField(placeHolder: "Full Name")
    
    private let userNameTextField = CustomTextField(placeHolder: "Username")
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor =  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(of: 50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    private lazy var alreadyHaveAnAccount: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(first: "Already have an account?", second: "Log In", fontSize: 16)
        button.addTarget(self, action: #selector(popToLogin), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupBindings()
        configureNotificationObservers()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        self.configureGradientLayer()
        
        view.addSubview(addImageButton)
        addImageButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        addImageButton.setDimensions(height: 140, width: 140)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, userNameTextField, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: addImageButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAnAccount)
        alreadyHaveAnAccount.centerX(inView: view)
        alreadyHaveAnAccount.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    // MARK: Actions
    
    @objc func popToLogin() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        } else if sender == fullNameTextField {
            viewModel.fullName = sender.text
        } else if sender == userNameTextField {
            viewModel.userName = sender.text
        }
    }
    
    @objc func handleSelectPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    // MARK: Helper Methods
    
    func setupBindings() {
        viewModel.$formIsValid
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isValid in
                self?.signUpButton.isEnabled = isValid
            }.store(in: &cancllables)
        
        viewModel.$signInButtonColor
            .receive(on: DispatchQueue.main)
            .sink { [weak self] color in
                self?.signUpButton.backgroundColor = color
            }.store(in: &cancllables)
        
        viewModel.$signInButtonTitleColor
            .receive(on: DispatchQueue.main)
            .sink { [weak self] color in
                self?.signUpButton.setTitleColor(color, for: .normal)
            }.store(in: &cancllables)
    }
    
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

// MARK: UIImagePicker Delegates

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        
        addImageButton.layer.cornerRadius = addImageButton.frame.width/2
        addImageButton.layer.masksToBounds = true
        addImageButton.layer.borderColor = UIColor.white.cgColor
        addImageButton.layer.borderWidth = 1
        addImageButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true)
    }
}
