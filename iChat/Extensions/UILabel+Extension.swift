//
//  UILabel+Extension.swift
//  iChat
//
//  Created by Shamil on 4/12/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(_ text: String, font: UIFont? = .avenir(20)) {
        self.init()
        self.text = text
        self.font = font
    }
}
