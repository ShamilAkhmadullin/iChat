//
//  SignUpViewController.swift
//  iChat
//
//  Created by Shamil on 4/19/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    
    private let welcomeLabel = UILabel(LabelsNames.welcome.rawValue, font: .avenir(26))
    private let emailLabel = UILabel(LabelsNames.email.rawValue)
    private let passwordLabel = UILabel(LabelsNames.password.rawValue)
    private let confirmPasswordLabel = UILabel(LabelsNames.confirmPassword.rawValue)
    private let alreadyOnboardLabel = UILabel(LabelsNames.alreadyOnboard.rawValue)
    
    private let emailTextField = OneLineTextField(.textFieldLight())
    private let passwordTextField = OneLineTextField(.textFieldLight())
    private let confirmPasswordTextField = OneLineTextField(.textFieldLight())
    
    private let signUpButton = UIButton(ButtonsNames.signUp.rawValue, titleColor: .white, backgroundColor: .buttonBlack())
    private let loginButton = UIButton(ButtonsNames.login.rawValue, titleColor: .buttonRed(), backgroundColor: .white)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
    }
}

// MARK: - Setup constraints

extension SignUpViewController {
    
    private func setConstraints() {
        let emailStackView = UIStackView([emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView([passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        let confirmPasswordStackView = UIStackView([confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spacing: 0)
        let stackView = UIStackView([emailStackView, passwordStackView, confirmPasswordStackView, signUpButton], axis: .vertical, spacing: 40)
        let bottomStackView = UIStackView([alreadyOnboardLabel, loginButton], axis: .horizontal, spacing: 10)
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView) 
        view.addSubview(bottomStackView)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomStackView.alignment = .firstBaseline
        
        NSLayoutConstraint.activate([
            signUpButton.heightAnchor.constraint(equalToConstant: 60)
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
