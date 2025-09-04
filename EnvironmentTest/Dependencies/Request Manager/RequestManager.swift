//
//  RequestManager.swift
//  Release
//
//  Created by Harshit Singh on 8/29/25.
//

import Foundation

protocol SessionInjectable {
    var baseURL: URL { get }
    var sessionInjectable: [String: String]? { get }
}

public protocol RequestBuildable {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryParameters: [String: String]? { get }
    var headers: [String: String]? { get }
    var timeout: Double? { get }
}

public enum HTTPMethod: String {
    case GET, POST, DELETE, PUT
}

class RequestManager {
    struct Configuration {
        var timeout: TimeInterval = 30
        var cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    }
    
    var configuration: Configuration
    var session: SessionInjectable
    
    init(configuration: Configuration, session: SessionInjectable) {
        self.configuration = configuration
        self.session = session
    }
    
    @discardableResult
    func makeRequest(requestBuildable: RequestBuildable, completion: @escaping (Data?, URLResponse?, (any Error)?) -> Void) -> URLSessionDataTask {
        
        let request = buildRequest(path: requestBuildable.path,
                                   method: requestBuildable.method,
                                   queryParameters: requestBuildable.queryParameters,
                                   headers: requestBuildable.headers,
                                   timeout: requestBuildable.timeout ?? configuration.timeout)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
        return task
    }
    
    func makeRequest(requestBuildable: RequestBuildable, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        let request = buildRequest(path: requestBuildable.path,
                                   method: requestBuildable.method,
                                   queryParameters: requestBuildable.queryParameters,
                                   headers: requestBuildable.headers,
                                   timeout: requestBuildable.timeout ?? configuration.timeout)
        
        return try await URLSession.shared.data(for: request)
    }
    
    private func buildRequest(path: String,
                      method: HTTPMethod,
                      queryParameters: [String: String]? = nil,
                      headers: [String: String]? = nil,
                      timeout: Double? = nil) -> URLRequest {
        // build url
        var url = session.baseURL.appendingPathComponent(path)
            
        
        // build query params
        if let queryParameters, !queryParameters.isEmpty {
            var queryItems: [URLQueryItem] = []
            queryParameters.forEach { (key, value) in
                queryItems.append(.init(name: key, value: value))
            }
            url = url.appending(queryItems: queryItems)
        }
        
        // build requesst
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = timeout ?? configuration.timeout
        urlRequest = updateHeaders(urlRequest: urlRequest, headers: headers)
        
        return urlRequest
    }
    
    private func updateHeaders(urlRequest: URLRequest, headers: [String: String]?) -> URLRequest {
        var request = urlRequest
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        headers?.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }

        return request
    }
}
