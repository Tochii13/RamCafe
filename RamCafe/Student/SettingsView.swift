//
//  SettingsView.swift
//  RamCafe
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var session: AppSession
    
    @State private var prefersVeganOptions = false
    @State private var prefersGlutenFreeOptions = false
    @State private var notificationsAnnouncements = true
    @State private var notificationsNewMenuItems = true
    
    var body: some View {
        List {
            if let user = session.currentUser {
                Section("Profile") {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.name.isEmpty ? "Student" : user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text(user.role == .admin ? "Admin" : "Student")
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(.systemGray6))
                            .clipShape(Capsule())
                    }
                }
            }
            
            Section("Dietary preferences") {
                Toggle("Prefer vegan options", isOn: $prefersVeganOptions)
                Toggle("Prefer gluten-free options", isOn: $prefersGlutenFreeOptions)
            }
            
            Section("Notifications") {
                Toggle("Dining announcements", isOn: $notificationsAnnouncements)
                Toggle("New menu items", isOn: $notificationsNewMenuItems)
            }
            
            Section {
                Button(role: .destructive) {
                    session.currentUser = nil
                } label: {
                    Text("Log Out")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
            .environmentObject(AppSession())
    }
}

