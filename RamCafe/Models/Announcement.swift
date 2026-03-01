//
//  Announcement.swift
//  RamCafe
//

import Foundation

struct Announcement: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let date: Date
    let formattedDate: String
}
