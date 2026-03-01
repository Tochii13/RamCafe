//
//  StudentTabView.swift
//  RamCafe
//

import SwiftUI

struct StudentTabView: View {
    @EnvironmentObject private var session: AppSession
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
                    .navigationTitle("Ram Cafe")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Today", systemImage: "sun.max")
            }
            
            NavigationStack {
                WeeklyView()
                    .navigationTitle("Weekly Menu")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Weekly", systemImage: "calendar")
            }
            
            NavigationStack {
                FavoritesView()
                    .navigationTitle("Favorites")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }
            
            NavigationStack {
                AnnouncementsView()
            }
            .tabItem {
                Label("Announcements", systemImage: "megaphone")
            }
            
            NavigationStack {
                SettingsView()
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }
    }
}

#Preview {
    StudentTabView()
        .environmentObject(AppSession())
}

