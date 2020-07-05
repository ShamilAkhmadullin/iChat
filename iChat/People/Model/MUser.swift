//
//  MUser.swift
//  iChat
//
//  Created by Shamil on 6/13/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

struct MUser: Hashable, Decodable {
    
    var username: String
    var avatarStringURL: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(_ filter: String?) -> Bool {
        guard let filter = filter else { return true }
        guard !filter.isEmpty else { return true }
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
}
