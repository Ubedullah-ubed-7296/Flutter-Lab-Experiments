import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        // Implement a simple evaluation logic here
        display = evaluateExpression(display);
      } else if (buttonText == 'C') {
        display = '0';
      } else {
        display = display == '0' ? buttonText : display + buttonText;
      }
    });
  }

  String evaluateExpression(String expression) {
    // Basic evaluation logic (this can be expanded)
    try {
      final result = double.parse(expression); // Simple example
      return result.toString();
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Display area using a Stack
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                height: 100,
                color: Colors.grey[300],
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  display,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // Buttons using Rows and Columns
          Expanded(
            child: Column(
              children: [
                // First row of buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton('7'),
                    calcButton('8'),
                    calcButton('9'),
                    calcButton('/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton('4'),
                    calcButton('5'),
                    calcButton('6'),
                    calcButton('*'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton('1'),
                    calcButton('2'),
                    calcButton('3'),
                    calcButton('-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton('C'),
                    calcButton('0'),
                    calcButton('='),
                    calcButton('+'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget calcButton(String text) {
    return ElevatedButton(
      onPressed: () => onButtonPressed(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
      ),
    );
  }
}