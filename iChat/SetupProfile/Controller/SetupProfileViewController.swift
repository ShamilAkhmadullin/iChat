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
        view.addSubview(fillImageView)
        
        fillImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fillImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            fillImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
