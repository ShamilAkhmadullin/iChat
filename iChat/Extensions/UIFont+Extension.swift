//
//  UIFont+Extension.swift
//  iChat
//
//  Created by Shamil on 4/12/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func avenir(_ size: CGFloat) -> UIFont? {
        return UIFont(name: FontsNames.avenir.rawValue, size: size)
    }
    
    static func laoSangamMN(_ size: CGFloat) -> UIFont? {
        return UIFont(name: FontsNames.laoSangamMN.rawValue, size: size)
    }
}
