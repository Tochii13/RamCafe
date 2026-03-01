//
//  ContentView.swift
//  RamCafe
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RootRouterView()
    }
}

#Preview {
    ContentView()
        .environmentObject(AppSession())
}
