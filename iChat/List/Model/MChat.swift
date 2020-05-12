//
//  MChat.swift
//  iChat
//
//  Created by Shamil on 5/5/20.
//  Copyright © 2020 Shamil Akhmadullin. All rights reserved.
//

import UIKit

struct MChat: Hashable, Decodable {
    
    var userName: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}
