//
//  UIImageView+Extension.swift
//  iChat
//
//  Created by Shamil on 4/12/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(_ image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
}
