//
//  SignupView.swift
//  RamCafe
//

import SwiftUI

struct SignupView: View {
    let allowedDomain: String
    let onSignedUp: (User) -> Void
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Sign up with your school email to save favorites and view menus.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 16) {
                TextField("Full name", text: $name)
                    .textInputAutocapitalization(.words)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                TextField("School email", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                SecureField("Password", text: $password)
                    .textContentType(.newPassword)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                SecureField("Confirm password", text: $confirmPassword)
                    .textContentType(.newPassword)
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
                handleSignup()
            } label: {
                Text("Sign Up")
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
        !name.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
    
    private func handleSignup() {
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }
        
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        guard trimmedEmail.contains("@") else {
            errorMessage = "Enter a valid email address."
            return
        }
        
        guard trimmedEmail.hasSuffix("@\(allowedDomain)") else {
            errorMessage = "Students must sign up with their school email (…@\(allowedDomain))."
            return
        }
        
        errorMessage = nil
        let user = User(name: name, email: trimmedEmail, role: .student)
        onSignedUp(user)
    }
}

#Preview {
    SignupView(allowedDomain: "ram.edu") { _ in }
}

