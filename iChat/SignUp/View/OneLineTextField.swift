//
//  OneLineTextField.swift
//  iChat
//
//  Created by Shamil on 4/19/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

final class OneLineTextField: UITextField {
    
    convenience init(_ lineColor: UIColor, _ font: UIFont? = .avenir(20)) {
        self.init()
        self.font = font
        borderStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
        
        var bottomView = UIView()
        bottomView = UIView(frame: .zero)
        bottomView.backgroundColor = lineColor
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
