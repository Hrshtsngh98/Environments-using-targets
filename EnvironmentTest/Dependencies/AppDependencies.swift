//
//  AppDependencies.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

enum SessionType: String {
    case offline = "Dummy session"
    case real = "Real session"
}

class AppDependencies: ObservableObject {
    static let dummySession = AppDependencies(sessionType: .offline)
    let sessionType: SessionType
    
    var requestManager: RequestManaging
    var sessionManager: SessionInjectable
    
    init(sessionType: SessionType = .real) {
        self.sessionType = sessionType
        
        switch sessionType {
        case .offline:
            let newSessionManager = SessionManager()
            self.sessionManager = newSessionManager
            self.requestManager = OfflineRequestManager()
            
        case .real:
            let newSessionManager = SessionManager()
            self.sessionManager = newSessionManager
            self.requestManager = RequestManager(configuration: .init(timeout: 30), session: newSessionManager)
        }
    }
}
