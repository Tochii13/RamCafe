//
//  AuthModels.swift
//  RamCafe
//

import Foundation

enum UserRole {
    case student
    case admin
}

struct User: Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let role: UserRole
}

final class AppSession: ObservableObject {
    @Published var currentUser: User?
    
    var isAuthenticated: Bool {
        currentUser != nil
    }
}

