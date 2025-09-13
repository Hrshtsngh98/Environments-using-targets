//
//  User.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct User: Codable, Equatable {
    let gender: String
     let name: Name
     let location: Location
     let email: String
     let login: Login
     let dob: Dob
     let registered: Registered
     let phone: String
     let cell: String
     let id: UserID
     let picture: Picture
     let nat: String
    
    static let example: User = .init(gender: "M", name: .example, location: .example, email: "alan@example.com", login: .example, dob: .example, registered: .example, phone: "312-666-8888", cell: "312-777-9999", id: .example, picture: .example, nat: "something")
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id.name == rhs.id.name
    }
}
