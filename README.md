# Study Tracker App 📚

A Flutter-based Study Tracker application developed as part of the **Flutter Lab**. The app helps students manage study tasks, monitor their progress, and explore study tips fetched from a REST API.

**Live Demo:** [Study Tracker](https://srihith-2007.github.io/study_tracker/)

**GitHub Repository:** [study_tracker](https://github.com/SRIHITH-2007/study_tracker)

## 🚀 Features

- **Welcome Screen:** Animated introduction with navigation to the main application.
- **Task Management:** Add, complete, and delete study tasks.
- **Form Validation:** Prevents empty task entries and validates task titles.
- **State Management:** Uses the Provider package to manage task data and update the UI.
- **Statistics Dashboard:** Displays total, completed, and pending tasks with progress information.
- **Responsive UI:** Adapts the statistics layout to different screen widths using `MediaQuery` and `LayoutBuilder`.
- **Navigation:** Uses named routes and bottom navigation to access different screens.
- **Study Tips:** Fetches and displays data from a REST API with loading and error-handling states.
- **Themes and Styling:** Uses Material Design widgets, consistent styling, and a coordinated color theme.
- **Automated Testing:** Includes unit tests and widget tests for important application behavior.

## 🛠️ Technologies Used

- **Framework:** Flutter
- **Programming Language:** Dart
- **State Management:** Provider
- **Networking:** HTTP package
- **API:** JSONPlaceholder
- **UI Design:** Material Design
- **Testing:** Flutter Test
- **Version Control:** Git and GitHub
- **Deployment:** GitHub Pages

## 📋 Flutter Lab Experiments

The project incorporates concepts from the following 10 experiments:

| No. | Experiment | Implementation |
|---:|---|---|
| 1 | Introduction to Flutter and Dart Basics | Flutter application structure, Dart classes, and widgets |
| 2 | Flutter Widgets and Layouts | Row, Column, Stack, and Material widgets |
| 3 | Responsive UI Design | MediaQuery and LayoutBuilder for adaptive layouts |
| 4 | Navigation | Navigator, named routes, and bottom navigation |
| 5 | State Management | Stateful and Stateless widgets, setState, and Provider |
| 6 | Custom Widgets, Themes, and Styling | Reusable UI components, Material theme, and styling |
| 7 | Forms, Validation, and Error Handling | Task entry form and input validation |
| 8 | Animations in Flutter | Fade and slide animations on the welcome screen |
| 9 | REST API Integration | HTTP requests, JSON parsing, and Study Tips display |
| 10 | Testing and Debugging | Provider unit tests, widget tests, and Flutter analysis |

## ⚙️ Getting Started

### Prerequisites

Install the following before running the project:

- Flutter SDK
- Dart SDK (included with Flutter)
- Visual Studio Code or Android Studio
- Chrome for running the web version

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/SRIHITH-2007/study_tracker.git
   ```

2. Navigate to the project directory:

   ```bash
   cd study_tracker
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application in Chrome:

   ```bash
   flutter run -d chrome
   ```

## 🧪 Testing and Debugging

Run the static analyzer:

```bash
flutter analyze
```

Run all automated tests:

```bash
flutter test
```

Run the Provider unit tests:

```bash
flutter test test/task_provider_test.dart
```

Run the widget tests:

```bash
flutter test test/widget_test.dart
```

Run the Study Tips API-related tests:

```bash
flutter test test/study_tips_service_test.dart
```

These tests cover selected task-management operations, navigation behavior, JSON parsing, and mocked HTTP responses.

## 📸 Screenshots

### Welcome Screen
![Welcome Screen](screenshots/welcome_screen.png)

### Home Screen
![Home Screen](screenshots/home_screen.png)

### Task Management
![Task Management](screenshots/tasks_screen.png)

### Statistics Dashboard
![Statistics Dashboard](screenshots/statistics_screen.png)

### Study Tips
![Study Tips](screenshots/study_tips_screen.png)

### Task Form Validation
![Task Form Validation](screenshots/task_validation.png)

## 📂 Project Structure

```text
study_tracker/
├── lib/
│   ├── data/
│   ├── models/
│   ├── providers/
│   ├── screens/
│   ├── services/
│   └── main.dart
├── test/
│   ├── widget_test.dart
│   ├── task_provider_test.dart
│   └── study_tips_service_test.dart
├── .github/
│   └── workflows/
├── pubspec.yaml
└── README.md
```

## 🎯 Learning Outcomes

Through this project, the following concepts are practiced:

- Building user interfaces with Flutter and Dart
- Managing application state using Provider
- Navigating between screens using named routes
- Designing responsive layouts
- Validating user input
- Implementing basic Flutter animations
- Fetching and parsing REST API data
- Writing unit and widget tests
- Debugging and analyzing Flutter applications
- Managing source code with Git and GitHub

## 👨‍💻 Author

**Srihith**

B.Tech — Computer Science and Engineering

## 📄 License

This project was developed for educational and academic purposes.