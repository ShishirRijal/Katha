//
//  MainTabView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI


struct MainTabView: View {
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView()
                    .tabItem {
                        Image(systemName: selectedTab == .home ? "house.fill" : "house")
                    }
                    .tag(Tabs.home)
            
            ExploreView()
                    .tabItem {
                        Image(systemName: selectedTab == .explore ? "magnifyingglass" : "magnifyingglass")
                    }
                    .tag(Tabs.explore)
            
            LibraryView()
                    .tabItem {
                        Image(systemName: selectedTab == .library ? "bookmark.fill" : "bookmark")
                    }
                    .tag(Tabs.library)
            
            ProfileView(user: dummyUser)
                    .tabItem {
                        Image(systemName: selectedTab == .profile ? "person.fill" : "person")
                    }
                    .tag(Tabs.profile)
        }
        .navigationBarBackButtonHidden(true)

        .accentColor(.theme.primary)
        
    }
}


enum Tabs {
    case home
    case explore
    case library
    case profile
}


#Preview {
    MainTabView()
}
