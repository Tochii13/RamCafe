//
//  AuthRootView.swift
//  RamCafe
//

import SwiftUI

struct AuthRootView: View {
    @EnvironmentObject private var session: AppSession
    @State private var isLoginMode = true
    
    private let allowedStudentDomain = "ram.edu" // Replace with real school domain
    
    var body: some View {
        NavigationStack {
            VStack {
                if isLoginMode {
                    LoginView(
                        allowedDomain: allowedStudentDomain,
                        onAuthenticated: { user in
                            session.currentUser = user
                        }
                    )
                } else {
                    SignupView(
                        allowedDomain: allowedStudentDomain,
                        onSignedUp: { user in
                            session.currentUser = user
                        }
                    )
                }
                
                HStack {
                    Text(isLoginMode ? "Don't have an account?" : "Already have an account?")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Button(isLoginMode ? "Sign up" : "Log in") {
                        withAnimation {
                            isLoginMode.toggle()
                        }
                    }
                    .font(.footnote)
                }
                .padding(.bottom)
            }
            .navigationTitle(isLoginMode ? "Log In" : "Sign Up")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AuthRootView()
        .environmentObject(AppSession())
}

