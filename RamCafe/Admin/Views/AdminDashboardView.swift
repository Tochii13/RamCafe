//
//  AdminDashboardView.swift
//  RamCafe
//

import SwiftUI

struct AdminDashboardView: View {
    let data: AdminDashboardData
    let onSignOut: () -> Void
    let onClose: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // KPI grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(data.kpis) { kpi in
                        KpiCardView(kpi: kpi)
                    }
                }
                
                // Today's meals
                VStack(alignment: .leading, spacing: 12) {
                    AdminSectionHeader(title: "Today's Meals", subtitle: data.todayLabel)
                    
                    VStack(spacing: 8) {
                        ForEach(data.todayMeals) { meal in
                            TodayMealRow(meal: meal)
                        }
                    }
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray5), lineWidth: 1)
                    )
                }
                
                // Upcoming plans
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        AdminSectionHeader(title: "Upcoming Plans", subtitle: nil)
                        Spacer()
                        Button("View Calendar") {
                            // Placeholder for future calendar view
                        }
                        .font(.subheadline)
                    }
                    
                    VStack(spacing: 8) {
                        ForEach(data.upcomingPlans) { plan in
                            UpcomingPlanRow(plan: plan)
                        }
                    }
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray5), lineWidth: 1)
                    )
                }
                
                // Inventory alerts
                VStack(alignment: .leading, spacing: 12) {
                    AdminSectionHeader(title: "Inventory Alerts", subtitle: "\(data.inventoryAlerts.count) alerts")
                    
                    VStack(spacing: 8) {
                        ForEach(data.inventoryAlerts) { alert in
                            InventoryAlertRow(alert: alert)
                        }
                    }
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray5), lineWidth: 1)
                    )
                }
                
                // Top student favorites
                VStack(alignment: .leading, spacing: 12) {
                    AdminSectionHeader(title: "Top Student Favorites", subtitle: "This week")
                    
                    VStack(spacing: 8) {
                        ForEach(data.favorites.sorted(by: { $0.rank < $1.rank })) { favorite in
                            FavoriteRow(favorite: favorite)
                        }
                    }
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray5), lineWidth: 1)
                    )
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Campus Hub")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    onClose()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Sign Out") {
                    onSignOut()
                }
            }
        }
    }
}

private struct AdminSectionHeader: View {
    let title: String
    let subtitle: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct KpiCardView: View {
    let kpi: AdminKpi
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(kpi.title)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Text(kpi.primaryValue)
                .font(.title2)
                .fontWeight(.bold)
            
            if let secondary = kpi.secondaryValue {
                Text(secondary)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            if let tertiary = kpi.tertiaryValue {
                Text(tertiary)
                    .font(.footnote)
                    .foregroundStyle(.green)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
    }
}

private struct StatusChip: View {
    let text: String
    
    var body: some View {
        Text(text.capitalized)
            .font(.caption2)
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color(.systemGray6))
            .clipShape(Capsule())
    }
}

private struct TodayMealRow: View {
    let meal: AdminMealService
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 8) {
                    Text(meal.mealName)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    StatusChip(text: meal.status.rawValue)
                }
                
                Text(meal.menuTitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                HStack(spacing: 8) {
                    Text(meal.timeRange)
                    Text("\(meal.servingsPlanned) servings")
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

private struct UpcomingPlanRow: View {
    let plan: AdminPlan
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(plan.dateLabel)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(plan.dayLabel)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(width: 64, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(plan.status.rawValue)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .background(Color(.systemGray6))
                    .clipShape(Capsule())
                
                if let title = plan.title {
                    Text(title)
                        .font(.subheadline)
                } else {
                    Text("—")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

private struct InventoryAlertRow: View {
    let alert: AdminInventoryAlert
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(alert.itemName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(alert.category)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(alert.message)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

private struct FavoriteRow: View {
    let favorite: AdminFavorite
    
    var body: some View {
        HStack(spacing: 12) {
            Text("\(favorite.rank)")
                .font(.headline)
                .frame(width: 24, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(favorite.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(favorite.category)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text("\(favorite.count)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("\(favorite.deltaPercentage > 0 ? "+" : "")\(favorite.deltaPercentage)%")
                    .font(.caption)
                    .foregroundStyle(favorite.deltaPercentage >= 0 ? .green : .red)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

#Preview {
    NavigationStack {
        AdminDashboardView(
            data: AdminSampleData.dashboard,
            onSignOut: {},
            onClose: {}
        )
    }
}

