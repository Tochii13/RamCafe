# Ram Café Student Portal — Full Project Prompt for Base44

Use this prompt to recreate, extend, or work with the Ram Café student portal app. The app is an iOS SwiftUI application that replicates the design and behavior of the Lovable prototype at https://ramcafe.lovable.app.

---

## Project Overview

**App name:** Ram Café (display name: "Ram Café")  
**Purpose:** A student portal for campus dining: view today’s menu, cafe hours, and dining announcements.  
**Platform:** iOS 17+, SwiftUI.  
**Architecture:** SwiftUI views, simple state (e.g. filter selection), no backend — uses in-memory sample data.

---

## Tech Stack & Conventions

- **Language:** Swift 5  
- **UI:** SwiftUI only  
- **Navigation:** `NavigationStack`; push to Announcements via `NavigationLink`  
- **Styling:** System colors (e.g. `Color(.systemGroupedBackground)`, `Color(.systemGray6)`), 12pt corner radius on cards, accent color for selected filters and dietary tags  
- **Layout:** ScrollView-based dashboard; horizontal scroll for filter chips; custom `FlowLayout` (SwiftUI `Layout`) for wrapping dietary tags on menu cards  

---

## Data Models

### 1. MenuItem (struct, Identifiable)

- **id:** `UUID()` (generated)
- **name:** String  
- **description:** String  
- **calories:** Int  
- **emoji:** String (e.g. "🍽️")  
- **dietaryTags:** `[DietaryTag]`  
- **mealPeriod:** `MealPeriod`  

### 2. MealPeriod (enum, CaseIterable, Identifiable)

- Cases: `breakfast`, `lunch`, `dinner`  
- **rawValue:** "Breakfast", "Lunch", "Dinner"  
- **id:** `rawValue`  
- **timeRange:** String  
  - Breakfast: "7:00 AM - 10:00 AM"  
  - Lunch: "11:00 AM - 2:00 PM"  
  - Dinner: "5:00 PM - 8:00 PM"  
- **startTime:** `Date` (today with hour 7, 11, or 17 as appropriate)  

### 3. DietaryTag (enum, CaseIterable)

- **rawValue:** "Vegetarian", "Vegan", "Gluten-Free", "High Protein"  
- Cases: `vegetarian`, `vegan`, `glutenFree`, `highProtein`  

### 4. Announcement (struct, Identifiable)

- **id:** `UUID()`  
- **title:** String  
- **content:** String  
- **date:** Date  
- **formattedDate:** String (e.g. "Jan 25")  

### 5. CafeHours (struct)

- **mealPeriod:** MealPeriod  
- **startTime:** String (e.g. "7:00 AM")  
- **endTime:** String (e.g. "10:00 AM")  
- **isOpenNow:** Bool  

---

## Sample Data (in-memory)

### Announcements (array)

1. **Extended Hours This Week** (formattedDate: "Jan 25")  
   - "The Main Cafeteria will have extended dinner hours until 9 PM during finals week."

2. **New Menu Items** (formattedDate: "Jan 24")  
   - "Try our new plant-based options available starting Monday!"

### Cafe hours (array of CafeHours)

- Breakfast: 7:00 AM – 10:00 AM, isOpenNow: true  
- Lunch: 11:00 AM – 2:00 PM, isOpenNow: true  
- Dinner: 5:00 PM – 8:00 PM, isOpenNow: true  

### Menu items (array, by meal period)

**Breakfast**

- Fluffy Pancakes — 420 cal — "Golden buttermilk pancakes served with maple syrup and fresh berries" — [Vegetarian]  
- Veggie Omelette — 340 cal — "Three-egg omelette with bell peppers, onions, spinach, and cheese" — [Vegetarian, Gluten-Free]  
- Overnight Oats — 290 cal — "Creamy oats with almond milk, chia seeds, and fresh fruit" — [Vegan, High Protein]  

**Lunch**

- Grilled Chicken Salad — 380 cal — "Fresh mixed greens with grilled chicken, avocado, and honey mustard" — [Gluten-Free, High Protein]  
- Black Bean Burger — 520 cal — "House-made black bean patty with lettuce, tomato, and chipotle aioli" — [Vegetarian, High Protein]  
- Mediterranean Bowl — 450 cal — "Quinoa bowl with falafel, hummus, cucumber, and tahini dressing" — [Vegan, High Protein]  

