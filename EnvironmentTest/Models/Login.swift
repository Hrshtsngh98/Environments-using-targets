//
//  Login.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct Login: Codable {
    let uuid: String
    let username: String
    let password, salt, md5, sha1, sha256: String
}
