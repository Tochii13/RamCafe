//
//  SampleData.swift
//  RamCafe
//

import Foundation

enum SampleData {
    
    static let announcements: [Announcement] = [
        Announcement(
            title: "Extended Hours This Week",
            content: "The Main Cafeteria will have extended dinner hours until 9 PM during finals week.",
            date: Date(),
            formattedDate: "Jan 25"
        ),
        Announcement(
            title: "New Menu Items",
            content: "Try our new plant-based options available starting Monday!",
            date: Date(),
            formattedDate: "Jan 24"
        )
    ]
    
    static let menuItems: [MenuItem] = [
        // Breakfast
        MenuItem(
            name: "Fluffy Pancakes",
            description: "Golden buttermilk pancakes served with maple syrup and fresh berries",
            calories: 420,
            emoji: "🍽️",
            dietaryTags: [.vegetarian],
            mealPeriod: .breakfast
        ),
        MenuItem(
            name: "Veggie Omelette",
            description: "Three-egg omelette with bell peppers, onions, spinach, and cheese",
            calories: 340,
            emoji: "🍽️",
            dietaryTags: [.vegetarian, .glutenFree],
            mealPeriod: .breakfast
        ),
        MenuItem(
            name: "Overnight Oats",
            description: "Creamy oats with almond milk, chia seeds, and fresh fruit",
            calories: 290,
            emoji: "🍽️",
            dietaryTags: [.vegan, .highProtein],
            mealPeriod: .breakfast
        ),
        // Lunch
        MenuItem(
            name: "Grilled Chicken Salad",
            description: "Fresh mixed greens with grilled chicken, avocado, and honey mustard",
            calories: 380,
            emoji: "🍽️",
            dietaryTags: [.glutenFree, .highProtein],
            mealPeriod: .lunch
        ),
        MenuItem(
            name: "Black Bean Burger",
            description: "House-made black bean patty with lettuce, tomato, and chipotle aioli",
            calories: 520,
            emoji: "🍽️",
            dietaryTags: [.vegetarian, .highProtein],
            mealPeriod: .lunch
        ),
        MenuItem(
            name: "Mediterranean Bowl",
            description: "Quinoa bowl with falafel, hummus, cucumber, and tahini dressing",
            calories: 450,
            emoji: "🍽️",
            dietaryTags: [.vegan, .highProtein],
            mealPeriod: .lunch
        ),
        // Dinner
        MenuItem(
            name: "Herb Roasted Chicken",
            description: "Tender roasted chicken with garlic mashed potatoes and seasonal vegetables",
            calories: 520,
            emoji: "🍽️",
            dietaryTags: [.glutenFree, .highProtein],
            mealPeriod: .dinner
        ),
        MenuItem(
            name: "Pasta Primavera",
            description: "Penne pasta with fresh vegetables in a light garlic olive oil sauce",
            calories: 480,
            emoji: "🍽️",
            dietaryTags: [.vegan],
            mealPeriod: .dinner
        ),
        MenuItem(
            name: "Grilled Salmon",
            description: "Atlantic salmon with lemon herb butter, rice pilaf, and asparagus",
            calories: 480,
            emoji: "🍽️",
            dietaryTags: [.glutenFree, .highProtein],
            mealPeriod: .dinner
        ),
        MenuItem(
            name: "Vegetable Stir Fry",
            description: "Crispy tofu with mixed vegetables in a savory ginger soy sauce",
            calories: 380,
            emoji: "🍽️",
            dietaryTags: [.vegan, .highProtein],
            mealPeriod: .dinner
        )
    ]
    
    static let cafeHours: [CafeHours] = [
        CafeHours(mealPeriod: .breakfast, startTime: "7:00 AM", endTime: "10:00 AM", isOpenNow: true),
        CafeHours(mealPeriod: .lunch, startTime: "11:00 AM", endTime: "2:00 PM", isOpenNow: true),
        CafeHours(mealPeriod: .dinner, startTime: "5:00 PM", endTime: "8:00 PM", isOpenNow: true)
    ]
}