**Dinner**

- Herb Roasted Chicken — 520 cal — "Tender roasted chicken with garlic mashed potatoes and seasonal vegetables" — [Gluten-Free, High Protein]  
- Pasta Primavera — 480 cal — "Penne pasta with fresh vegetables in a light garlic olive oil sauce" — [Vegan]  
- Grilled Salmon — 480 cal — "Atlantic salmon with lemon herb butter, rice pilaf, and asparagus" — [Gluten-Free, High Protein]  
- Vegetable Stir Fry — 380 cal — "Crispy tofu with mixed vegetables in a savory ginger soy sauce" — [Vegan, High Protein]  

Each item uses emoji "🍽️".

---

## App Structure & Entry Points

- **@main:** `RamCafeApp` (SwiftUI `App`) → `WindowGroup { ContentView().environmentObject(AppSession()) }`  
- **ContentView:** Hosts `RootRouterView()`.  
- **RootRouterView:** Decides between auth flow, student tabs, and admin dashboard based on `AppSession.currentUser`.  
- **HomeView:** Main student dashboard for the **Today** tab (navigation provided by the tab’s `NavigationStack`).  

---

## Views & Features (Detailed)

### 1. HomeView (main dashboard)

- **Background:** `Color(.systemGroupedBackground)`  
- **Layout:** Vertical stack, spacing 24, inside a `ScrollView`.  

**Header (top):**

- Greeting: time-based — "Good Morning! 👋" (5–12), "Good Afternoon! 👋" (12–17), "Good Evening! 👋" (17–5).  
- Subtitle: "Here's today's menu for [weekday]" (e.g. "Monday"), using `DateFormatter` with "EEEE".  

**Announcement card (tappable):**

- Implement as a `NavigationLink(destination: AnnouncementsView())`.  
- Content: same as first announcement — title "Extended Hours This Week", content about extended dinner until 9 PM during finals week.  
- UI: card with title, short content (e.g. 2 lines), and a trailing chevron; background `Color(.systemGray6)`, 12pt corner radius.  

**Today’s Hours card:**

- Title: "Today's Hours".  
- Top-right: "Open Now" in green.  
- Rows: one per meal period — left: period name (Breakfast, Lunch, Dinner), right: "startTime - endTime" (e.g. "7:00 AM - 10:00 AM").  
- Same card style (gray6 background, 12pt radius).  

**Today’s Menu section:**

- Section title: "Today's Menu" (headline, semibold).  
- **Filters:** Horizontal scroll of pill/chip buttons: "All", "Breakfast", "Lunch", "Dinner".  
  - "All" = no filter (show all meal periods).  
  - Others filter menu items by that `MealPeriod`.  
  - Selected chip: accent color background, white text; unselected: system gray5 background, primary text.  
- **Menu list:** Grouped by meal period (order: Breakfast, Lunch, Dinner).  
  - Each group: period name (title2, bold), then period’s time range (caption, secondary), then a list of menu item cards.  

**State:** One `@State` (or equivalent): `selectedFilter: MealPeriod?` — `nil` = All.  

### 2. Menu item card (MenuItemCardView)

- **Layout:** HStack: leading emoji (title2), then VStack (leading alignment).  
- **Content:**  
  - Calories: "X cal" (caption, secondary).  
  - Name: headline, semibold.  
  - Description: subheadline, secondary, lineLimit 2.  
  - Dietary tags: wrap in a flow layout; each tag = small pill (caption2, medium weight, horizontal padding 8, vertical 4), accent color tint (e.g. accent opacity 0.15 background, accent foreground), capsule shape.  
- **Card:** Padding, system background, 12pt rounded rect, border `Color(.systemGray5)` 1pt.  

### 3. FlowLayout (custom Layout for tags)

