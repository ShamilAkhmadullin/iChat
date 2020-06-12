//
//  ActiveChatCell.swift
//  iChat
//
//  Created by Shamil on 5/12/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class ActiveChatCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let friendImageView = UIImageView()
    let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: .gradientPurple(), endColor: .gradientBlue())
    
    let friendName = UILabel(LabelsNames.userName.rawValue, font: .laoSangamMN(20))
    let lastMessage = UILabel(LabelsNames.howAreYou.rawValue, font: .laoSangamMN(18))
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout subviews

extension ActiveChatCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 4
        clipsToBounds = true
    }
}

// MARK: - Configuration

extension ActiveChatCell: SelfConfiguringCell {
    
    static var reuseId = CellsIdentifiers.activeChatsCell.rawValue
    
    func configure(with value: MChat) {
        friendImageView.image = UIImage(named: value.userImageString)
        
        friendName.text = value.userName
        lastMessage.text = value.lastMessage
    }
}

// MARK: - Setup constraints

extension ActiveChatCell {
    
    private func setConstraints() {
        addSubview(friendImageView)
        addSubview(gradientView)
        addSubview(friendName)
        addSubview(lastMessage)
        
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        friendImageView.backgroundColor = .orange
        gradientView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        NSLayoutConstraint.activate([
            friendName.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            friendName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            lastMessage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            lastMessage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 78),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
    }
}
