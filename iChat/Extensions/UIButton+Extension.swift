//
//  UIButton+Extension.swift
//  iChat
//
//  Created by Shamil on 4/12/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(_ title: String,
                     titleColor: UIColor,
                     backgroundColor: UIColor,
                     font: UIFont? = .avenir(20),
                     isShadow: Bool = false,
                     cornerRadius: CGFloat = 4) {
        self.init(type: .system)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
        layer.cornerRadius = cornerRadius
        
        if isShadow {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 4
            layer.shadowOpacity = 0.2
            layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
    
    func customizeGoogleButton() {
        let googleLogo = UIImageView(UIImage(named: ImageNames.googleLogo.rawValue), contentMode: .scaleAspectFit)
        
        addSubview(googleLogo)
        
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            googleLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            googleLogo.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
