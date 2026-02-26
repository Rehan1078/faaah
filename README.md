# Faaah 😱

A humorous Flutter package that plays the legendary **"FAAAAH"** meme sound whenever an error occurs in your application. Perfect for developers who want to add a bit of chaotic fun to their debugging and error-handling process.

---

## ✨ Features

- **Global Error Handling:** Automatically trigger the sound on every Flutter framework error.
- **Manual Trigger:** Play the sound on-demand using simple method calls.
- **Easy Integration:** Single-line activation.
- **Audible Debugging:** Know your app crashed even if you aren't looking at the logs.

---

## 🚀 Installation

Add `faaah` to your `pubspec.yaml`:

```yaml
dependencies:
  faaah: ^0.0.1
```

---

## 🛠️ Usage

### Global Sound on Errors

The most popular way to use `faaah` is to enable it globally. Call this in your `main()` before `runApp`.

```dart
import 'package:flutter/material.dart';
import 'package:faaah/faaah.dart';

void main() {
  // Listen to all Flutter errors and play the sound!
  Faaah.enableGlobalErrorSound();
  
  runApp(const MyApp());
}
```

### Manual Playback

You can also trigger the "FAAAAH" sound manually within your custom error handlers or button clicks.

```dart
try {
  // Your risky code here...
} catch (e) {
  Faaah.play();
  // Handle the error...
}
```

---

## 🎮 Example App

Check out the [example project](https://github.com/Rehan1078/faaah/tree/main/example) for a pre-built calculator that triggers the sound on division by zero!

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Made with 😈 by Muhammad Rehan Yousaf*
