//
//  FavoritesView.swift
//  RamCafe
//

import SwiftUI

struct FavoritesView: View {
    // Phase 1: simple local favorites list using existing SampleData.menuItems
    private var favorites: [MenuItem] {
        // For now, just show a subset as favorites
        Array(SampleData.menuItems.prefix(3))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Your Favorites")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if favorites.isEmpty {
                    Text("When you favorite dishes, they will appear here for quick access.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(favorites) { item in
                        MenuItemCardView(item: item)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    NavigationStack {
        FavoritesView()
    }
}

