//
//  Coordinates.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct Coordinates: Codable {
    let latitude: String
    let longitude: String
    
    static let example = Coordinates(latitude: "-82.0", longitude: "54.0")
}
