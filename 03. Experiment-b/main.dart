import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _currentInput = "";
  String _operator = "";
  double _firstNumber = 0;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _currentInput = "";
        _operator = "";
        _firstNumber = 0;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
        _firstNumber = double.parse(_currentInput);
        _operator = buttonText;
        _currentInput = "";
      } else if (buttonText == "=") {
        double secondNumber = double.parse(_currentInput);
        if (_operator == "+") {
          _output = (_firstNumber + secondNumber).toString();
        } else if (_operator == "-") {
          _output = (_firstNumber - secondNumber).toString();
        } else if (_operator == "x") {
          _output = (_firstNumber * secondNumber).toString();
        } else if (_operator == "/") {
          _output = (_firstNumber / secondNumber).toString();
        }
        _currentInput = _output;
        _operator = "";
        _firstNumber = 0;
      } else {
        _currentInput += buttonText;
        _output = _currentInput;
      }
    });
  }

  Widget _buildButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(20.0),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Responsive layout calculation
    double buttonHeight = MediaQuery.of(context).size.height / 8;
    double buttonWidth = MediaQuery.of(context).size.width / 4;

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton("7", Colors.blue),
                  _buildButton("8", Colors.blue),
                  _buildButton("9", Colors.blue),
                  _buildButton("/", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("4", Colors.blue),
                  _buildButton("5", Colors.blue),
                  _buildButton("6", Colors.blue),
                  _buildButton("x", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("1", Colors.blue),
                  _buildButton("2", Colors.blue),
                  _buildButton("3", Colors.blue),
                  _buildButton("-", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("C", Colors.red),
                  _buildButton("0", Colors.blue),
                  _buildButton("=", Colors.green),
                  _buildButton("+", Colors.orange),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
