# Fruit Market

Fruit Market is a Flutter app for browsing, ordering, and receiving fresh, locally-sourced fruits. Designed with clean architecture to ensure scalability, testability, and maintainability.

## Description (GitHub)

Fruit Market — explore seasonal and exotic fruits, add them to your cart, select delivery slots, and make secure payments. Built as a modern, user-friendly shopping experience with clean code and modular components.

## Features

* Searchable catalog with categories and filters
* Detailed product pages (images, prices, descriptions)
* Shopping cart & checkout
* Secure payments (online & cash on delivery)
* Favorites & wish list
* Order tracking & history
* Admin tools for managing products, categories, and orders
* Unit & widget test coverage

## Tech Stack

* Flutter (cross-platform for iOS & Android)
* Dart
* State management: Cubit (flutter\_bloc)
* Networking: Dio / http
* Local storage: Hive / SharedPreferences
* Backend: Firebase or REST API

## Getting Started

### Prerequisites

* Flutter SDK
* Dart SDK
* Android Studio or Xcode

### Installation

```bash
git clone <https://github.com/mo7ammed-hassan/fruit-market.git>
cd fruit_market
flutter pub get
flutter run
```

### Configuration

* Add API keys in `lib/config/constants.dart`
* For Firebase: add `google-services.json` (Android) & `GoogleService-Info.plist` (iOS)
* Set up payment gateway keys in your environment

## Project Structure

```
/lib
  /core
  / config
  /features
  /presentation
  /data
/tests
```

## Running Tests

```bash
flutter test
```

## License

MIT License — see `LICENSE`.

## Contact

Created by **Mohamed** — connect on LinkedIn or open a GitHub issue.
