//
//  LoginView.swift
//  RamCafe
//

import SwiftUI

struct LoginView: View {
    let allowedDomain: String
    let onAuthenticated: (User) -> Void
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Welcome to Ram Café")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Sign in with your school email to view menus and manage dining.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 16) {
                TextField("School email", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Button {
                handleLogin()
            } label: {
                Text("Log In")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isFormValid ? Color.accentColor : Color.accentColor.opacity(0.5))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .disabled(!isFormValid)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
    
    private var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    private func handleLogin() {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        guard trimmedEmail.contains("@") else {
            errorMessage = "Enter a valid email address."
            return
        }
        
        if trimmedEmail == "admin@\(allowedDomain)" {
            // Admin login stub
            errorMessage = nil
            let user = User(name: "Admin", email: trimmedEmail, role: .admin)
            onAuthenticated(user)
            return
        }
        
        guard trimmedEmail.hasSuffix("@\(allowedDomain)") else {
            errorMessage = "Please use your school email (…@\(allowedDomain))."
            return
        }
        
        // Student login stub — treat any valid school email as a student
        errorMessage = nil
        let namePart = trimmedEmail.split(separator: "@").first ?? ""
        let displayName = namePart.isEmpty ? "Student" : namePart.capitalized
        let user = User(name: displayName, email: trimmedEmail, role: .student)
        onAuthenticated(user)
    }
}

#Preview {
    LoginView(allowedDomain: "ram.edu") { _ in }
}