- **Role:** Wrap child views left-to-right, then new row when width is exceeded.  
- **Inputs:** `spacing` (CGFloat).  
- **Behavior:** Implement `sizeThatFits` and `placeSubviews`; in a single pass compute positions (x, y) for each subview, advancing x by (width + spacing), and moving to next row (reset x, increase y by row height + spacing) when x + width > maxWidth.  
- **Usage:** Wraps the dietary tag labels inside `MenuItemCardView`.  

### 4. AnnouncementsView (pushed from Home)

- **Navigation:** Shown when user taps the announcement card on Home.  
- **Title:** "Announcements" (large title).  
- **Subtitle:** "Stay updated with the latest news from dining services." (subheadline, secondary).  
- **List:** One card per announcement.  
- **Announcement card (read-only):**  
  - Title (headline, semibold) and formatted date (caption, secondary) on same row; date trailing.  
  - Body: content (subheadline, secondary).  
  - Same card style (gray6, 12pt radius).  

### 5. Announcement card variants

- **AnnouncementCardView:** title, optional date (trailing), content. Used on Announcements screen.  
- **AnnouncementLinkCardView:** title, content (e.g. 2 lines), trailing chevron, tappable; used on Home for the first announcement that links to Announcements.  

### 6. HoursCardView

- **Input:** `hours: [CafeHours]`.  
- **UI:** "Today's Hours" + "Open Now" (green); then for each element show `mealPeriod.rawValue` and "startTime - endTime". Same card style as above.  

### 7. FilterChip (HomeView)

- **Inputs:** title (String), isSelected (Bool), action () -> Void.  
- **UI:** Button with title (subheadline, medium); padding H 16, V 8; background = accent if selected, system gray5 if not; text = white if selected, primary if not; capsule shape; plain button style.  

---

## File / Module Structure

- **App:** `RamCafeApp.swift` — `@main`, `App`, `WindowGroup { ContentView() }`.  
- **Root:**  
  - `ContentView.swift` — wraps `RootRouterView()`.  
  - `RootRouterView.swift` — routes between auth, student, and admin experiences using `AppSession`.  
- **Models:**  
  - `MenuItem.swift` — `MenuItem`, `MealPeriod`, `DietaryTag`.  
  - `Announcement.swift` — `Announcement`.  
  - `CafeHours.swift` — `CafeHours`.  
- **Data:** `SampleData.swift` — static `announcements`, `menuItems`, `cafeHours` (arrays as above).  
- **Views:**  
  - `HomeView.swift` — dashboard + `FilterChip`.  
  - `AnnouncementsView.swift`.  
  - **Components:**  
    - `AnnouncementCardView.swift` — `AnnouncementCardView`, `AnnouncementLinkCardView`.  
    - `HoursCardView.swift`.  
    - `MenuItemCardView.swift` — `MenuItemCardView`, `FlowLayout`.  

---

## UI/UX Summary

- **Theme:** System light/dark, grouped background; cards slightly elevated (gray6); accent for selection and tags.  
- **Typography:** Large title for greeting; headline for section titles and card titles; subheadline for descriptions and secondary text; caption for calories and dates.  
- **Touch targets:** Announcement card on Home is full-card tap to Announcements; filter chips are buttons; no other interactive elements on menu cards.  
- **Accessibility:** Use semantic labels where appropriate; support Dynamic Type if extending.  

---

## What to Build From This Prompt

- Recreate the app in SwiftUI with the same models, sample data, and navigation.  
- Implement the dashboard (greeting, announcement link, hours, filters, menu by period).  
- Implement AnnouncementsView and both announcement card types.  
- Implement menu item cards with flow-wrapped dietary tags.  
- Use iOS 17+ and SwiftUI best practices; keep structure clear for later addition of a real API or persistence.  

Reference design: https://ramcafe.lovable.app (home and /announcements).

---

### Admin Portal Module — “Campus Hub” (Add-on)

**Goal:** Add an **Admin Portal** experience to the same Ram Café app. This module mirrors the Lovable admin dashboard at `https://ramcafe-campus-hub.lovable.app/` and is separate from the student-facing menu screens.

#### Platform + UI
- **iOS SwiftUI**, iOS 17+
- Use the same design language as the student app:
  - System grouped background
  - Card-based layout with rounded corners
  - Status chips (completed/serving/preparing/ready/in progress/not started)
  - KPI cards in a 2x2 grid on mobile

