//
//  UserRequest.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

struct UserRequest: RequestBuildable {
    var path: String = "api"
    var method: HTTPMethod = .GET
    
    var queryParameters: [String : String]? = ["name": "John"]
    var headers: [String : String]? = ["TestHeaderKey": "TestHeaderValue"]
    var timeout: Double?
}

struct UserResponse: Codable {
    let info: UserResponseInfo
    let results: [User]
}

struct UserResponseInfo: Codable {
    let page: Int
    let results: Int
    let seed: String
    let version: String
}
