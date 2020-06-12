//
//  Section.swift
//  iChat
//
//  Created by Shamil on 5/5/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import Foundation

enum Section: Int, CaseIterable {
    
    case waitingChats
    case activeChats
    
    func description() -> String {
        switch self {
        case .waitingChats:
            return SectionHeadersNames.waitingChats.rawValue
        case .activeChats:
            return SectionHeadersNames.activeChats.rawValue
        }
    }
}
