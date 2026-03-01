//
//  AdminModels.swift
//  RamCafe
//

import Foundation

struct AdminKpi: Identifiable {
    let id = UUID()
    let title: String
    let primaryValue: String
    let secondaryValue: String?
    let tertiaryValue: String?
}

struct AdminMealService: Identifiable {
    enum Status: String {
        case completed = "completed"
        case serving = "serving"
        case preparing = "preparing"
    }
    
    let id = UUID()
    let mealName: String
    let status: Status
    let menuTitle: String
    let timeRange: String
    let servingsPlanned: Int
}

struct AdminPlan: Identifiable {
    enum Status: String {
        case ready = "Ready"
        case inProgress = "In Progress"
        case notStarted = "Not Started"
    }
    
    let id = UUID()
    let dateLabel: String
    let dayLabel: String
    let status: Status
    let title: String?
}

struct AdminInventoryAlert: Identifiable {
    let id = UUID()
    let itemName: String
    let category: String
    let message: String
}

struct AdminFavorite: Identifiable {
    let id = UUID()
    let rank: Int
    let name: String
    let category: String
    let count: Int
    let deltaPercentage: Int
}

struct AdminDashboardData {
    let kpis: [AdminKpi]
    let todayLabel: String
    let todayMeals: [AdminMealService]
    let upcomingPlans: [AdminPlan]
    let inventoryAlerts: [AdminInventoryAlert]
    let favorites: [AdminFavorite]
}

