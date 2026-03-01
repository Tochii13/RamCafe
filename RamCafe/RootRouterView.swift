//
//  RootRouterView.swift
//  RamCafe
//

import SwiftUI

struct RootRouterView: View {
    @EnvironmentObject private var session: AppSession
    
    var body: some View {
        Group {
            if let user = session.currentUser {
                switch user.role {
                case .student:
                    StudentTabView()
                case .admin:
                    NavigationStack {
                        AdminDashboardView(
                            data: AdminSampleData.dashboard,
                            onSignOut: { session.currentUser = nil },
                            onClose: { }
                        )
                    }
                }
            } else {
                AuthRootView()
            }
        }
    }
}

#Preview {
    RootRouterView()
        .environmentObject(AppSession())
}

