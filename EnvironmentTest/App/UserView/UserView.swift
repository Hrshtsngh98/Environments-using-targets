//
//  UserView.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import SwiftUI

// EnvironmentKey for passsing objects using .environment
// Use @Entry
// extension EnvironmentValues

struct UserView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @ObservedObject var viewModel: UserView.ViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(viewModel.appDependencies.sessionType.rawValue)
                
                if viewModel.data.isEmpty {
                    Text("Placeholder user name")
                        .redacted(reason: .placeholder)
                } else {
                    Text(viewModel.data)
                }
                
                
                Button("Go to user Details") {
                    if let user = viewModel.user {
                        coordinator.path.append(AppScreen.UserDetailView(user: user))
                    } else {
                        print("no user data")
                    }
                }
                
                Button("Refresh data") {
                    fetchData()
                }
            }
            .navigationTitle("User Main View")
            .toolbarRole(.editor)
        }
        .task {
            fetchData()
        }
    }
    
    private func fetchData() {
        Task { await viewModel.fetchData() }
//        viewModel.fetchData2()
    }
}

#Preview {
    UserView(viewModel: .init(appDependencies: .dummySession))
}
