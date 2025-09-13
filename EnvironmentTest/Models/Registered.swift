//
//  Registered.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct Registered: Codable {
    let date: String
    let age: Int
    
    static let example = Registered(date: "2023", age: 3)
}
