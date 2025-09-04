//
//  UserId.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct UserID: Codable {
    let name: String
    let value: String? // Value can sometimes be null, so it's safer as an optional.
}
