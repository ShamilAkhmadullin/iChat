//
//  SetupProfileViewController.swift
//  iChat
//
//  Created by Shamil on 4/25/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class SetupProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    private let fillImageView = AddPhotoView()
    
    let welcomeLabel = UILabel(LabelsNames.setUpProfile.rawValue, font: .avenir(26))
    let fullNameLabel = UILabel(LabelsNames.fullName.rawValue)
    let aboutMeLabel = UILabel(LabelsNames.aboutMe.rawValue)
    let sexLabel = UILabel(LabelsNames.sex.rawValue)
    
    let fullNameTextField = OneLineTextField(.textFieldLight())
    let aboutMeTextField = OneLineTextField(.textFieldLight())
    
    let sexSegmentedControl = UISegmentedControl(SegmentedControlsNames.male.rawValue, second: SegmentedControlsNames.female.rawValue)
    let goToChatsButton = UIButton(ButtonsNames.goToChats.rawValue, titleColor: .white, backgroundColor: .buttonBlack())
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
}

// MARK: - Setup constraints

extension SetupProfileViewController {
    
    private func setupConstraints() {
        let fullNameStackView = UIStackView([fullNameLabel, fullNameTextField], axis: .vertical, spacing: 0)
        let aboutMeStackView = UIStackView([aboutMeLabel, aboutMeTextField], axis: .vertical, spacing: 0)
        let sexStackView = UIStackView([sexLabel, sexSegmentedControl], axis: .vertical, spacing: 12)
        let stackView = UIStackView([fullNameStackView, aboutMeStackView, sexStackView, goToChatsButton], axis: .vertical, spacing: 40)
        
        view.addSubview(welcomeLabel)
        view.addSubview(fillImageView)
        view.addSubview(stackView)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        fillImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goToChatsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            fillImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            fillImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: fillImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}
