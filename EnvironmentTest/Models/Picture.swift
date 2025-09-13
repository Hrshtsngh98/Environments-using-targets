//
//  Picture.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
    
    static let example: Picture = .init(large: "Wall", medium: "Wall", thumbnail: "Wall")
}
