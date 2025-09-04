//
//  HomeView+ContentView.swift
//  Dev
//
//  Created by Harshit Singh on 8/29/25.
//

import SwiftUI

extension HomeView {
    var contentView: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Common View")
                
                NavigationLink {
                    UserView()
                        .environmentObject(appDependencies)
                } label: {
                    Text("Go to User View")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }
}
