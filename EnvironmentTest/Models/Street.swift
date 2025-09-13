//
//  Street.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct Street: Codable {
    let number: Int
    let name: String
    
    static let example = Street(number: 123, name: "Main St.")
}
