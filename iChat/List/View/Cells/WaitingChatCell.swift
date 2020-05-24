//
//  WaitingChatCell.swift
//  iChat
//
//  Created by Shamil on 5/24/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class WaitingChatCell: UICollectionViewCell {
    
    // MARK: - Property
    
    let friendImageView = UIImageView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout subviews

extension WaitingChatCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 4
        clipsToBounds = true
    }
}

// MARK: - Configuration

extension WaitingChatCell: SelfConfiguringCell {
    
    static var reuseId: String = CellsIdentifiers.waitingChatsCell.rawValue
    
    func configure(with value: MChat) {
        friendImageView.image = UIImage(named: value.userImageString)
    }
}

// MARK: - Set constraints

extension WaitingChatCell {
    
    private func setConstraints() {
        addSubview(friendImageView)
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: topAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
