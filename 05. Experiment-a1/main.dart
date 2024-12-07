import 'package:flutter/material.dart';
class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget Example'),
      ),
      body: Center(
        child: Text(
          'Hello, Flutter!', // In this example, MyStatelessWidget does not change after it is built. The text "Hello, Flutter!" is static.
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyStatelessWidget(),
  ));
}