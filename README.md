# 📱 TaskZen - Simplify Tasks, Amplify Focus

**TaskZen** is a modern task management mobile application built with Flutter. It helps users simplify their tasks and amplify focus with an intuitive interface, seamless authentication, and a customizable theme supporting both light and dark modes. The app leverages Firebase for authentication and data storage, and `go_router` for navigation, providing a robust and scalable foundation for task organization.

---

## 📌 Features

### ✅ Core Features

- 🚀 **Splash Screen**

  - Engaging animated splash screen with logo and tagline: _"Simplify tasks, amplify focus"_.
  - Auth status check to redirect to Login or Home.

- 🔐 **Authentication**

  - Email/password login and signup with Firebase Authentication.
  - Password reset via email.
  - Persistent session handling with retry logic for network issues.
  - Error handling with user-friendly toasts using `toasty_box`.

- 📱 **Bottom Navigation**

  - Custom bottom navigation bar with animated icons and labels.
  - Navigation between Home and Profile views.
  - Rounded container design with shadows and semi-transparent background.

- 🎨 **Theming**

  - Light and dark mode support using custom theme constants (`ZColors`, `ZSizes`, `ZTextTheme`).
  - Consistent UI with fade, scale, and slide animations.

- ⚙️ **State Management**

  - `flutter_bloc` for authentication state via `AuthCubit`.
  - Local state for navigation bar selection.

- 🌐 **Navigation**

  - Seamless routing with `go_router` for Splash, Login, Signup, Home, and Profile views.

- 🔥 **Firebase Integration**
  - Authentication with Firebase Auth.
  - User data storage in Firestore.

---

## 🧱 Project Structure

```
lib/
├── core/
│   ├── data/
│   │   └── repositories/
│   │       └── auth_repository.dart
│   ├── utils/
│   │   ├── app_router.dart
│   │   ├── constants/
│   │   │   ├── colors.dart
│   │   │   └── sizes.dart
│   │   └── theme/
│   │       └── custom_themes/
│   │           └── text_theme.dart
├── feature/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── auth_cubit.dart
│   │   │   └── models/
│   │   │       └── user_model.dart
│   │   └── presentation/
│   │       ├── view/
│   │       │   ├── login_view.dart
│   │       │   └── signup_view.dart
│   ├── layout/
│   │   └── presentation/
│   │       └── view/
│   │           └── layout_view.dart
│   ├── home/
│   │   └── presentation/
│   │       └── view/
│   │           └── home_view.dart
│   ├── profile/
│   │   └── presentation/
│   │       └── view/
│   │           └── profile_view.dart
│   ├── splash/
│   │   └── presentation/
│   │       ├── views/
│   │       │   ├── splash_view.dart
│   │       │   └── widgets/
│   │       │       ├── custom_splash_view.dart
│   │       │       └── sliding_text.dart
└── main.dart
```

---

## 🛠️ Getting Started

### Prerequisites

- Flutter: Version 3.24.x or higher
- Dart: Version 3.5.x or higher
- Firebase Account
- Android Studio / VS Code
- Git & CLI tools

### Installation

```bash
git clone https://github.com/your-username/taskzen.git
cd taskzen
flutter pub get
```

#### Firebase Setup

1. Create a Firebase project.
2. Add Android/iOS app and download `google-services.json` or `GoogleService-Info.plist`.
3. Enable Email/Password Authentication and Firestore.
4. Add config files to:
   - `android/app/`
   - `ios/Runner/`

##### Firebase CLI (Optional)

```bash
npm install -g firebase-tools
flutterfire configure
```

### Run the App

```bash
flutter run
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.6.0
  firebase_auth: ^6.4.0
  cloud_firestore: ^6.2.0
  flutter_bloc: ^8.2.0
  equatable: ^2.0.5
  go_router: ^15.0.0
  toasty_box: ^0.0.6
```

## 🚧 Roadmap

- Splash and Authentication Flow
- Themed Navigation and UI
- Firebase Auth and Firestore
- Add Tasks view and task CRUD operations
- Enhanced profile editing
- Offline task storage
- Push notification integration

## 🤝 Contributing

1. Fork the repo
2. Create your feature branch: `git checkout -b feature/your-feature`
3. Commit changes: `git commit -m "Add feature"`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a Pull Request

## 🐞 Issues

Please report issues in the Issues section with:

- Reproduction steps
- Expected vs actual behavior
- Screenshots/logs if applicable

## 📄 License

This project is licensed under the MIT License. See LICENSE for more details.

## 🙏 Acknowledgments

- Flutter
- Firebase
- Flutter Bloc
- go_router
