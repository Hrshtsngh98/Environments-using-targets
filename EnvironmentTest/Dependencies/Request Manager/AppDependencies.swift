//
//  AppDependencies.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

class AppDependencies: ObservableObject {
    static let dummySession = AppDependencies(sessionName: "Dummy session")
    let sessionName: String
    
    var requestManager: RequestManager
    var sessionManager: SessionManager
    
    
    init(sessionName: String = "Real session") {
        self.sessionName = sessionName
        
        let newSessionManager = SessionManager()
        self.sessionManager = newSessionManager
        self.requestManager = RequestManager(configuration: .init(timeout: 30), session: newSessionManager)
    }
}
