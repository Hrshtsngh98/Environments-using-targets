//
//  OfflineRequestManager.swift
//  EnvironmentTest
//
//  Created by Harshit Singh on 9/13/25.
//

import Foundation

class OfflineRequestManager: RequestManaging {
    func makeRequest(requestBuildable: any RequestBuildable) async throws -> (Data, URLResponse) {
        try await makeRequest(requestBuildable: requestBuildable, delegate: nil)
    }
    
    func makeRequest(requestBuildable: any RequestBuildable, completion: @escaping (Data?, URLResponse?, (any Error)?) -> Void) -> URLSessionDataTask? {
        completion(nil, nil, MyAppError.noInternetConnection)
        return nil
    }
    
    func makeRequest(requestBuildable: any RequestBuildable, delegate: (any URLSessionTaskDelegate)? = nil) async throws -> (Data, URLResponse) {
        throw MyAppError.noInternetConnection
    }
}
