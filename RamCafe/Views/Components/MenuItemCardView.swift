//
//  MenuItemCardView.swift
//  RamCafe
//

import SwiftUI

struct MenuItemCardView: View {
    let item: MenuItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(item.emoji)
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("\(item.calories) cal")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Text(item.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                
                if !item.dietaryTags.isEmpty {
                    FlowLayout(spacing: 6) {
                        ForEach(item.dietaryTags, id: \.rawValue) { tag in
                            Text(tag.rawValue)
                                .font(.caption2)
                                .fontWeight(.medium)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.accentColor.opacity(0.15))
                                .foregroundStyle(.accentColor)
                                .clipShape(Capsule())
                        }
                    }
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
    }
}

// Simple flow layout for tags
struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrange(proposal: proposal, subviews: subviews)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrange(proposal: proposal, subviews: subviews)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x, y: bounds.minY + result.positions[index].y), proposal: .unspecified)
        }
    }
    
    private func arrange(proposal: ProposedViewSize, subviews: Subviews) -> (size: CGSize, positions: [CGPoint]) {
        let maxWidth = proposal.width ?? .infinity
        var positions: [CGPoint] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > maxWidth && x > 0 {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            positions.append(CGPoint(x: x, y: y))
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
        }
        
        return (CGSize(width: maxWidth, height: y + rowHeight), positions)
    }
}
