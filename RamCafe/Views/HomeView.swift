//
//  HomeView.swift
//  RamCafe
//

import SwiftUI

struct HomeView: View {
    @State private var selectedFilter: MealPeriod? = nil
    
    private var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "Good Morning"
        case 12..<17: return "Good Afternoon"
        default: return "Good Evening"
        }
    }
    
    private var todayFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: Date())
    }
    
    private var filteredMenuItems: [MenuItem] {
        if let filter = selectedFilter {
            return SampleData.menuItems.filter { $0.mealPeriod == filter }
        }
        return SampleData.menuItems
    }
    
    private var groupedMenuItems: [(MealPeriod, [MenuItem])] {
        let grouped = Dictionary(grouping: filteredMenuItems, by: { $0.mealPeriod })
        return MealPeriod.allCases.compactMap { period in
            guard let items = grouped[period], !items.isEmpty else { return nil }
            return (period, items)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(greeting)! 👋")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Here's today's menu for \(todayFormatted)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                // Announcement Card (links to announcements)
                NavigationLink(destination: AnnouncementsView()) {
                    AnnouncementLinkCardView(
                        title: "Extended Hours This Week",
                        content: "The Main Cafeteria will have extended dinner hours until 9 PM during finals week."
                    )
                }
                
                // Today's Hours
                HoursCardView(hours: SampleData.cafeHours)
                
                // Today's Menu
                VStack(alignment: .leading, spacing: 16) {
                    Text("Today's Menu")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    // Filters
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            FilterChip(
                                title: "All",
                                isSelected: selectedFilter == nil,
                                action: { selectedFilter = nil }
                            )
                            ForEach(MealPeriod.allCases) { period in
                                FilterChip(
                                    title: period.rawValue,
                                    isSelected: selectedFilter == period,
                                    action: { selectedFilter = period }
                                )
                            }
                        }
                        .padding(.horizontal, 1)
                    }
                    
                    // Menu sections
                    ForEach(groupedMenuItems, id: \.0.id) { period, items in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(period.rawValue)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(period.timeRange)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                            ForEach(items) { item in
                                MenuItemCardView(item: item)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}

struct FilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.accentColor : Color(.systemGray5))
                .foregroundStyle(isSelected ? .white : .primary)
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeView()
}
