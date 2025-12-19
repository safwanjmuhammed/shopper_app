# 🛍️ Shopper App

A modern Flutter application built using **Clean Architecture**, **Riverpod**, and **Dio**, focusing on scalability, maintainability, and clean state management.

---

## ✨ Features

- Product listing and detail view
- Hero animations
- Clean Architecture (Data / Domain / Presentation)
- State management with Riverpod
- API integration using Dio
- Code generation using Freezed & JsonSerializable

---

## Project Architecture

This project follows Clean Architecture principles.


---

##  Add Base url in .env (Required)


Add .env file with valid base url following example.env : env\.env

---
##  Run Code Generation (Required)

This project uses Freezed and JsonSerializable.

Run before first build:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

This project uses **FVM** to manage the Flutter SDK version.

Run the app using:

```
fvm flutter run
```
## Author

Safwan J Muhammed


