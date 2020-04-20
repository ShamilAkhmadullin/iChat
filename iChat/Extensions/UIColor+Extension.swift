//
//  UIColor+Extension.swift
//  iChat
//
//  Created by Shamil on 4/12/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init?(_ hex: String) {
        let r, g, b, a: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}

extension UIColor {
    
    static func mainWhite() -> UIColor {
        return UIColor(ColorHexNames.mainWhite.rawValue) ?? UIColor.white
    }
    
    static func buttonRed() -> UIColor {
        return UIColor(ColorHexNames.buttonRed.rawValue) ?? UIColor.red
    }
    
    static func buttonBlack() -> UIColor {
        return UIColor(ColorHexNames.buttonBlack.rawValue) ?? UIColor.black
    }
    
    static func textFieldLight() -> UIColor {
        return UIColor(ColorHexNames.textFieldLight.rawValue) ?? UIColor.lightGray
    }
}
