//
//  HomeView.swift
//  Dev
//
//  Created by Harshit Singh on 8/29/25.
//

import SwiftUI

struct HomeView: View {
    @State var showDebugSheet = false
    @EnvironmentObject var appDependencies: AppDependencies
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            contentView
            Button {
                showDebugSheet = true
            } label: {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .tint(.red)
            }
        }
        .sheet(isPresented: $showDebugSheet) {
            DebugView()
        }
        
    }
}

#Preview {
    HomeView()
}
