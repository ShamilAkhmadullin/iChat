//
//  SelfConfiguringCell.swift
//  iChat
//
//  Created by Shamil on 5/12/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import Foundation

protocol SelfConfiguringCell {
    
    static var reuseId: String { get }
    
    func configure(with value: MChat)
}
