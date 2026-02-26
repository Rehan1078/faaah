# Faaah 😱

A hilarious and iconic Flutter package that plays the legendary **"FAAAAH"** meme sound whenever an error occurs in your application. Perfect for developers who want to add a bit of chaotic fun to their debugging and error-handling process.

---

## ✨ Features

- **👂 Audible Debugging:** Know your app crashed even if you aren't looking at the logs.
- **🛡️ Global Error Support:** Automatically trigger the sound on every Flutter framework error with one line of code.
- **⚡ Manual Playback:** Programmatically trigger the sound in your own `try-catch` blocks.
- **📦 Package-Friendly:** Correctly handles asset paths so it works as a dependency in any project.
- **🪶 Lightweight:** Minimal impact on app size and performance.

---

## 🚀 Installation

Add `faaah` to your `pubspec.yaml`:

```yaml
dependencies:
  faaah: ^0.0.1
```

Then, run:
```bash
flutter pub get
```

---

## 🛠️ How to Use

### 1. Enable Global Sound (The Popular Way)

Call `Faaah.enableGlobalErrorSound()` in your `main()` before `runApp`. This will hook into the Flutter framework's error handler.

```dart
import 'package:flutter/material.dart';
import 'package:faaah/faaah.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // ⚠️ Must initialize Flutter engine first
  Faaah.enableGlobalErrorSound(); // 😈 Hear the "FAAAAH" on every UI or framework error!
  
  runApp(const MyApp());
}
```

### 2. Manual Trigger

Use this inside your custom error handlers or as a fun interaction.

```dart
import 'package:faaah/faaah.dart';

void riskyOperation() {
  try {
    // Some code that might fail...
  } catch (e) {
   Future.microtask(() async => await Faaah.play()); // ⚠️ Must await the Future
    print("Handled error: $e");
  }
}
```

---

## 🎮 Watch it in Action

Check out the [Example App](https://github.com/Rehan1078/example_faaah) which features a **Calculator** that screams "FAAAAH" when you divide by zero!

---

## 📖 Important Note on Assets

Since this is a package, the assets are managed internally. You **do not** need to add the `.mp3` file to your own `pubspec.yaml`. Just import the package and it works out of the box!

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Created by Muhammad Rehan Yousaf*
