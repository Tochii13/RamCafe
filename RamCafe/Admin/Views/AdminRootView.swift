//
//  AdminRootView.swift
//  RamCafe
//

import SwiftUI

struct AdminRootView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isAuthenticated = false
    
    var body: some View {
        NavigationStack {
            if isAuthenticated {
                AdminDashboardView(
                    data: AdminSampleData.dashboard,
                    onSignOut: { isAuthenticated = false },
                    onClose: { dismiss() }
                )
            } else {
                AdminLoginView(
                    onAuthenticated: { isAuthenticated = true },
                    onCancel: { dismiss() }
                )
            }
        }
    }
}

#Preview {
    AdminRootView()
}

