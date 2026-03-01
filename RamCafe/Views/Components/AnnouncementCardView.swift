//
//  AnnouncementCardView.swift
//  RamCafe
//

import SwiftUI

struct AnnouncementCardView: View {
    let title: String
    let content: String
    var date: String? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                if let date = date {
                    Text(date)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            
            Text(content)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct AnnouncementLinkCardView: View {
    let title: String
    let content: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                        .multilineTextAlignment(.leading)
                    
                    Text(content)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
    }
}
