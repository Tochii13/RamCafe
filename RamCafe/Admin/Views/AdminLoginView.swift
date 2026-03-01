//
//  AdminLoginView.swift
//  RamCafe
//

import SwiftUI

struct AdminLoginView: View {
    private let expectedCode = "2468"
    
    @State private var code: String = ""
    @State private var showError: Bool = false
    
    let onAuthenticated: () -> Void
    let onCancel: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Admin Access")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Enter the admin code to open the campus hub dashboard.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 16) {
                SecureField("Admin code", text: $code)
                    .textContentType(.password)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                if showError {
                    Text("Incorrect code. Please try again.")
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            VStack(spacing: 12) {
                Button {
                    validate()
                } label: {
                    Text("Sign In")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(code.isEmpty ? Color.accentColor.opacity(0.5) : Color.accentColor)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .disabled(code.isEmpty)
                
                Button(role: .cancel) {
                    onCancel()
                } label: {
                    Text("Cancel")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Admin Login")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func validate() {
        if code == expectedCode {
            showError = false
            onAuthenticated()
        } else {
            showError = true
        }
    }
}

#Preview {
    NavigationStack {
        AdminLoginView(
            onAuthenticated: {},
            onCancel: {}
        )
    }
}

