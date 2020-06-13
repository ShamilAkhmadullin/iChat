//
//  PeopleSection.swift
//  iChat
//
//  Created by Shamil on 6/13/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import Foundation

enum PeopleSection: Int, CaseIterable {
    
    case users
    
    func description(usersCount: Int) -> String {
        switch self {
        case .users:
            return "\(usersCount) people nearby"
        }
    }
}
