# lab_act_1

A new Flutter project.

## Getting Started

# Flutter Activity #3: 5-Page App with Dashboard Navigation

A multi-page Flutter application demonstrating dashboard navigation and various UI components.

## Project Structure

```
lib/
├── main.dart
└── pages/
    ├── dashboard_page.dart
    ├── profile_page.dart
    ├── messages_page.dart
    ├── notifications_page.dart
    ├── settings_page.dart
    └── about_page.dart
```

## Features

### Dashboard Page (Main Screen)
- **Layout**: Grid layout with 5 clickable cards
- **Navigation**: Routes to all 5 pages
- **Widgets Used**: Column, Row, Card, InkWell, Icon
- **Color Scheme**: Each card has a unique gradient color

### Profile Page
- **CircleAvatar** with person icon
- User name and bio
- Contact information card with:
  - Email with icon
  - Phone with icon
- Back button to dashboard

### Messages Page
- **ListView** with message tiles
- Each **ListTile** includes:
  - CircleAvatar with icon
  - Sender name (title)
  - Message preview (subtitle)
  - Timestamp (trailing)
- Back button to dashboard

### Notifications Page
- **SwitchListTile** widgets for notification preferences:
  - App Updates
  - New Messages
  - Daily Reminders
  - Promotions
  - Security Alerts
- Each toggle is functional with state management
- Back button to dashboard

### Settings Page
- **Theme Selection** with RadioListTile:
  - Light
  - Dark
  - System Default
- **Font Size** selection with RadioListTile:
  - Small
  - Medium
  - Large
- Additional settings options (Language, Privacy, Storage)
- Back button to dashboard

### About Page
- App logo (CircleAvatar with Flutter icon)
- App name
- Detailed description paragraph
- Version number (1.0.0)
- Features list with checkmarks
- Back button to dashboard

## Navigation

All navigation uses `Navigator.push()` and `MaterialPageRoute`:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProfilePage()),
);
```

Back navigation uses `Navigator.pop()`:

```dart
Navigator.pop(context);
```

## Widgets Demonstrated

✅ Column & Row layouts
✅ Card
✅ ListTile & SwitchListTile
✅ CircleAvatar
✅ Icons
✅ ElevatedButton
✅ AppBar
✅ ListView
✅ RadioListTile
✅ InkWell for tap effects
✅ Gradient backgrounds
✅ State management with StatefulWidget

## Running the App

```bash
flutter pub get
flutter run
```

## Learning Objectives Achieved

✔ Multi-page application structure
✔ Navigator for screen transitions
✔ Code organization in multiple files
✔ Structured layouts with Flutter widgets
✔ Basic UI/UX design patterns
✔ State management basics
