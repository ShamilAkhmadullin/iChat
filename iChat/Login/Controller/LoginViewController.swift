//
//  LoginViewController.swift
//  iChat
//
//  Created by Shamil on 4/25/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let welcomeLabel = UILabel(LabelsNames.welcomeBack.rawValue, font: .avenir(26))
    private let loginWithLabel = UILabel(LabelsNames.loginWith.rawValue)
    private let orLabel = UILabel(LabelsNames.or.rawValue)
    private let emailLabel = UILabel(LabelsNames.email.rawValue)
    private let passwordLabel = UILabel(LabelsNames.password.rawValue)
    private let needAnAccountLabel = UILabel(LabelsNames.needAnAccount.rawValue)
    
    private let googleButton = UIButton(ButtonsNames.google.rawValue, titleColor: .black, backgroundColor: .white, isShadow: true)
    private let loginButton = UIButton(ButtonsNames.login.rawValue, titleColor: .white, backgroundColor: .buttonBlack())
    private let signUpButton = UIButton(ButtonsNames.signUp.rawValue, titleColor: .buttonRed(), backgroundColor: .white)
    
    private let emailTextField = OneLineTextField(.textFieldLight())
    private let passwordTextField = OneLineTextField(.textFieldLight())
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        googleButton.customizeGoogleButton()
        setupConstraints()
    }
}

// MARK: - Setup constraints

extension LoginViewController {
    
    private func setupConstraints() {
        let loginWithView = ButtonFormView(loginWithLabel, button: googleButton)
        
        let emailStackView = UIStackView([emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView([passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        let stackView = UIStackView([loginWithView, orLabel, emailStackView, passwordStackView, loginButton], axis: .vertical, spacing: 40)
        let bottomStackView = UIStackView([needAnAccountLabel, signUpButton], axis: .horizontal, spacing: 10)
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomStackView.alignment = .firstBaseline
        signUpButton.contentHorizontalAlignment = .leading
        
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}
