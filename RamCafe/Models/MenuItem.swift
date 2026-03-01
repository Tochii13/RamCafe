//
//  MenuItem.swift
//  RamCafe
//

import Foundation

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let calories: Int
    let emoji: String
    let dietaryTags: [DietaryTag]
    let mealPeriod: MealPeriod
}

enum MealPeriod: String, CaseIterable, Identifiable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    
    var id: String { rawValue }
    
    var timeRange: String {
        switch self {
        case .breakfast: return "7:00 AM - 10:00 AM"
        case .lunch: return "11:00 AM - 2:00 PM"
        case .dinner: return "5:00 PM - 8:00 PM"
        }
    }
    
    var startTime: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: Date())
        switch self {
        case .breakfast: components.hour = 7; components.minute = 0
        case .lunch: components.hour = 11; components.minute = 0
        case .dinner: components.hour = 17; components.minute = 0
        }
        return calendar.date(from: components) ?? Date()
    }
}

enum DietaryTag: String, CaseIterable {
    case vegetarian = "Vegetarian"
    case vegan = "Vegan"
    case glutenFree = "Gluten-Free"
    case highProtein = "High Protein"
}
