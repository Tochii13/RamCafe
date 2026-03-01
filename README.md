# Ram Café — Student Portal

A SwiftUI iOS app that replicates the [Ram Café Lovable design](https://ramcafe.lovable.app) for the student dining portal.

## Features

- **Dashboard** — Greeting, today's menu, and hours at a glance
- **Announcements** — Tap the announcement card to view all dining news
- **Today's Hours** — Breakfast, Lunch, and Dinner times with "Open Now" status
- **Today's Menu** — Filterable by meal period (All, Breakfast, Lunch, Dinner)
- **Menu Items** — Calories, descriptions, and dietary tags (Vegetarian, Vegan, Gluten-Free, High Protein)

## Requirements

- Xcode 15+ (or Xcode 14 with iOS 17 SDK)
- iOS 17.0+

## Getting Started

1. **Open the project** in Xcode:
   ```bash
   open RamCafe.xcodeproj
   ```

2. **Select your team** for code signing:
   - Select the **RamCafe** project in the navigator
   - Select the **RamCafe** target
   - Under **Signing & Capabilities**, choose your Development Team

3. **Run the app**:
   - Choose an iPhone simulator (e.g., iPhone 16)
   - Press **⌘R** or click the Run button

## Project Structure

```
RamCafe/
├── RamCafeApp.swift          # App entry point
├── ContentView.swift         # Root view
├── Models/
│   ├── MenuItem.swift        # Menu item, meal periods, dietary tags
│   ├── Announcement.swift
│   └── CafeHours.swift
├── Views/
│   ├── HomeView.swift        # Main dashboard
│   ├── AnnouncementsView.swift
│   └── Components/
│       ├── AnnouncementCardView.swift
│       ├── HoursCardView.swift
│       └── MenuItemCardView.swift
├── Data/
│   └── SampleData.swift      # Sample menu and announcements
└── Assets.xcassets
```

## Data

Currently uses sample data from the Lovable app. You can replace `SampleData` with API calls or local persistence when connecting to a backend.
