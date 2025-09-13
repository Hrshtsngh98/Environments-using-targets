//
//  ContentView.swift
//  EnvironmentTest
//
//  Created by Harshit Singh on 8/29/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        contentView
    }
}

#Preview {
    HomeView()
}
