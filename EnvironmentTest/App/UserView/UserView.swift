//
//  UserView.swift
//  Release
//
//  Created by Harshit Singh on 9/4/25.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject private var appDependencies: AppDependencies
    @ObservedObject private var viewModel: UserView.ViewModel = .init()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(viewModel.appDependencies.sessionName)
                
                Text(viewModel.data)
                
                Button("Refresh data") {
                    fetchData()
                }
            }
            .navigationTitle("User View")
            .toolbarRole(.editor)
        }
        .onAppear {
            viewModel.appDependencies = appDependencies
            fetchData()
        }
    }
    
    private func fetchData() {
        //Task { await viewModel.fetchData() }
        viewModel.fetchData2()
    }
}

#Preview {
    UserView()
}
