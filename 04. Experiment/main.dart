import 'package:flutter/material.dart';

// The main function that runs the app
void main() => runApp(MyApp());

// The root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greeting App', // Title of the app
      initialRoute: '/', // Starting route
      routes: {
        '/': (context) => HomeScreen(), // Home screen route
        '/greeting': (context) => GreetingScreen(), // Greeting screen route
        '/about': (context) => AboutScreen(), // About screen route
      },
    );
  }
}

// Home screen where user inputs their name
class HomeScreen extends StatelessWidget {
  final TextEditingController _controller =
      TextEditingController(); // Controller for the text field

  // Function to navigate to the Greeting screen
  void _navigateToGreeting(BuildContext context) {
    // Use named route and pass the entered name as an argument
    Navigator.pushNamed(context, '/greeting', arguments: _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Greeting App')), // App bar title
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text field for user to input their name
            TextField(
              controller: _controller, // Bind the controller to the text field
              decoration: InputDecoration(
                  labelText: 'Enter your name'), // Label for the text field
            ),
            // Button to navigate to the Greeting screen
            ElevatedButton(
              onPressed: () =>
                  _navigateToGreeting(context), // Navigate when pressed
              child: Text('Greet'), // Button text
            ),
            SizedBox(height: 20), // Spacer
            // Button to navigate to the About screen
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                  context, '/about'), // Navigate when pressed
              child: Text('About'), // Button text
            ),
          ],
        ),
      ),
    );
  }
}

// Greeting screen that displays a greeting message
class GreetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the name passed as an argument
    final String name = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Greeting')), // App bar title
      body: Center(
        child: Text(
          'Hello, $name!', // Display the greeting message
          style: TextStyle(fontSize: 24), // Text style
        ),
      ),
    );
  }
}

// About screen that provides information about the app
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')), // App bar title
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding for the text
          child: Text(
            'write about you',
            textAlign: TextAlign.center, // Center align the text
            style: TextStyle(fontSize: 16), // Text style
          ),
        ),
      ),
    );
  }
}
