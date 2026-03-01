//
//  WeeklyView.swift
//  RamCafe
//

import SwiftUI

struct WeeklyView: View {
    // Simple placeholder structure for now; can be wired to real data later.
    struct WeeklyDay: Identifiable {
        let id = UUID()
        let weekday: String
        let dateLabel: String
        let mealsSummary: String
    }
    
    private let days: [WeeklyDay] = [
        WeeklyDay(weekday: "Monday", dateLabel: "Jan 27", mealsSummary: "Pancakes, Grilled Chicken Salad, Herb Roasted Chicken"),
        WeeklyDay(weekday: "Tuesday", dateLabel: "Jan 28", mealsSummary: "Overnight Oats, Black Bean Burger, Pasta Primavera"),
        WeeklyDay(weekday: "Wednesday", dateLabel: "Jan 29", mealsSummary: "Veggie Omelette, Mediterranean Bowl, Grilled Salmon"),
        WeeklyDay(weekday: "Thursday", dateLabel: "Jan 30", mealsSummary: "Rotating chef's specials"),
        WeeklyDay(weekday: "Friday", dateLabel: "Jan 31", mealsSummary: "Burger bar & flatbreads"),
        WeeklyDay(weekday: "Saturday", dateLabel: "Feb 1", mealsSummary: "Weekend Brunch Special"),
        WeeklyDay(weekday: "Sunday", dateLabel: "Feb 2", mealsSummary: "Soul Food Sunday")
    ]
    
    var body: some View {
        List {
            Section {
                ForEach(days) { day in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(day.weekday)
                                .font(.headline)
                            Spacer()
                            Text(day.dateLabel)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        Text(day.mealsSummary)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 6)
                }
            } header: {
                Text("This Week's Menu")
            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    NavigationStack {
        WeeklyView()
    }
}

