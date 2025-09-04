//
//  SessionManager.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import Foundation

class SessionManager: SessionInjectable {
    var baseURL: URL
    
    var sessionInjectable: [String : String]?
    
    init() {
        self.baseURL = URL(string: "https://randomuser.me/")!
        self.sessionInjectable = ["token": "ABC...XYZ"]
    }

}
