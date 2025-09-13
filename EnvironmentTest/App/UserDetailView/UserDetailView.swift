//
//  UserDetailView.swift
//  EnvironmentTest
//
//  Created by Harshit Singh on 9/13/25.
//

import SwiftUI

struct UserDetailView: View {
    @State private var viewModel: UserDetailView.ViewModel
    
    init(user: User) {
        self.viewModel = .init(user: user)
    }
    
    var body: some View {
        VStack {
            Text(viewModel.user.name.fullName)
        }
        .navigationTitle("User Detail View")
    }
}

#Preview {
    UserDetailView(user: .example)
}
