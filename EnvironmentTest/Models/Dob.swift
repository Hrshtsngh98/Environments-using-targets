//
//  Dob.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct Dob: Codable {
    let date: String
    let age: Int
    
    static let example = Dob(date: "1993", age: 32)
}
