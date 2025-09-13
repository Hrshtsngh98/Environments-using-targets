//
//  HomeView+ContentView.swift
//  Dev
//
//  Created by Harshit Singh on 8/29/25.
//

import SwiftUI

extension HomeView {
    var contentView: some View {
        NavigationStack(path: $coordinator.path) {
            VStack(spacing: 24) {
                Text("Common View")
                
                Button("Go to User View") {
                    coordinator.path.append(AppScreen.UserView)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .navigationDestination(for: AppScreen.self) { screen in
                coordinator.create(screen: screen)
            }
        }
        .environmentObject(coordinator)
    }
}
