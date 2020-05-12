//
//  AuthorizationViewController.swift
//  iChat
//
//  Created by Shamil on 4/12/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit
import SwiftUI

final class AuthorizationViewController: UIViewController {
    
    // MARK: - Properties
    
    let logoImageView = UIImageView(.init(imageLiteralResourceName: ImagesNames.logo.rawValue), contentMode: .scaleAspectFit)
    
    private let googleLabel = UILabel(LabelsNames.google.rawValue)
    private let signUpWithLabel = UILabel(LabelsNames.signUpWith.rawValue)
    private let alreadyLabel = UILabel(LabelsNames.alreadyOnboard.rawValue)
    
    private let googleButton = UIButton(ButtonsNames.google.rawValue, titleColor: .black, backgroundColor: .white, isShadow: true)
    private let emailButton = UIButton(ButtonsNames.email.rawValue, titleColor: .white, backgroundColor: .buttonBlack())
    private let loginButton = UIButton(ButtonsNames.login.rawValue, titleColor: .buttonRed(), backgroundColor: .white, isShadow: true)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        googleButton.customizeGoogleButton()
        setConstraints()
    }
}

// MARK: - Setup constraints

extension AuthorizationViewController {
    
    private func setConstraints() {
        let googleView = ButtonFormView(googleLabel, button: googleButton)
        let emailView = ButtonFormView(signUpWithLabel, button: emailButton)
        let loginView = ButtonFormView(alreadyLabel, button: loginButton)
        
        let stackView = UIStackView([googleView, emailView, loginView], axis: .vertical, spacing: 40)
        
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

// MARK: - Preview provider

struct AuthorizationViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        private let viewController = AuthorizationViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthorizationViewControllerProvider.ContainerView>) -> AuthorizationViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: AuthorizationViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthorizationViewControllerProvider .ContainerView>) {
            
        }
    }
}
