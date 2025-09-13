//
//  UserDetailView+ViewModel.swift
//  EnvironmentTest
//
//  Created by Harshit Singh on 9/13/25.
//

import Foundation

extension UserDetailView {
    
    class ViewModel: ObservableObject {
        @Published var user: User
        
        init(user: User) {
            self.user = user
        }
    }
}