#### Admin Entry + Access Control
- From the student app, provide an **Admin entry point** (menu item/button).
- Require **Admin Login** before showing admin screens.
  - Phase 1: local admin passcode (no backend).
  - Phase 2: real auth + role-based access.

#### Admin Dashboard (single scroll page)
Include these sections, in this order:

1. **KPI cards**
   - Meals Served Today: **347** out of **525 expected**, **+8% vs yesterday**
   - Active Students: **892**, “Enrolled in meal plan”
   - Inventory Items: **312**, “4 items low stock”
   - Weekly Spend: **$12,450**, “$1,850 under budget”, “+12% savings”

2. **Today’s Meals** (Tuesday, Feb 24)
   - Breakfast — **completed** — Southern Breakfast Platter — **7:00–9:30 AM** — **150 servings**
   - Lunch — **serving** — Grilled Chicken Caesar — **11:30 AM–2:00 PM** — **200 servings**
   - Dinner — **preparing** — BBQ Brisket with Cornbread — **5:00–7:30 PM** — **175 servings**
   - Each row is tappable → detail screen.

3. **Upcoming Plans**
   - Include a “View Calendar” action.
   - Rows:
     - Jan 31 — Tomorrow — Ready — Taco Bar & Nachos
     - Feb 1 — Saturday — Ready — Weekend Brunch Special
     - Feb 2 — Sunday — In Progress — Soul Food Sunday
     - Feb 3 — Monday — Not Started — —
   - Row tap → plan detail.

4. **Inventory Alerts** (4 alerts)
   - Fresh Chicken Breast (Meat) — Only 15 lbs remaining
   - Romaine Lettuce (Produce) — Expires in 2 days
   - Milk (Gallon) (Dairy) — Only 8 units remaining
   - White Rice (Dry Goods) — 30% waste last week
   - Row tap → inventory detail.

5. **Top Student Favorites** (This week)
   - 1 Crispy Fried Chicken (Protein) — 234 — +12%
   - 2 Mac & Cheese (Sides) — 198 — +8%
   - 3 Fresh Fruit Bowl (Healthy) — 156 — +24%
   - 4 Texas Toast (Bread) — 142 — -3%

#### Required admin screens (minimum)
- AdminLogin
- AdminDashboard
- MealServiceDetail
- Plans list (and/or calendar view)
- InventoryItemDetail
- FavoriteDetail
- AdminSettings (includes Sign Out)

#### Data strategy
- Phase 1 uses local `AdminSampleData` matching the values above.
- Phase 2 replaces sample data with API calls (keep view models and models structured for easy swap).

---

### Authentication & User Roles (Sign Up / Login)

**Goal:** Add a shared auth flow for both **students** and **admins**. Students must use their **school email**; admins log in with a special admin email.

#### Auth models & session

- `UserRole` enum: `.student`, `.admin`.  
- `User` struct: `id`, `name`, `email`, `role: UserRole`.  
- `AppSession` (`ObservableObject`):  
  - `@Published var currentUser: User?`  
  - `var isAuthenticated: Bool` (derived from `currentUser != nil`).  
- `AppSession` is injected at the root: `ContentView().environmentObject(AppSession())`.

#### Root router

- `RootRouterView` reads `@EnvironmentObject AppSession` and decides what to show:
  - If `currentUser == nil` → show `AuthRootView` (login/sign up).
  - If `currentUser.role == .student` → show `StudentTabView`.  
  - If `currentUser.role == .admin` → show admin dashboard:
    - `NavigationStack { AdminDashboardView(data: AdminSampleData.dashboard, onSignOut: { session.currentUser = nil }, onClose: {}) }`.

#### AuthRootView (switching between Login and Sign Up)

- Maintains `isLoginMode` state.  
- Contains either:
  - `LoginView(allowedDomain: "ram.edu", onAuthenticated: { user in session.currentUser = user })`, or  
  - `SignupView(allowedDomain: "ram.edu", onSignedUp: { user in session.currentUser = user })`.  
- Below the form, a small toggle:
  - “Don’t have an account? Sign up” / “Already have an account? Log in”.

#### LoginView behavior

