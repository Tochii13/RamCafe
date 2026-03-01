//
//  AdminSampleData.swift
//  RamCafe
//

import Foundation

enum AdminSampleData {
    
    static let dashboard = AdminDashboardData(
        kpis: [
            AdminKpi(
                title: "Meals Served Today",
                primaryValue: "347",
                secondaryValue: "Out of 525 expected",
                tertiaryValue: "+8% vs yesterday"
            ),
            AdminKpi(
                title: "Active Students",
                primaryValue: "892",
                secondaryValue: "Enrolled in meal plan",
                tertiaryValue: nil
            ),
            AdminKpi(
                title: "Inventory Items",
                primaryValue: "312",
                secondaryValue: "4 items low stock",
                tertiaryValue: nil
            ),
            AdminKpi(
                title: "Weekly Spend",
                primaryValue: "$12,450",
                secondaryValue: "$1,850 under budget",
                tertiaryValue: "+12% savings"
            )
        ],
        todayLabel: "Tuesday, Feb 24",
        todayMeals: [
            AdminMealService(
                mealName: "Breakfast",
                status: .completed,
                menuTitle: "Southern Breakfast Platter",
                timeRange: "7:00 - 9:30 AM",
                servingsPlanned: 150
            ),
            AdminMealService(
                mealName: "Lunch",
                status: .serving,
                menuTitle: "Grilled Chicken Caesar",
                timeRange: "11:30 AM - 2:00 PM",
                servingsPlanned: 200
            ),
            AdminMealService(
                mealName: "Dinner",
                status: .preparing,
                menuTitle: "BBQ Brisket with Cornbread",
                timeRange: "5:00 - 7:30 PM",
                servingsPlanned: 175
            )
        ],
        upcomingPlans: [
            AdminPlan(
                dateLabel: "Jan 31",
                dayLabel: "Tomorrow",
                status: .ready,
                title: "Taco Bar & Nachos"
            ),
            AdminPlan(
                dateLabel: "Feb 1",
                dayLabel: "Saturday",
                status: .ready,
                title: "Weekend Brunch Special"
            ),
            AdminPlan(
                dateLabel: "Feb 2",
                dayLabel: "Sunday",
                status: .inProgress,
                title: "Soul Food Sunday"
            ),
            AdminPlan(
                dateLabel: "Feb 3",
                dayLabel: "Monday",
                status: .notStarted,
                title: nil
            )
        ],
        inventoryAlerts: [
            AdminInventoryAlert(
                itemName: "Fresh Chicken Breast",
                category: "Meat",
                message: "Only 15 lbs remaining"
            ),
            AdminInventoryAlert(
                itemName: "Romaine Lettuce",
                category: "Produce",
                message: "Expires in 2 days"
            ),
            AdminInventoryAlert(
                itemName: "Milk (Gallon)",
                category: "Dairy",
                message: "Only 8 units remaining"
            ),
            AdminInventoryAlert(
                itemName: "White Rice",
                category: "Dry Goods",
                message: "30% waste last week"
            )
        ],
        favorites: [
            AdminFavorite(
                rank: 1,
                name: "Crispy Fried Chicken",
                category: "Protein",
                count: 234,
                deltaPercentage: 12
            ),
            AdminFavorite(
                rank: 2,
                name: "Mac & Cheese",
                category: "Sides",
                count: 198,
                deltaPercentage: 8
            ),
            AdminFavorite(
                rank: 3,
                name: "Fresh Fruit Bowl",
                category: "Healthy",
                count: 156,
                deltaPercentage: 24
            ),
            AdminFavorite(
                rank: 4,
                name: "Texas Toast",
                category: "Bread",
                count: 142,
                deltaPercentage: -3
            )
        ]
    )
}

