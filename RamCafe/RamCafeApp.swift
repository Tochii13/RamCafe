//
//  RamCafeApp.swift
//  RamCafe
//
//  Student Portal - Ram Café Dining
//

import SwiftUI

@main
struct RamCafeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppSession())
        }
    }
}
