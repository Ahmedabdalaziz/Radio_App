# Radio App

A Flutter-based Radio Streaming application that allows users to explore and listen to live radio stations from different countries with an intuitive and responsive user interface.

---

## Features

- **Play Radio Stations**: Stream live radio stations using `just_audio` and `audio_service`.
- **Country-based Filtering**: Browse stations based on country selection.
- **Favorites**: Save and manage favorite radio stations.
- **Theming**: Supports Light and Dark themes.
- **Localization**: Multi-language support using `easy_localization`.
- **Offline Handling**: Handles no internet scenarios gracefully.
- **Responsive UI**: Built with `flutter_screenutil` for adaptive layouts.
- **Dependency Injection**: Managed with `get_it`.
- **Clean Architecture**: Organized by feature and layered for scalability.

---

## Project Structure

```
lib/
 ├── core/
 │   ├── DI/                # Dependency Injection setup
 │   ├── animations/        # Custom animations
 │   ├── helper/            # Utility classes and constants
 │   ├── networking/        # API service and network utilities
 │   ├── routing/           # App routing and navigation
 │   ├── theming/           # App theme and fonts
 │   └── widgets/           # Reusable widgets
 ├── feature/
 │   ├── home/              # Home screen and station list
 │   ├── favorite/          # Favorite stations
 │   ├── settings/          # Theme and language settings
 │   └── error_screen/      # Error handling UI
 ├── generated/             # Generated localization files
 └── main.dart              # Application entry point
```

---

## Requirements

- **Flutter SDK**
- **Dart**

---

## Getting Started

### 1. Clone the repository:
```bash
git clone https://github.com/your-username/Radio_App.git
cd Radio_App
```

### 2. Install dependencies:
```bash
flutter pub get
```

### 3. Generate localization and JSON serializable files:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Run the application:
```bash
flutter run
```

---

## Dependencies

Key packages used in this project:
- **State Management**: `flutter_bloc`, `get_it`
- **Networking**: `dio`, `retrofit`, `pretty_dio_logger`
- **Audio**: `just_audio`, `audio_service`, `just_audio_background`
- **Localization**: `easy_localization`
- **UI Enhancements**: `google_fonts`, `flutter_screenutil`, `shimmer`, `card_swiper`
- **Storage**: `shared_preferences`, `flutter_secure_storage`

Check the full list in [pubspec.yaml](./pubspec.yaml).

---

## API

This app uses the **Radio Browser API**:
```
Base URL: https://de1.api.radio-browser.info/json/stations/
Endpoints:
- GET search?country={country}
```

---

## Localization

Supported Languages:
- English (`en`)
- Arabic (`ar`)

To add more languages:
1. Add new `.arb` files in `l10n/`.
2. Run:
```bash
flutter pub run intl_utils:generate
```

---

## Theming

Supports:
- **Light Theme**
- **Dark Theme**
Users can switch themes from the **Settings Screen**.

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---
