//
//  AnnouncementsView.swift
//  RamCafe
//

import SwiftUI

struct AnnouncementsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Stay updated with the latest news from dining services.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                ForEach(SampleData.announcements) { announcement in
                    AnnouncementCardView(
                        title: announcement.title,
                        content: announcement.content,
                        date: announcement.formattedDate
                    )
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Announcements")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        AnnouncementsView()
    }
}
