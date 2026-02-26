import 'package:flutter/material.dart';
import 'package:faaah/faaah.dart';

void main() {
  // Optional: enable global error sound for real Flutter errors
  Faaah.enableGlobalErrorSound();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FaaahDemoScreen(),
    );
  }
}

class FaaahDemoScreen extends StatelessWidget {
  const FaaahDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAAAAH Demo 😅')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Play the FAAAah sound instantly
            await Faaah.play();
          },
          child: const Text(
            'Press for FAAAah!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}