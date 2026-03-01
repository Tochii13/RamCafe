//
//  HoursCardView.swift
//  RamCafe
//

import SwiftUI

struct HoursCardView: View {
    let hours: [CafeHours]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Today's Hours")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("Open Now")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.green)
            }
            
            VStack(spacing: 12) {
                ForEach(hours, id: \.mealPeriod.id) { period in
                    HStack {
                        Text(period.mealPeriod.rawValue)
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        Text("\(period.startTime) - \(period.endTime)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
