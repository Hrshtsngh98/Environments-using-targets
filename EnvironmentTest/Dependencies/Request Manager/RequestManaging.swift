//
//  RequestManageable.swift
//  EnvironmentTest
//
//  Created by Harshit Singh on 9/13/25.
//

import Foundation

protocol RequestManaging {
    @discardableResult
    func makeRequest(requestBuildable: RequestBuildable, completion: @escaping (Data?, URLResponse?, (any Error)?) -> Void) -> URLSessionDataTask?
    func makeRequest(requestBuildable: RequestBuildable, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
    func makeRequest(requestBuildable: RequestBuildable) async throws -> (Data, URLResponse)
}

public protocol RequestBuildable {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryParameters: [String: String]? { get }
    var headers: [String: String]? { get }
    var timeout: Double? { get }
}
