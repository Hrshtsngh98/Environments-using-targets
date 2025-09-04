//
//  User.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct User: Codable {
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
}
