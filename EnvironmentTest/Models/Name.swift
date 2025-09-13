//
//  Name.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct Name: Codable {
    let title: String
    let first: String
    let last: String
    
    var fullName: String {
        title + " " + first + " " + last
    }
    
    static let example = Name(title: "Mr.", first:  "Alan", last: "Brooke")
}
