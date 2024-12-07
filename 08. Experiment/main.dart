import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Scale Animation with ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedScaleWidget(),
    );
  }
}

class AnimatedScaleWidget extends StatefulWidget {
  @override
  _AnimatedScaleWidgetState createState() => _AnimatedScaleWidgetState();
}

class _AnimatedScaleWidgetState extends State<AnimatedScaleWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Create an AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeat animation with reverse effect

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scale Animation with Image"),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation, // Apply the scale animation
          child: Image.asset(
            'assets/images.jpg', // Path to your  image
            width: 150, // Set the width of the image
            height: 150, // Set the height of the image
            fit: BoxFit.contain, // Ensures the image fits within the box
          ),
        ),
      ),
    );
  }
}