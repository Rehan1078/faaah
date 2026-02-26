import 'package:flutter/material.dart';
import 'package:faaah/faaah.dart';

void main() {
  // Listen to all Flutter errors and play the sound!
  Faaah.enableGlobalErrorSound();
  
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _result = '';

  void _onButtonPressed(String value) async {
    if (value == 'C') {
      setState(() {
        _input = '';
        _result = '';
      });
      return;
    }

    if (value == '=') {
      try {
        // Safe evaluation
        final expression = _input.replaceAll('×', '*').replaceAll('÷', '/');
        final result = _evaluateExpression(expression);
        setState(() {
          _result = result.toString();
        });
      } catch (e) {
        await Faaah.play(); // Meme sound
        setState(() {
          _result = 'FAAAAH! Error';
        });
      }
      return;
    }

    setState(() {
      _input += value;
    });
  }

  double _evaluateExpression(String exp) {
    // Only supports simple arithmetic
    // This is super basic parser for demo purposes
    List<String> operators = ['+', '-', '*', '/'];
    for (var op in operators) {
      if (exp.contains(op)) {
        final parts = exp.split(op);
        if (parts.length != 2) throw Exception('Invalid');
        final a = double.parse(parts[0]);
        final b = double.parse(parts[1]);
        switch (op) {
          case '+':
            return a + b;
          case '-':
            return a - b;
          case '*':
            return a * b;
          case '/':
            if (b == 0) throw Exception('Division by zero');
            return a / b;
        }
      }
    }
    return double.parse(exp);
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAAAAH Calculator 😈')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(12),
              child: Text(_input, style: const TextStyle(fontSize: 28)),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(12),
              child: Text(_result, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ),
            const Divider(),
            Expanded(
              child: Column(
                children: [
                  Row(children: [_buildButton('7'), _buildButton('8'), _buildButton('9'), _buildButton('÷')]),
                  Row(children: [_buildButton('4'), _buildButton('5'), _buildButton('6'), _buildButton('×')]),
                  Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('-')]),
                  Row(children: [_buildButton('0'), _buildButton('C'), _buildButton('='), _buildButton('+')]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}