//
//  UserView+ViewModel.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import SwiftUI

extension UserView {
    
    class ViewModel: ObservableObject {
        @Published var appDependencies: AppDependencies = .dummySession
        @Published var data: String = ""
        
        var requestManager: RequestManager { appDependencies.requestManager }
        
        @MainActor
        func fetchData() async {
            let request = UserRequest()
            do {
                let response = try await requestManager.makeRequest(requestBuildable: request)
                let jsonData = try JSONSerialization.jsonObject(with: response.0)
                if JSONSerialization.isValidJSONObject(jsonData) {
                    let parsedData = try JSONDecoder().decode(UserResponse.self, from: response.0)
                    let user = parsedData.results.first!
                    let newData = user.name.first + " " + user.name.last
                    data = newData
                } else {
                    data = "Data parsing error."
                }
                
            } catch let error {
                data = error.localizedDescription
            }
        }
        
        func fetchData2() {
            let request = UserRequest()
            
            requestManager.makeRequest(requestBuildable: request) { data, _, _ in
                do {
                    guard let data else {
                        Task { @MainActor in
                            self.data = "No response data"
                        }
                        return
                    }
                    
                    let jsonData = try JSONSerialization.jsonObject(with: data)
                    if JSONSerialization.isValidJSONObject(jsonData) {
                        let parsedData = try JSONDecoder().decode(UserResponse.self, from: data)
                        let user = parsedData.results.first!
                        let newData = user.name.first + " " + user.name.last
                        Task { @MainActor in
                            self.data = newData
                        }
                    } else {
                        Task { @MainActor in
                            self.data = "Data parsing error."
                        }
                    }
                } catch let error {
                    Task { @MainActor in
                        self.data = error.localizedDescription
                    }
                }
            }
        }
    }
}
