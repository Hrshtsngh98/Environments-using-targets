//
//  AppCoordinator.swift
//  Release
//
//  Created by Harshit Singh on 9/13/25.
//

import SwiftUI

enum AppScreen: Hashable {
    case HomeView
    case UserView
    case UserDetailView(user: User)
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
}

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var appDependencies: AppDependencies
    
    init(appDependencies: AppDependencies) {
        self.appDependencies = appDependencies
    }
    
    @ViewBuilder
    func create(screen: AppScreen) -> some View {
        switch screen {
        case .HomeView:
            HomeView()
        case .UserView:
            UserView(viewModel: .init(appDependencies: appDependencies))
        case .UserDetailView(let user):
            UserDetailView(user: user)
        }
    }
}
