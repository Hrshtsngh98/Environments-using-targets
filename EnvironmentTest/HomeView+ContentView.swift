//
//  HomeView+ContentView.swift
//  Dev
//
//  Created by Harshit Singh on 8/29/25.
//

import SwiftUI

extension HomeView {
    var contentView: some View {
        VStack(spacing: 24) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Common View")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}
