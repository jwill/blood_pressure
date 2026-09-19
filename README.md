# Blood Pressure Tracker

This is a Flutter application designed for tracking and managing blood pressure records. It provides an intuitive interface for users to log, view, and monitor their blood pressure readings over time.

## Key Features

* **Log Readings:** Easily add new systolic and diastolic blood pressure readings with optional notes.
* **Visualize Data:** View historical trends and list views of your blood pressure entries.
* **Health Connect Integration:** Seamlessly sync blood pressure data with [Android Health Connect](https://developer.android.com/health-and-fitness/guides/health-connect), allowing you to consolidate your health data from various sources.
* **Color-coded Status:** Visual indicators categorize readings (e.g., healthy, elevated, hypertensive) based on standard blood pressure levels.
* **Data Filtering:** Toggle between detailed logs and simplified daily summaries.

## How it works

This application leverages [JNIgen](https://pub.dev/packages/jnigen) to bridge the gap between Dart and the underlying Android Health Connect APIs. By using native Android integration, the app ensures reliable and efficient data exchange with the system's health store.

## Building Bindings

This project uses [JNIgen](https://pub.dev/packages/jnigen) for native Android interoperability. The configuration is managed programmatically in the `tool/jnigen.dart` file.

To regenerate the JNI bindings:

1.  **Run the generator script:**
    ```bash
    dart run tool/jnigen.dart
    ```
2.  **Verify changes:** The generated files will be placed in `lib/gen/`.

See `tool/convert_jnigen.md` for more details on the configuration and migration process.

## Getting Started

1. **Clone the repository.**
2. **Ensure you have a modern Flutter environment** with Android SDK support.
3. **Build the app:** Run `flutter run`.
4. **Grant permissions:** Ensure the app has the necessary permissions to access health data via Health Connect on your Android device.

---

*This project is built with Flutter and utilizes `signals` for state management.*
