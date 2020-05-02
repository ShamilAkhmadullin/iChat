//
//  AddPhotoView.swift
//  iChat
//
//  Created by Shamil on 4/25/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class AddPhotoView: UIView {
    
    // MARK: - Properties
    
    private var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: ImagesNames.avatar.rawValue)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        let plusImage = UIImage(named: ImagesNames.plus.rawValue)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(plusImage, for: .normal)
        button.tintColor = .buttonBlack()
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(circleImageView)
        addSubview(plusButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout subviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
    }
}

// MARK: - Setup constraints

extension AddPhotoView {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor),
            trailingAnchor.constraint(equalTo: plusButton.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            circleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            circleImageView.widthAnchor.constraint(equalToConstant: 100),
            circleImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            plusButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