- Fields: **School email**, **Password** (stub for Phase 1).  
- **Validation rules:**
  - Email must look valid (`contains("@")`).  
  - If email is `admin@ram.edu` → treat as **Admin**:
    - Create `User(name: "Admin", email: "admin@ram.edu", role: .admin)` and pass to `onAuthenticated`.  
  - Otherwise, email must **end with** `@ram.edu`:
    - If not, show: “Please use your school email (…@ram.edu).”
  - Any non-empty password is accepted in Phase 1.  
- For a valid student email, derive a display name from the email prefix (e.g. `jdoe` → “Jdoe”) and create a `User` with role `.student`.

#### SignupView behavior

- Fields: **Full name**, **School email**, **Password**, **Confirm password**.  
- **Validation rules:**
  - All fields required.  
  - Password and confirm must match.  
  - Email must be valid and **end with** `@ram.edu`. If not, show: “Students must sign up with their school email (…@ram.edu).”  
- On success:
  - Create `User(name: name, email: email, role: .student)` and call `onSignedUp(user)` so `AppSession.currentUser` is set.  
- Only **students** can sign up in-app; admins are provisioned via the admin email.

#### Logout behavior

- **Students:** Log out via the **Settings** tab → “Log Out” button:
  - Sets `session.currentUser = nil` and returns to `AuthRootView`.  
- **Admins:** Log out via **Sign Out** button in the admin dashboard toolbar:
  - Calls the `onSignOut` closure which clears `session.currentUser`.

---

### Student Portal: Tab Navigation

**Goal:** Replace the single student screen with a **5-tab** navigation that mirrors the Lovable student experience:

1. **Today**
2. **Weekly**
3. **Favorites**
4. **Announcements**
5. **Settings**

#### StudentTabView

- Uses `TabView` with 5 tabs. Each tab uses its own `NavigationStack`.
- Tabs:
  1. **Today** — `NavigationStack { HomeView().navigationTitle("Ram Cafe") }`  
  2. **Weekly** — `NavigationStack { WeeklyView().navigationTitle("Weekly Menu") }`  
  3. **Favorites** — `NavigationStack { FavoritesView().navigationTitle("Favorites") }`  
  4. **Announcements** — `NavigationStack { AnnouncementsView() }` as a full tab.  
  5. **Settings** — `NavigationStack { SettingsView().navigationTitle("Settings") }`.  

#### WeeklyView (`/weekly`)

- Presents a **list for the current week** (Mon–Sun).  
- Each row shows:
  - Weekday name (e.g. “Monday”) and a date label (e.g. “Jan 27”).  
  - A short **meals summary** for that day, e.g.:  
    - “Pancakes, Grilled Chicken Salad, Herb Roasted Chicken”  
    - “Weekend Brunch Special”, “Soul Food Sunday”, etc.  
- Header label: “This Week’s Menu”.  
- Phase 1 uses static sample data; Phase 2 wires to a weekly menu API.

#### FavoritesView (`/favorites`)

- Shows the student’s **favorite dishes**.  
- Phase 1 behavior:
  - Uses a subset of `SampleData.menuItems` as placeholder favorites.  
  - Each favorite uses the existing `MenuItemCardView` design (calories, name, description, dietary tags).  
- If the list is empty, show explanatory copy:
  - “When you favorite dishes, they will appear here for quick access.”  
- Phase 2: connect to a real favorites store per user.

#### Announcements tab (`/announcements`)

- Uses the existing `AnnouncementsView` as its content.  
- The **Today** screen’s announcement card still navigates to `AnnouncementsView`, which now lives in this tab.

#### SettingsView (`/settings`)

- Reads `@EnvironmentObject AppSession` to show current user info.  
- Sections:
  - **Profile**
    - Name (or “Student” if empty).  
    - Email (school email).  
    - Role chip: “Student” or “Admin”.  
  - **Dietary preferences**
    - Toggle: “Prefer vegan options”.  
    - Toggle: “Prefer gluten-free options”.  
  - **Notifications**
    - Toggle: “Dining announcements”.  
    - Toggle: “New menu items”.  
  - **Account**
    - “Log Out” destructive button → sets `session.currentUser = nil`.  


