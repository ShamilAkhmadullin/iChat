//
//  UISegmentedControl+Extension.swift
//  iChat
//
//  Created by Shamil on 5/2/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

extension UISegmentedControl {
    
    convenience init(_ first: String, second: String) {
        self.init()
        insertSegment(withTitle: first, at: 0, animated: true)
        insertSegment(withTitle: first, at: 1, animated: true)
        selectedSegmentIndex = 0
    }
}
